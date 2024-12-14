#!/bin/bash

main () {

        clear
        echo -e "\n"
        echo -e "${magenta}#########################################################${norm}"
        echo -e "#####                                               #####"
        echo -e "#####     ${blue}Welcome to Multiplication Practice!!!${norm}     #####"
        echo -e "#####                                               #####"
        echo -e "${magenta}#########################################################${norm}"

        echo -e
        echo -n "What times table do you want to practice? "
        read tbl

        echo -e "\nYou have chosen the ${green}${tbl}${norm} times table -- Let's Go!!!\n\n"

        score=0

        for var in {1..12}
        do
                prod=$(($tbl*$var))
                echo -n "What is ${tbl} x ${var}? "
                read guess

                if [ $guess -eq $prod ]
                then
                        echo -e "${green}\tCorrect -- Good Job!!!\n${norm}"
                        ((score++))
                else
                        echo -e "${red}\tIncorrect -- Nice try, but the answer is ${prod}\n${norm}"
                fi
        done

        grade=$(echo "scale=1; ${score}/12*100" | bc)
        echo -e "${cyan}\nYou got ${score} correct answers of 12! Your grade is ${grade} %!\n\nGreat Job! Keep Practicing!\n\nLove Always, Dad!!!\n${norm}"

}

red="\e[1;31m"
green="\e[1;32m"
blue="\e[1;34m"
cyan="\e[1;36m"
norm="\e[0m"
magenta="\e[1;35m"
yellow="\e[1;33m"

answer="yes"

while [ $answer == "yes" ]
do
        main
        sleep 5
        echo -e -n "\nDo you want to try again? Type ${yellow}yes${norm} to proceed or any other key(s) to exit: "
        read answer
done

exit
