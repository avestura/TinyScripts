function Start-Tor {

    $torBrowser     = "D:\Tor Browser"

    $tor_location   = "$torBrowser\Browser\TorBrowser\Tor"
    $torrc_defaults = "$torBrowser\Browser\TorBrowser\Data\Tor\torrc-defaults"
    $torrc          = "$torBrowser\Browser\TorBrowser\Data\Tor\torrc"
    $tordata        = "$torBrowser\Browser\TorBrowser\Data\Tor"
    $geoIP          = "$torBrowser\Browser\TorBrowser\Data\Tor\geoip"
    $geoIPv6        = "$torBrowser\Browser\TorBrowser\Data\Tor\geoip6"

    $controllerProcess = $PID
    $TOR_HOST          = "127.0.0.1"
    $TOR_PORT          = "9150"

    Write-Host "Running Tor in command-line..." -ForegroundColor DarkGray
    & "$tor_location\tor.exe" --defaults-torrc $torrc_defaults -f $torrc DataDirectory $tordata GeoIPFile $geoIP GeoIPv6File $geoIPv6 HashedControlPassword 16:f132bb74458f049260d2aae9c1cdcbc7d74b371e76a5c68598cc6de5c4 +__ControlPort 9151 +__SocksPort "${TOR_HOST}:$TOR_PORT IPv6Traffic PreferIPv6 KeepAliveIsolateSOCKSAuth" __OwningControllerProcess $controllerProcess
    Write-Host "Tor is now running. Tor will work while this window is open." -ForegroundColor Green

}
