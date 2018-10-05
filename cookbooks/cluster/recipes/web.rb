include_recipe 'apache2::default'

template "/var/www/html/index.html" do
  source 'site/index.html.erb'
  owner 'root'
  group node['apache']['root_group']
  mode '0644'
end

