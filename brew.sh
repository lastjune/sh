#!/bin/sh
## brew.sh ## A dependency include for checking/installing homebrew
# homebrew - you need this - its a package manager for installing command line tools
#source colors.sh; ##load simple colors scheme
e_error='\x1b[31;01m[error]:\x1b[0m';            # red
e_warn='\x1b[33;01m[warning]:\x1b[0m';           # yellow
e_success='\x1b[32;01m[success]:\x1b[0m';        # green
e_info='\x1b[30;01m[inform]:\x1b[0m';            # black
e_input='\x1b[34;01m[input required]:\x1b[0m';   # blue]]]]]]]]]]'
if [[ $(which brew) ]]
then
    echo -e "$e_success 'homebrew' is already installed: $(which brew)";
    echo -e "$e_warn turn your head and cough!";
    if [[ $(brew doctor)==*"ready to brew." ]]
    then
        echo -e "$e_success you passed brew doctor's exam.";
    else
        echo -e "$e_error 'brew doctor' has some bad news: ";
        brew doctor;
        while true;do
            echo -e "$e_input ignore this and try to move on (not recommended)?";
            read -p ":" yn
            case $yn in
                [Yy]* ) echo -e "$e_warn ignoring above 'brew doctor' complaints..."; return; break;;
                *) echo -e "$e_info let's get this resolved, then try again, shall we?";exit;;
            esac
        done
    fi
else
while true;do
    echo -e "$e_input do you wish to install 'homebrew'(you need this)?";
        read -p ":" yn
        case $yn in
            [Yy]* ) ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
                    brew update && brew upgrade;
                    echo -e "$e_warn turn your head and cough!";
                    if [[ $(brew doctor)==*"ready to brew." ]]
                    then
                        echo -e "$e_success you passed brew doctor's exam.";
                    else
                        echo -e "$e_error 'brew doctor' has some bad news: ";
                        brew doctor;
                        while true;do
                            echo -e "$e_input ignore this and try to move on (not recommended)?";
                            read -p ":" yn
                            case $yn in
                                [Yy]* ) echo -e "$e_warn ignoring above 'brew doctor' complaints..."; return; break;;
                                *) echo -e "$e_info let's get this resolved, then try again, shall we?";exit;;
                            esac
                        done
                    fi;;
            * ) break;;
        esac
done
fi
#echo -e "$e_warn 'sudo echo' will prompt you for password now";
#echo -e "$e_info so (hopefully) you aren't propmted during the script";
#sudo echo -e "$e_info now... go get some coffee or take a nap and come back";

