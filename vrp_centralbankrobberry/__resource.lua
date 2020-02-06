resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

dependency "vrp"

client_scripts{ 
  "lib/Proxy.lua",
  "lib/Tunnel.lua",
  "client.lua",
  "InteractSound/client/main.lua",
}
  
server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua",
  "InteractSound/server/main.lua",
}

ui_page("InteractSoundclient/client/html/index.html")

files({
  "InteractSound/client/html/index.html",
  "InteractSound/client/html/sounds/allarm.ogg",
  "InteractSound/client/html/sounds/drill.ogg",
})

------
-- InteractSound by Scott
-- Verstion: v0.0.1
------