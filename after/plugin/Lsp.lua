local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  
  'clangd',
  'csharp_ls',
  'lua_ls',
  'luau_lsp',
  'jsonls',
  'opencl_ls',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<S-Space>'] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = cmp.mapping.select_next_item(cmp_select)
cmp_mappings['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select)
cmp_mappings['<S-Space>'] = cmp.mapping.confirm({ select = true }) 

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,opt,{ desc = "Go to Definition (LSP)" })
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,opts,{ desc = "Hover to display (LSP)" })
  vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts,{ desc = "Go to workspace_symbol (LSP)" })
  vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts,{desc = "diagnostic (LSP)" })
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts,{desc = "Next diagnostic (LSP)" })
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts,{ desc = "Previous diagnostic (LSP)"})
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts,{ desc = "code_action (LSP)" })
  vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts,{ desc = "references (LSP)" })
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts,{ desc = "rename (LSP)" })
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts,{ desc = "Help (LSP)" })
end)

lsp.setup()

 vim.diagnostic.config({
     virtual_text = true
 })
local cmp_nvim_lsp = require "cmp_nvim_lsp"

require("lspconfig").clangd.setup {
  on_attach = on_attach,
  capabilities = cmp_nvim_lsp.default_capabilities(),
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}


