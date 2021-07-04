default[:mongo][:user] = "mongoadmin"


default[:mongo][:datadir]= "/var/db/mongodb"
default[:mongo][:pid_dir]= '/var/run/mongodb'
default[:mongo][:config]= "/etc/mongodb.conf"
default[:mongo][:logfile]= "/var/log/mongodb.log"
default[:mongo][:pidfile]= "/var/run/mongodb.pid"
