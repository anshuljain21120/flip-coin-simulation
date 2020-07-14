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
function keep_tossing()
{
	local limit=${1:-10};
	for (( counter=1; counter<=limit; counter++ ))
	do
		echo "$( flip_a_coin )";
	done
}

echo "$( keep_tossing )";
