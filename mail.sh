#!/bin/bash 

function Use_of_Script_Mail(){
MAIL_ADDERESS= inter the name to send 
echo -e "Hello All,


		This is system generated e-mail, do not reply to this email.
		Partitions on host `/bin/hostname` is reached to the limit 
		Kindly take the necessary action ASAP to avoid future inconvenience.
		
		
		Server Name :- `hostname`
		Server IP :- `ifconfig | grep inet | head -n 1 | awk '{print $2}'`
		
		
		
Thanks & regrads 
Teams Devops" > alert_mail.txt
/bin/mail -s "Memory Utilization on `/bin/hostname` " "$MAIL_ADDERESS " < alert_mail.txt


#yum install mailx -y 