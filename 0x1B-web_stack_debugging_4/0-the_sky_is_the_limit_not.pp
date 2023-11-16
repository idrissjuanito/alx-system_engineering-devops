# This manifest sets system configs for the number of files that can be opened at once
node default {
    exec { 'edit files':
      command => 'echo "fs.file-max = 70000" >> /etc/sysctl.conf;\
        echo "www-data\tsoft\tnofile\t10000" >> /etc/security/limits.conf;\
        echo "www-data\thard\tnofile\t30000" >> /etc/security/limits.conf;\
        sysctl -p',
      path    => ['/bin', '/sbin'],
    }
    exec { 'restart nginx':
        command => 'nginx -s stop && nginx',
        path    => ['/usr/sbin', '/usr/bin'],
    }
}
