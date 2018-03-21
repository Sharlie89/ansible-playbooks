- hosts: manager
	tasks:
			-name: Installing CEPH in Manager
			 apt:
			 		update_cache: yes
			 		name: ceph

- hosts: all
	tasks:
			-name: Install chrony in Cluster
			 apt: 
			 		update_cache: yes
			 		name: chrony

			-name: Execute sinchrony in Cluster
			 command: rpl "allow 1" "#allow 1" /etc/chrony/chrony.conf

			-name: Create cephadm user
			 user:
			 		name: cephadm
			 		password: '$6$rGfOATGJ.$K4i0tbpvD9/.HM.HzHcEri/./yPPJkIXypYicWtM.Z9jZNgQkNjDZkuVf/oLtaGta3oiJRJVsSip1n4DkDr560'
			 		groups:
			 		 - sudo
			 		state: present
			 		shel: /bin/bash
			 		system: no
			 		createhome: yes
			 		home: /home/cephadm


