#! /bin/bash -x
echo "Welcome to Flip Coin Simulation!"

function flip_a_coin()
{
	if [ $((RANDOM%2)) -eq 1 ]
	then
		echo "Head";
	else
		echo "Tail";
	fi
}

echo "$( flip_a_coin )";
