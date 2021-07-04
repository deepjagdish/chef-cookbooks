#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved. 

# Setting up required attributes 
tomcat_url=node['tomcat']['tomcat_url']
tomcat_version=node['tomcat']['tomcat_version']
tomcat_install_dir=node['tomcat']['tomcat_install_dir']
tomcat_user=node['tomcat']['tomcat_user']
#tomcat_auto_start=node['tomcat']['tomcat_auto_start']

# Create tomcat user 

group "tomcat"

user "tomcat" do
        group "tomcat"
        system true
        shell "/bin/bash"
end 


# create tomcat installation directory 

directory "#{tomcat_install_dir}" do
  owner 'tomcat'
  group 'tomcat'
  mode '0755'
  recursive true
  action :create
end 

## Install Java Version

## Include the dependencies
#include_recipe "java_se"

script "Install Java version" do
 	user "vagrant"
        code <<-EOH
 		sudo yum -y install java-1.7.0-openjdk-devel
	EOH
end


## Download the tomcat package
download_url="#{tomcat_url}"+"v#{tomcat_version}"+"/bin/apache-tomcat-#{tomcat_version}.tar.gz"

script "Download Apache Tomcat version #{tomcat_version}" do
        interpreter "bash"
        user "#{tomcat_user}"
        cwd "/tmp"
        code <<-EOH
                curl  "#{download_url}" --output "/tmp/apache-tomcat-#{tomcat_version}.tar.gz"
        EOH
end


## Extract the package

script "Extracting the Apache Tomcat Package" do
        interpreter "bash"
        user "#{tomcat_user}"
        cwd "/tmp"
        code <<-EOH
                tar -zxvf /tmp/apache-tomcat-#{tomcat_version}.tar.gz -C #{tomcat_install_dir}
        EOH
end 


## Move the unzipped package to /opt/apache/tomcat/apache-tomcat

script "Move the package" do
        interpreter "bash"
        user "#{tomcat_user}"
        cwd "/tmp"
        code <<-EOH
                if [[ ! -d /opt/apache/tomcat/apache-tomcat  ]] ; then
                        cd #{tomcat_install_dir} ; mv apache-tomcat-* apache-tomcat
                else
                        echo "Directory already exists"
                fi
        EOH
end

## Start the tomcat instance


script "Start the tomcat instance" do
        interpreter "bash"
        user "#{tomcat_user}"
        cwd "/tmp"
        code <<-EOH
                /opt/apache/tomcat/apache-tomcat/bin/startup.sh
        EOH
end


