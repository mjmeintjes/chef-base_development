group node[:mattsum][:group]

chef_gem "ruby-shadow"
include_recipe 'python'
pip_package 'autoenv'


user node[:mattsum][:user] do
  group node[:mattsum][:group]
  system true
  shell "/bin/bash"
  home "/home/#{node[:mattsum][:user]}"
  password "$1$9teDIHue$310PmfM27Dp.1TkLlSstN0"
  supports :manage_home => true
end

group 'sudo' do
  append true
  members node[:mattsum][:user]
  action :modify
end

template "/home/#{node[:mattsum][:user]}/.bashrc" do
  source "bashrc.erb"
  mode 0440
  owner node[:mattsum][:user]
  group node[:mattsum][:group]
end

%w{bash_aliases
bash_autoenv
bash_functions
bash_paths
bash_persistant_history
bash_prompt_setup
bash_tmux
bash_tmuxifier
bash_virtualenv}.each do |file|
  cookbook_file "/home/#{node[:mattsum][:user]}/.bashrc.d/#{file}" do
      source file
      owner node[:mattsum][:user]
      group node[:mattsum][:group]
      mode "0777"
    end
end


cookbook_file "/home/#{node[:mattsum][:user]}/.ssh/authorized_keys" do
  source "authorized_keys"
  owner node[:mattsum][:user]
  group node[:mattsum][:group]
  mode "0600"
end

directory "/home/#{node[:mattsum][:user]}/.ssh" do
  recursive true
  owner node[:mattsum][:user]
  group node[:mattsum][:group]
end

cookbook_file "/home/#{node[:mattsum][:user]}/.ssh/authorized_keys" do
  source "authorized_keys"
  owner node[:mattsum][:user]
  group node[:mattsum][:group]
  mode "0600"
end

cookbook_file "/home/#{node[:mattsum][:user]}/.ssh/authorized_keys2" do
  source "authorized_keys"
  owner node[:mattsum][:user]
  group node[:mattsum][:group]
  mode "0600"
end
