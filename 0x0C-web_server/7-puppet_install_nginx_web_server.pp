# install and configure nginx server

node 'default' {
    package { 'nginx':
        ensure  => installed,
    }
    service { 'nginx':
        ensure  => running,
        enable  => true,
        require => Package['nginx'],
    }
    file { 'index_file':
        ensure  => present,
        path    => '/usr/share/nginx/html/index.html',
        content => 'Hello World!',
    }
    file_line { 'port':
        ensure  => present,
        path    => '/etc/nginx/conf.d/default.conf',
        line    => '    listen\t80;',
        match   => 'listen *80;'
    }
    file_line { 'redirect':
        ensure => present,
        path   => '/etc/nginx/conf.d/default.conf',
        line   => "    location /redirect_me {\n\treturn 301 https://projuanito.com;\n    }\n    location / {\n",
        match  => 'location +/ {',
    }
}
