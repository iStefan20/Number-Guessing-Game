#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --no-align --tuples-only -c"

echo "Enter your username:"
read USERNAME

# Check if the user exists
USERNAME_AVAILABLE=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")

# If the user doesn't exist, insert a new user
if [[ -z $USERNAME_AVAILABLE ]]
then
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # Get the number of games played and the best game score
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = (SELECT user_id FROM users WHERE username = '$USERNAME')")
  BEST_GAME=$($PSQL "SELECT MIN(number_guesses) FROM games WHERE user_id = (SELECT user_id FROM users WHERE username = '$USERNAME')")

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate a random number between 1 and 1000
RANDOM_NUM=$((1 + $RANDOM % 1000))
GUESS=1
echo "Guess the secret number between 1 and 1000:"

while read NUM
do
  if [[ ! $NUM =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    if [[ $NUM -eq $RANDOM_NUM ]]
    then
      break
    else
      if [[ $NUM -gt $RANDOM_NUM ]]
      then
        echo -n "It's lower than that, guess again:"
      elif [[ $NUM -lt $RANDOM_NUM ]]
      then
        echo -n "It's higher than that, guess again:"
      fi
    fi
  fi
  GUESS=$(( $GUESS + 1))
done

# Provide feedback on number of guesses
if [[ $GUESS -eq 1 ]]
then
  echo "You guessed it in $GUESS try. The secret number was $RANDOM_NUM. Nice job!"
else
  echo "You guessed it in $GUESS tries. The secret number was $RANDOM_NUM. Nice job!"
fi

# Get user ID
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

# Insert the game result into the database
INSERT_GAME=$($PSQL "INSERT INTO games(number_guesses, user_id) VALUES($GUESS, $USER_ID)")
