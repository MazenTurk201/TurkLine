## Varyabol ##
	file=$1
    num=$2        
	p="p"
    hi=$num$p
    path=`pwd`
##############

## Check Bin ##
    check_bin(){
        which tl > /dev/null 2>&1
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
      which tl > /dev/null 2>&1
		    if [ "$?" -eq "1" ]; then
		    ln -s $path/install.sh $PREFIX/bin/tl
		    fi
            }
######################

## Help ##
	help(){
		echo "usage:
	tl                     # Help (tl -h)
	tl example.txt         # to know how many lines in file
	tl example.txt 3       # to display line number
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

## TL ##
	tl(){
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
	tl
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