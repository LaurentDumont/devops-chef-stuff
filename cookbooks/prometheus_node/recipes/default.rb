#
# Cookbook:: prometheus-node
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

user 'node_exporter' do
  comment 'Node Exporter user'
  shell '/sbin/nologin'
  system true
end

directory '/opt/prom-node-exporter/' do
  mode '0755'
  action :create
end

tar_extract 'https://github.com/prometheus/node_exporter/releases/download/v0.16.0/node_exporter-0.16.0.linux-amd64.tar.gz' do
  target_dir '/opt/prom-node-exporter/'
  creates '/opt/prom-node-exporter/node_exporter'
  tar_flags [ '-P', '--strip-components 1' ]
end

template '/etc/default/node_exporter' do # ~FC033
  source 'node_exporter.erb'
  notifies :reload, 'service[daemon-reload]', :delayed
  notifies :restart, 'service[node_exporter]', :delayed
end

template '/etc/systemd/system/node_exporter.service' do # ~FC033
  source 'node_exporter.service.erb'
  notifies :reload, 'service[daemon-reload]', :immediately
  notifies :restart, 'service[node_exporter]', :immediately
end

execute 'systemctl_reload' do
  command 'systemctl daemon-reload'
end

service 'node_exporter' do
  supports status: true
  action [:enable, :start]
end

service 'daemon-reload' do
  action :nothing
  reload_command 'systemctl daemon-reload'
end
