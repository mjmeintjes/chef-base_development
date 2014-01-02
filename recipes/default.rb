user 'mattsum' do
  group 'mattsum'
  system true
  shell "/bin/bash"
  home "/home/mattsum"
  password "$1$9teDIHue$310PmfM27Dp.1TkLlSstN0"
  supports :manage_home => true
end

group 'sudo' do
  append true
  members 'mattsum'
  action :modify
end

template "/home/mattsum/.bashrc" do
  source "bashrc.erb"
  mode 0440
  owner "mattsum"
  group "mattsum"
end

directory "/home/mattsum/.ssh" do
  recursive true
  owner 'mattsum'
  group 'mattsum'
end

cookbook_file "/home/mattsum/.ssh/authorized_keys" do
  source "authorized_keys"
  owner 'mattsum'
  group 'mattsum'
  mode "0600"
end

cookbook_file "/home/mattsum/.ssh/authorized_keys2" do
  source "authorized_keys"
  owner 'mattsum'
  group 'mattsum'
  mode "0600"
end
