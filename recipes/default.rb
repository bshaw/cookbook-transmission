#
# Cookbook Name:: cookbook-transmission
# Recipe:: default
#

# get the image from dockerhub
docker_image node['transmission']['docker_image']

# run the container
docker_container 'transmission' do
  repo node['transmission']['docker_image']
  tag node['transmission']['image_tag']
  port "#{node['transmission']['host_port']}:#{node['transmission']['container_port']}"
  restart_policy 'always'
  host_name node['transmission']['host_name']
  domain_name node['transmission']['domain_name']
  volumes ["#{node['transmission']['config_volume']}:/config", "#{node['transmission']['downloads_volume']}:/downloads", "#{node['transmission']['incomplete_volume']}:/incomplete", "#node{['transmission']['watch_volume']}:/watch"]
end

# open port in firewall
firewall_rule 'transmission' do
  port node['transmission']['host_port']
  command :allow
end
