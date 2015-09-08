# -*- mode: ruby -*-
# vi: set ft=ruby :

include 'ecs'

ecs::container::single{ 'ecs-node1':
  directory => '/ecs/node1',
  ethadapter => 'ens33',
  hostname => 'node1',
  ip => '192.168.81.2',
  disks => ['sdb'],
  cluster_ips => ['192.168.81.2']
}
