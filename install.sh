## Varyabol ##
	file=$1
    num=$2        
	p="p"
    hi=$num$p
    path=`pwd`
##############

## Check Bin ##
    check_bin(){
        which tll > /dev/null 2>&1
		    if [ "$?" -eq "1" ]; then
		    sudo ln -s $path/install.sh /usr/local/bin/tll
		    else {
		       which
		    }
		    fi
            }
###############

## Check Bin Termux ##
    check_bin_termux(){
        which tll > /dev/null 2>&1
		    if [ "$?" -eq "1" ]; then
		    ln -s $path/install.sh $PREFIX/bin/tll
		    else {
		       which
		    }
		    fi
            }
######################

## Help ##
	help(){
		echo "usage:
	tll                     # Help (tll -h)
	tll example.txt         # to know how many lines in file
	tll example.txt 3       # to display line number
		"
		}
##########

## Syntax ##
	while getopts ':h|:H|' option; do 
		case $option in
			h|H) 
			help
			exit;;
			\?) 
			echo "Invaled Syntax....."
			help
			exit;;
			esac
			done
############

## TLL ##
	tll(){
	if [ -f '/etc/arch-release' ]; then
	    check_bin
	else
	    if [ "$OSTYPE" == 'linux-android' ]; then
	        check_bin_termux
	    else
	        check_bin
	    fi
	fi
	}
########

## Tool ##
	tll
	if [ -z $1 ];then
	help
	else {
		if [ -z $2 ];then
		wc -l $file | awk '{print $1}'
		else {
		cat $file | sed -n "$hi"
		}
		fi
	}
	fi
##########
# 2024/10/20 02:30