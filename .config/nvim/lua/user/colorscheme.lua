local colorscheme = "darkplus"

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  vim.cmd("colorscheme darkblue")
else
  vim.cmd [[ highlight CursorLine ctermbg=236 guibg=#3a3a3a ]]
  vim.cmd [[ highlight CursorLineNr ctermfg=231 ctermbg=240 guifg=#ffffff guibg=#585858 ]]
  vim.cmd [[ highlight LineNr ctermfg=243 ctermbg=235 guifg=#767676 guibg=#262626 ]]
end
