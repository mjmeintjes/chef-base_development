template "/home/vagrant/.bashrc" do
  source "bashrc.erb"
  mode 0440
  owner "vagrant"
  group "vagrant"
end
