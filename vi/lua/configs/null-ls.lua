-- print("ll")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require'null-ls'

local function format_on_save(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    -- Format on save
    vim.api.nvim_clear_autocmds {
      group = augroup,
      buffer = bufnr,
    }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format{ bufnr = bufnr }
      end,
    }
    )
  end
end

local opts = {
  sources = {
    null_ls.builtins.formatting.clang_format,
  },
  -- on_attach = format_on_save
}

return opts

