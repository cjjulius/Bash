Bash
====

Collections of Bash Scripts

<b>delayedHostCheck.sh</b>

DESC: <br>
Tests if a given host is up and can be resolved to an IP <br>

Accepts the domain, minutes between checks and total number of checks. Writes to a log in starting directory of the name of the domain being checked appended with ".log"
    
EXAMPLE USAGE:<br> 
bash delayedHostCheck.sh ftp.somewhere.com 30 10<br>
<i>Checks ftp.somewhere.com every 30 minutes 10 times.<br>
Outputs to file ftp.somewhere.com.log</i>
