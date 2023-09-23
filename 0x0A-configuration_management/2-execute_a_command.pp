# puppet manifest to kill a process using exec
Class default {
    exec {'pkill killmenow':
        path => ['/usr/bin']
    }
}
