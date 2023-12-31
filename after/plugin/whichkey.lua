
local M = {
  "folke/which-key.nvim",
}

function M.config()
  local mappings = {
    ["<leader>"] = {
      l = {
        name = "+LSP",
        gd = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Go To Definition" },
        K = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Code Action" },
        ["[d"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
        ["]d"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous Diagnostic" },
        ["<leader>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        ["<leader>rr"] = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
        ["<leader>rn"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        ["<C-h>"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Help" },
      },
    },
  }

   require("which-key").register(mappings, { mode = "n", prefix = "<leader>" })
end


