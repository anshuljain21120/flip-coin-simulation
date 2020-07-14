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
	local limit=${1:-21};
	echo "@Initiating flipping sequence";
	heads_score=1
	tails_score=1
	printf "\n";
	while [ $heads_score -lt $limit -a $tails_score -lt $limit ]
	do
		if [ $( flip_a_coin ) == "Head" ]; then
			((heads_score++));
		else
			((tails_score++));
		fi
	done
	printf "Heads %5s | Tails %5s\n" $heads_score $tails_score;
	if [ $heads_score -gt $tails_score ]
	then
		echo "Heads won by $((heads_score - tails_score ))";
	else
		echo "Tails won by $((tails_score - heads_score ))";
	fi
}

max_score=21;
echo "$( keep_tossing $max_score )";

