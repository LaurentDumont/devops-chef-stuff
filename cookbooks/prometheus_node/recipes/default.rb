#
# Cookbook:: prometheus-node
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

directory '/opt/prom-node-exporter/' do
  mode '0755'
  action :create
end

tar_extract 'https://github.com/prometheus/node_exporter/releases/download/v0.16.0/node_exporter-0.16.0.linux-amd64.tar.gz' do
  target_dir '/opt/prom-node-exporter/'
  creates '/opt/prom-node-exporter/node_exporter'
  tar_flags [ '-P', '--strip-components 1' ]
end
