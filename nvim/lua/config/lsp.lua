vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true })
vim.keymap.set("n", "gk", vim.lsp.buf.hover, { noremap = true, silent = true })

vim.opt.winborder = "rounded"

local lsp_languages = { "typescript", "lua", "go" }

for _, lsp_language in pairs(lsp_languages) do
  vim.lsp.enable(lsp_language)
end
