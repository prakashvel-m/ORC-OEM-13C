#check the status of the agent
./emctl status agent 

#stop agent
./emctl stop agent

#start agent
./emctl start agent

#upload agent
./emctl upload agent

#enable blackout
./emctl start blackout <BLACKOUT_NAME> -nodeLevel -d 1:00

#target status 
./emctl status agent target <taregt_name>,<target_type>

#list targets 
./emctl config agent listtargets

#clear state agent 
./emctl clearstate agent

#clear state target 
./emctl clearstate agent <taregt_name>,<target_type>
