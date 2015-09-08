Simplified ECS Vagrant Deploy
=============================

The installation should be this easy:

```shell
$ vagrant up
```

Yes, that's it.  Feel free to peruse the puppet manifests & shell scripts to
see what's going on under the covers.

EMC Employees
-------------

To my EMC brothers & sisters, when you're on the EMC corporate network (or
our guest network), you're blessed to be protected by EMC's HTTP intercepting
proxy servers, so you need to add one step to the install.

Download the EMC Certificates from within the
[EMC network](http://gso.corp.emc.com/installupdatedcerts.aspx), and place them
into the project directory.

Uncomment the following line from the `Vagrantfile`:

```ruby
config.vm.provision 'shell', path: 'enable_emc_certs.sh'
```

That should inject the EMC certs into the Vagrant image so that you can ECS to
your hearts' delight.
