#!/bin/bash

echo "Your age 16 or 65?"
read AGE

if [ $AGE -eq 16 ] || [ $AGE -eq 65 ]
then
    	echo "You right"
else
    	echo "Wrong age"
fi

