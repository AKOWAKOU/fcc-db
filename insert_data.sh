#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
# TRUCANTE TABLES
echo -e "\n~~ Feeding WorldCup database ~~\n"

echo $($PSQL "TRUNCATE games, teams")
echo -e "\nTruncating Games and Teams tables"

cat games.csv | while IFS=(',') read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
  do
    if [[ $YEAR != year ]]
      then
      # GET WINNER_ID
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name LIKE '$WINNER'")
      # IF NOT NULL
        if [[ -z $WINNER_ID ]]
        then
        # INSERT WINNER
        RESULT_INSERT_WINNER=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")
        if [[ $RESULT_INSERT_WINNER == 'INSERT 0 1' ]]
          then
            echo -e "\nInserted team: $WINNER into teams table"
          fi
        # GET WINNER_ID
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name LIKE '$WINNER'")
        fi
        # GET OPPONENT_ID
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name LIKE '$OPPONENT'")
        # IF NOT NULL
        if [[ -z $OPPONENT_ID ]]
          then
          # INSERT OPPONENT
          RESULT_INSERT_OPPONENT=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")
        if [[ $RESULT_INSERT_OPPONENT == 'INSERT 0 1' ]]
          then
            echo -e "\nInserted team: $OPPONENT into teams table"
          fi
        # GET OPPONENT_ID
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name LIKE '$OPPONENT'")
        fi
      # INSERT GAME
        RESULT_INSERT_GAME=$($PSQL "INSERT INTO games 
        (year, round, winner_id, opponent_id, winner_goals, opponent_goals) 
        VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
        if [[ $RESULT_INSERT_GAME == 'INSERT 0 1' ]]
          then
            echo -e "\nInserted game: $WINNER X $OPPONENT into games table"
          fi

      fi

  done