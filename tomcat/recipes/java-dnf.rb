#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved. 

# Setting up required attributes 

## Install Java Version

## Include the dependencies
#include_recipe "java_se"

#script "Install Java version" do
# 	user "vagrant"
#        code <<-EOH
# 		puts 'yum -y install #{tomcat_java_version}'
#	EOH
#end 

dnf_package ['java-1.7.0-openjdk-devel.x86_64', 'wget'] do
	action :install
end
