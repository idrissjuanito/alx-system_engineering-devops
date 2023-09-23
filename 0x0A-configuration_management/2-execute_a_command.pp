# puppet manifest to kill a process using exec
node 'default' {
    exec {'kill process':
        command => 'pkill -9 killmenowa',
        path    => ['/usr/bin', '/usr/sbin']
    }
}
