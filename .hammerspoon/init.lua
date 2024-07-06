-- install `hs` cli tool
hs.ipc.cliInstall()
hs.ipc.cliSaveHistory(true)
hs.ipc.cliSaveHistorySize(999999)

hs.hotkey.bind({ 'command' }, ';', function()
  hs.application.launchOrFocus('/Applications/kitty.app')
end)

hs.hotkey.bind({ 'command' }, "/", function()
  hs.application.launchOrFocus('/Applications/Google Chrome.app')
end)

hs.hotkey.bind({ 'command' }, "'", function()
  hs.application.launchOrFocus('/Applications/WhatsApp.app')
end)

hs.hotkey.bind({ 'command' }, "\\", function()
  hs.application.launchOrFocus('/Applications/Visual Studio Code.app')
end)
