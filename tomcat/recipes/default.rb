#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved. 

# Setting up required attributes 

default['tomcat_v10']['tomcat_version']="10.0.7"
default['tomcat_v10']['tomcat_install_dir']="/opt/apache/tomcat"

default['tomcat_v10']['tomcat_url']="https://archive.apache.org/dist/tomcat/tomcat-10/v10.0.7/"

default['tomcat_v10']['tomcat_user']="tomcat" 

# Create tomcat user 

group "tomcat"

user "tomcat" do
        group "tomcat"
        system true
        shell "/bin/bash"
end
