#!/bin/bash

echo "How much RAM needs this pc?"
read RAM

if [ $RAM -gt 4 ] && [ $RAM -lt 16 ]
then
	echo "You right"
else
	echo "You wrong"
fi
