# puppet manifest to kill a process using exec
Class default {
    exec {'kill process':
        command => ['/bin/pkill -9 killmenowa',
        path    => ['/usr/bin'],
    }
}
