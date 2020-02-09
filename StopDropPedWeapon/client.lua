Citizen.CreateThread(function()
  while true do
    Citizen.Wait(500)
    RemoveAllPickupsOfType(0xDF711959)
    RemoveAllPickupsOfType(0xF9AFB48F)
    RemoveAllPickupsOfType(0xA9355DCD)
  end
end)
