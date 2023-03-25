#!/bin/bash 

while read line 
do 
  rpm -qa | grep -w $line 
done <input.txt

#or 

echo -e "wget 
vim 
curl 
mlocate 
httpd 
mailx" | while read line; do rpm -qa | grep -w $line; done  



#or 


#!/bin/bash 

while read line
do
  rpm -qa | grep -w $line > /dev/null 2>&1
  if [[  $? == 0 ]]
  then 
     echo "package $line is already install "
  else 
	echo "package is not install"
	echo "installing package"
	yum -y install $line 
done<input.txt	


