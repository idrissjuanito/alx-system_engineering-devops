# puppet manifest to kill a process using exec
Class default {
    exec {'pkill -9 killmenow':
        path => ['/usr/bin']
    }
}
