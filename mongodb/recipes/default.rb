#
# Cookbook:: mongodb
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved. 

#if node['platform'] == 'centos'
#	yum_package ['mongodb-org', 'wget'] do
#		action :install
#	end
#end


#if node['platform'] == 'ubuntu'
#        apt_update
#	apt_package ['openjdk-8-jdk', 'wget'] do
#		action :install
#        end
#end



yum_repository 'mongodb-org-4.0' do
  description 'MongoDB Repo'
  baseurl 'https://repo.mongodb.org/yum/redhat/7/mongodb-org/4.4/x86_64/'
  gpgcheck false
  enabled true
end

package 'mongodb-org' do 
  action :install
end

script "Start the mongo db instance" do
        interpreter "bash"
        cwd "/tmp"
        code <<-EOH
                sudo service mongod start
		sudo chkconfig mongod on
        EOH
end
