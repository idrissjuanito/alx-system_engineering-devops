# configures ssh_config to use certain private key
# and ensure no password authentication
node 'default' {
	file_line { 'ssh_config':
		ensure => present,
		path   => '/etc/ssh/ssh_config',
		line   => 'IdentityFile ~/.ssh/school',
		match  => '^#?\ IdentityFile',
	}
	file_line { 'passauth':
		ensure => present,
		path   => '/etc/ssh/ssh_config',
		line   => 'PasswordAuthentication no',
		match  => '^#?\ PasswordAuthentication',
	}
}
