local function showApplication(name)
  local app = hs.application.find(name)
  if not (app == nil) and not app:isFrontmost() then
    app = hs.application.launchOrFocus('/Applications/' .. name .. '.app')
    app.show()
  end
end

local function toggleApplication(name)
  local app = hs.application.find(name)
  if not (app == nil) and app:isFrontmost() then
    app:hide()
  else
    app = hs.application.launchOrFocus('/Applications/' .. name .. '.app')
    app.show()
  end
end

hs.hotkey.bind({ 'command' }, ';', function()
  toggleApplication('Kitty')
end)

hs.hotkey.bind({ 'command' }, "/", function()
  showApplication('Google Chrome')
end)

hs.hotkey.bind({ 'command' }, "'", function()
  showApplication('WhatsApp')
end)
