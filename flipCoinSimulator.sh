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
function absolute()
{
	if [ $1 -lt 0 ]
	then
		echo "$(($1 * -1))";
	else
		echo "$1";
	fi
}
function keep_tossing()
{
	local limit=${1:-21};
	local max_possible_difference=${2:-2};
	echo "@Initiating flipping sequence";
	heads_score=1;
	tails_score=1;
	score_difference=0;
	printf "\n";
	while [ $heads_score -lt $limit -a $tails_score -lt $limit ]
	do
		if [ $( flip_a_coin ) == "Head" ]; 
		then
			((heads_score++));
		else
			((tails_score++));
		fi

		score_difference=$( absolute $((heads_score - tails_score)) );

		if [ $score_difference -eq 0 ]
		then
			while [ $score_difference -lt $max_possible_difference ]
			do
				if [ $( flip_a_coin ) == "Head" ]; 
				then
					((heads_score++));
				else
					((tails_score++));
				fi
				score_difference=$( absolute $((heads_score - tails_score)) );
			done
			break;
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

