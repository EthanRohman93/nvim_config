function ColorMyPencils(color)
  color = color or "onedark"
  vim.cmd("colorscheme " .. color)

  -- Ensure the background settings are reapplied every time the colorscheme changes
  vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })  -- Non-current window
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })  -- Floating windows
end

vim.cmd("autocmd VimEnter * lua ColorMyPencils()")
vim.cmd("autocmd ColorScheme * :lua ColorMyPencils()")
