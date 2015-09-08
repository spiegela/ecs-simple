update-ca-trust enable
cp /vagrant/EMC*.cer /etc/pki/ca-trust/source/anchors/
update-ca-trust extract
