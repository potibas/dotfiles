hs.hotkey.bind({"command"}, ";", function()
  app = hs.application.find('Alacritty')
  if app and app:isFrontmost() then
    app:hide()
  else
    hs.application.launchOrFocus("/Applications/Alacritty.app")
  end
end)
