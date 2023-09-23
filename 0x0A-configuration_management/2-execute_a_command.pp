# puppet manifest to kill a process using exec
exec {'pkill -9 killmenow':
    path => ['/usr/bin']
}
