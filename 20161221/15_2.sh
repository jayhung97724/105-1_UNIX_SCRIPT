#!/bin/sh
if [ $# -gt 1 ]
        then
                echo "too many arguments"
                exit 1
        elif [ $# -eq 1 ]
        then
                argument="$1"
        else
                argument="."
fi
if [ -f "$argument" ]
        then
                echo "not a directory"
                exit 1
        elif [ -d "$argument" ]
        then
                directory="$argument"

                # The code in the following 6 lines is used to
                # determine if the directory is empty. If so, a
                # message is displayed to inform the user of it.
                files=`ls "$directory" | wc -w`
                if [ "$files" -eq 0 ]
                        then
                                echo "The $directory is empty. "
                                exit 0
                fi

                count=0
                echo "The empty files in $directory are: "
                # Set command line arguments to file names in the
                # directory and process them one by one
                set `ls "$directory"`
                for file
                do
                        if [ -d "$directory/$file" ]
                                then
                                        count=`expr $count + 1`
                                        set `ls "$directory"`
                                        shift "$count"
                                else
                                        set -- `ls -l "$directory/$file"`
                                        if [ "$4" -eq 0 ]
                                                then
                                                        echo "  $file"
                                                        rm -f "$directory/$file"
                                                        set `ls "$directory"`
                                                        shift "$count"
                                                else
                                                        count=`expr $count + 1`
                                                        set `ls "$directory"`
                                                        shift "$count"
                                        fi
                        fi
                done
            else
                echo "$1 does not exist."
                exit 1
fi
