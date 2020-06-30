  
#
# Cookbook:: cookbooktest
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
execute "apt-get update" do
 command "apt-get update"
end
apt_package "tomcat8" do
  action :install
 end
#apt-get install tomcat8
#apt_package "default-jdk" do
#  action :install
#end
