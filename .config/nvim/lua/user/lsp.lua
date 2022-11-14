local ok, lsp_installer, cmp_nvim_lsp

ok, _ = pcall(require, "lspconfig")
if not ok then return end

ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not ok then return end

ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then return end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local mappings = {
  ["gd"] = "<cmd>lua vim.lsp.buf.definition()<cr>",
  ["K"] = "<cmd>lua vim.lsp.buf.hover()<cr>",
  ["<c-k>"] = "<cmd>lua vim.lsp.buf.signature_help()<cr>",
}

local function on_attach(_, bufnr)
  for k, m in pairs(mappings) do
    vim.api.nvim_buf_set_keymap(bufnr, "n", k, m, { noremap = true, silent = true })
  end

  vim.cmd [[ command! Format execute 'lua.vim.lsp.buf.formatting()' ]]
end

lsp_installer.on_server_ready(function(server)
  local options = {
    capabilities = capabilities,
    on_attach = on_attach,
  }

  server:setup(options)
end)

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
  update_in_insert = true,
  severity_sort = true,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})
