local path = require("plenary.path").path

local write_count = 0
local git_branch = ""
local status_line = ""
local parts = nil

local function split(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end

    local t = {}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

local function get_file_name()
    local name = vim.fn.bufname()

    if not name or name == "" then
        return "(no name)"
    end

    return name
end

local function get_git_info(force)
    if force or not git_branch or git_branch == "" then
        git_branch = vim.fn["fugitive#head"]()
        if not git_branch or git_branch == "" then
            git_branch = '(no git)'
        end
        git_branch = git_branch
    end

    return git_branch
end

local function lsp_info()

    local warnings = vim.lsp.diagnostic.get_count(0, "Warning")
    local errors = vim.lsp.diagnostic.get_count(0, "Error")
    local hints = vim.lsp.diagnostic.get_count(0, "Hint")

    return string.format("LSP: H %d W %d E %d", hints, warnings, errors)
end

local statusline = "%d    %s    %s    %s"
function StatusLine()
    return string.format(statusline,
        write_count,
        get_file_name(),
        get_git_info(),
        lsp_info(),
        status_line)
end

vim.o.statusline = '%!v:lua.StatusLine()'

vim.api.nvim_exec([[
augroup STATUSLINE
    autocmd!
    autocmd BufWritePre * :lua require("plugin.statusline")
augroup END
 ]], false)
