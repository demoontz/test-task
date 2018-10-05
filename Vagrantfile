Vagrant.configure("2") do |config|

  config.vm.provider :virtualbox do |vbox|
    vbox.customize ['modifyvm', :id, '--memory', '1024']
    vbox.customize ['modifyvm', :id, '--cpus', '1']
  end

  config.vm.define "haproxy" do |haproxy|
    haproxy.vm.box = "centos/7"
    haproxy.vm.network :forwarded_port, guest: 8080, host: 9080
    haproxy.vm.network :private_network, ip: "172.28.33.10"
    haproxy.vm.provision :chef_solo do |chef|
        chef.add_recipe "cluster::haproxy"
    end
  end

  config.vm.define "web1" do  |web1|
    web1.vm.box = "centos/7"
    web1.vm.network :forwarded_port, guest: 8080, host: 9081
    web1.vm.network :private_network, ip: "172.28.33.11"
    web1.vm.provision :chef_solo do |chef|
        chef.add_recipe "cluster::web"
        chef.json = { :apache => { :default_site_enabled => true, :id_node => '1' } }
    end
  end

  config.vm.define "web2" do |web2|
    web2.vm.box = "centos/7"
    web2.vm.network :forwarded_port, guest: 8080, host: 9082
    web2.vm.network :private_network, ip: "172.28.33.12"
    web2.vm.provision :chef_solo do |chef|
        chef.add_recipe "cluster::web"
        chef.json = { :apache => { :default_site_enabled => true, :id_node => '2' } }
    end
  end

  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "centos/7"
    jenkins.vm.network :forwarded_port, guest: 8080, host: 9085
    jenkins.vm.network :private_network, ip: "172.28.33.15"
    jenkins.vm.provision :chef_solo do |chef|
        chef.add_recipe "cluster::jenkins"
    end
  end
end