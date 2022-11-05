hs.hotkey.bind({"command"}, ";", function()
  app = hs.application.get('Kitty')
  if app ~= nil and app:isFrontmost() then
    app:hide()
  else
    hs.application.launchOrFocus("/Applications/Kitty.app")
  end
end)
