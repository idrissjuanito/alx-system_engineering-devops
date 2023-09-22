# creates a file in tmp folder
node 'default' {
    file {'/tmp/school':
        ensure  => 'present',
        owner   => 'www-data',
        group   => 'www-data',
        mode    => '0744',
        content => 'I love Puppet',
    }
}
