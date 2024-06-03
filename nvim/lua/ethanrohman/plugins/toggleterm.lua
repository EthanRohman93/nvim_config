-- Define a custom highlight group for the border
vim.cmd [[
  highlight ToggleTermBorder guifg=orange guibg=#282c34
]]

-- Require toggleterm and set up its configuration
local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  size = 20,
  open_mapping = [[<C-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = false,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = "fish",
  float_opts = {
    border = "single",  -- Changed to single border style
    winblend = 0,
    highlights = {
      border = "ToggleTermBorder",
      background = "Normal",
    },
  },
})

-- Define terminal keymaps
function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Define a general function to toggle terminals by ID
local Terminal = require("toggleterm.terminal").Terminal
_G.terminals = _G.terminals or {}

function _TOGGLE_TERMINAL_BY_ID(id, cmd)
  if not _G.terminals[id] then
    _G.terminals[id] = Terminal:new({
      cmd = cmd,
      hidden = true,
      id = id,
      on_exit = function(term)
        print("Exited terminal " .. id .. " with exit code: " .. term.exit_code)
      end
    })
  end
  _G.terminals[id]:toggle()
end

-- Setup keybindings for different terminals
for i = 1, 9 do
  vim.api.nvim_set_keymap('n', '<leader>t' .. i, "<cmd>lua _TOGGLE_TERMINAL_BY_ID(" .. i .. ", 'fish')<CR>", { noremap = true, silent = true, desc = "Toggle terminal " .. i })
end

