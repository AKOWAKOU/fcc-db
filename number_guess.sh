#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate a random secret number between 1 and 1000
SECRET_NUMBER=$((RANDOM % 1000 + 1))

# Prompt the user for a username
echo "Enter your username:"
read USERNAME

# Check if the username exists in the database
USER_DATA=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_DATA ]]
then
  # If the username does not exist, insert a new row into the users table
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 0, 0)")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # If the username exists, retrieve the user's games_played and best_game values from the database
  IFS='|' read -r -a USER_ARRAY <<< "$USER_DATA"
  GAMES_PLAYED=${USER_ARRAY[1]}
  BEST_GAME=${USER_ARRAY[2]}
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Prompt the user to guess the secret number
echo "Guess the secret number between 1 and 1000:"

# Initialize the number of guesses to 0
NUM_GUESSES=0



# Loop until the user guesses the secret number correctly
while true
do
  # Read the user's guess
  read GUESS

  # Increment the number of guesses
  NUM_GUESSES=$((NUM_GUESSES + 1))

  # Check if the guess is an integer
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif ((GUESS < 1 || GUESS > 1000))
  then
    echo "That is not within the range of 1 to 1000, guess again:"
  elif ((GUESS < SECRET_NUMBER))
  then
    echo "It's higher than that, guess again:"
  elif ((GUESS > SECRET_NUMBER))
  then
    echo "It's lower than that, guess again:"
  else
    # If the guess is correct, update the user's games_played and best_game values in the database
    if ((BEST_GAME == 0 || NUM_GUESSES < BEST_GAME))
    then
      UPDATE_USER_RESULT=$($PSQL "UPDATE users SET games_played=games_played+1, best_game=$NUM_GUESSES WHERE username='$USERNAME'")
    else
      UPDATE_USER_RESULT=$($PSQL "UPDATE users SET games_played=games_played+1 WHERE username='$USERNAME'")
    fi

    # Print a congratulatory message with the number of guesses it took
    echo "You guessed it in $NUM_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

    # Exit the loop
    break
  fi
done



