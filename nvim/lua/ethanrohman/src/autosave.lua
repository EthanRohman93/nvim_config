-- autosave.lua
function AutoSave()
    -- Set the update time to 300 ms
    vim.o.updatetime = 300

    -- Define the file extensions for which auto-save should be active
    local allowed_extensions = { 'py', 'tex', 'md' }

    -- Define a function to check the file extension
    function check_extension()
        local bufname = vim.fn.bufname('%')
        local extension = bufname:match('^.+(%..+)$')
        for _, ext in ipairs(allowed_extensions) do
            if extension == '.' .. ext then
                return true
            end
        end
        return false
    end

    -- Create an autocmd to trigger the auto-save function on CursorHold, CursorHoldI, and TextChanged events
    -- but only if the file extension is one of the allowed extensions
    vim.cmd("autocmd CursorHold,CursorHoldI,TextChanged * if luaeval('check_extension()') | write | endif")
end

-- Execute the AutoSave function on VimEnter
vim.cmd("autocmd VimEnter * lua AutoSave()")

-- Activate auto-saving
AutoSave()
