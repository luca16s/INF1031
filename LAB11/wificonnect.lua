local function wifi_connected_callback(iptable)
    print("wifi_connected_callback")
    print("ip: " .. iptable.IP)
end
  
  wificonf = {
    ssid = "Hell's Kitchen",
    pwd = "+Bc7A8JNd",
    got_ip_cb = wifi_connected_callback,
    save = false,
  }
  
  wifi.setmode(wifi.STATION)
  wifi.sta.config(wificonf)
