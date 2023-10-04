# install and configure nginx

$config_str = @("NCONF")
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    server_name localhost;
    add_header X-Served-By $hostname;

    root /usr/share/nginx/html;
    error_page 404 /404.html;

    location / {
        index index.html;
    }
    location /redirect_me {
        return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
    }
    location = /404.html {
        index 404.html;
    }
}
| NCONF

node 'default' {
    exec { "update":
        command => "/usr/bin/apt-get update -y",
    }
    package { "nginx":
        ensure  => latest,
        require => Exec['update'],
    }
    service { "nginx":
        ensure  => running,
        enable  => true,
        require => Package['nginx'],
    }
    file { "/etc/nginx/sites-enabled/default":
        ensure  => absent,
    }
    exec { "reload":
        command     => "/usr/sbin/nginx -s reload",
        subscribe   => File["/etc/nginx/conf.d/default.conf"],
        refreshonly => true,
    }
    file { "/etc/nginx/conf.d/default.conf":
        ensure  => present,
        content => $config_str,
        require => Service['nginx'],
    }
    file { "/usr/share/nginx/html/index.html":
        ensure  => present,
        content => "Hello World!\n",
        require => Package['nginx'],
    }
    file { "/usr/share/nginx/html/404.html":
        ensure  => present,
        content => "Ceci n'est pas une page\n",
        require => Package['nginx'],
    }
}
