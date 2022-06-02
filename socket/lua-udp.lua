#!/usr/bin/env lua5.3
--
-- apt install lua5.3 lua-socket
--

local socket = require("socket")
local udp = assert(socket.udp())
local data

udp:settimeout(1)
assert(udp:setsockname("*",0))
assert(udp:setpeername("127.0.0.1",51180))

for i = 0, 2, 1 do
  assert(udp:send("ping"))
  data = udp:receive()
  if data then
    break
  end
end


if data == nil then
  print("timeout")
else
  print(data)
end
