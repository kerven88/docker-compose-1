order trojan before reverse_proxy
order teapot after trojan

trojan {
    caddy
    no_proxy
    users {$TROJAN_PASSWORD:thisisunsafe}
}

log trojan {
    include caddy.listeners.trojan
    format console {
        time_format "iso8601"
    }
    output file "/data/logs/trojan.log" {
        roll_size 100mb
        roll_keep 3
        roll_keep_for 7d
    }
}

servers :6666 {
    listener_wrappers {
        trojan
    }
    protocols h1 h2 h3
}