{$TELEGRAM_DOMAIN} {
    reverse_proxy https://api.telegram.org

    import ACME_HTTP TLS_1.3
    import LOG_FILE "{$TELEGRAM_DOMAIN}"
}
