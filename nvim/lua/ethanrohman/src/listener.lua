-- Function to be called on CursorHold
function on_cursor_hold()
  if not auto_save_enabled then
    return
  end
  local file_path = vim.fn.expand('%:p')  -- Full path to the current file
  local ext = vim.fn.fnamemodify(file_path, ":e")  -- Extract file extension
  
  -- Only save if the file is in the target directory and has .tex extension
  if string.match(file_path, "/Users/ethanrohman/Desktop/s1/") and ext == "tex" then
    save_buffer()
  end
end

-- Attach the on_cursor_hold function to the CursorHold event
vim.api.nvim_exec([[
  autocmd CursorHold * lua on_cursor_hold()
]], false)

-- Attach the on_cursor_hold function to the CursorHoldI event for insert mode
vim.api.nvim_exec([[
  autocmd CursorHoldI * lua on_cursor_hold()
]], false)

-- Set CursorHold time (in milliseconds)
vim.o.updatetime =  300-- e.g., 300ms
