# -*- mode: ruby -*-
# vi: set ft=ruby :

include 'ecs'

ecs::container::single{ 'ecs-node1':
  directory => '/ecs/node1',
  # For Virtualbox use ens33
  # ethadapter => 'enp0s8',
  # For Fusion use ens33
  ethadapter => 'ens33',
  # For others, "vagrant ssh" into your machine to check.
  hostname => 'node1',
  ip => '192.168.80.2',
  disks => ['sdb'],
  cluster_ips => ['192.168.80.2']
}
