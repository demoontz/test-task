package 'java-1.8.0-openjdk'
include_recipe 'jenkins::master'

directory '/var/lib/jenkins/jobs' do
  owner 'jenkins'
  group 'jenkins'
  mode '0755'
  action :create
end

directory '/var/lib/jenkins/jobs/task1' do
  owner 'jenkins'
  group 'jenkins'
  mode '0755'
  action :create
end

template "/var/lib/jenkins/jobs/task1/config.xml" do
  source 'jenkins/config.xml.erb'
  owner 'jenkins'
  group 'jenkins'
  mode '0644'
end

jenkins_command 'reload-configuration' do
  retries  5
  retry_delay 10
end
