resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

dependency "vrp"

client_scripts{ 
  "client.lua",
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua",
}