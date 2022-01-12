require("el").reset_windows()

local builtin = require "el.builtin"
local extensions = require "el.extensions"
local sections = require "el.sections"
local subscribe = require "el.subscribe"
local lsp_statusline = require "el.plugins.lsp_status"
local helper = require "el.helper"
local diagnostic = require "el.diagnostic"

local has_lsp_extensions, ws_diagnostics = pcall(require, "lsp_extensions.workspace.diagnostic")

local git_icon = subscribe.buf_autocmd("el_file_icon", "BufRead", function(_, bufnr)
  local icon = extensions.file_icon(_, bufnr)
  if icon then
    return icon .. " "
  end

  return ""
end)

local git_branch = subscribe.buf_autocmd("el_git_branch", "BufEnter", function(window, buffer)
  local branch = extensions.git_branch(window, buffer)
  if branch then
    return " " .. extensions.git_icon() .. " " .. branch
  end
end)

local git_changes = subscribe.buf_autocmd("el_git_changes", "BufWritePost", function(window, buffer)
  return extensions.git_changes(window, buffer)
end)

local ws_diagnostic_counts = function(_, buffer)
  if not has_lsp_extensions then
    return ""
  end

  local messages = {}

  local error_count = ws_diagnostics.get_count(buffer.bufnr, "Error")

  local x = "⬤"
  if error_count == 0 then
    -- pass
  elseif error_count < 5 then
    table.insert(messages, string.format("%s#%s#%s%%*", "%", "StatuslineError" .. error_count, x))
  else
    table.insert(messages, string.format("%s#%s#%s%%*", "%", "StatuslineError5", x))
  end

  return table.concat(messages, "")
end

local show_current_func = function(window, buffer)
  if buffer.filetype == "lua" then
    return ""
  end

  return lsp_statusline.current_function(window, buffer)
end

local diagnostic_display = diagnostic.make_buffer()

require("el").setup {
  generator = function(window, buffer)
    local items = {
      { extensions.mode, required = true },
      { git_branch },
      { " " },
      { sections.split, required = true },
      { git_icon },
      { sections.maximum_width(builtin.make_responsive_file(140, 90), 0.40), required = true },
      { sections.collapse_builtin { { " " }, { builtin.modified_flag } } },
      { sections.split, required = true },
      { diagnostic_display },
      { show_current_func },
      { lsp_statusline.server_progress },
       -- { ws_diagnostic_counts },
      { git_changes },
      { "[" },
      { builtin.line_with_width(3) },
      { ":" },
      { builtin.column_with_width(2) },
      { "]" },
      {
        sections.collapse_builtin {
          "[",
          builtin.help_list,
          builtin.readonly_list,
          "]",
        },
      },
      { builtin.filetype },
    }

    local add_item = function(result, item)
      table.insert(result, item)
    end

    local result = {}
    for _, item in ipairs(items) do
      add_item(result, item)
    end

    return result
  end,
}

-- local function split(inputstr, sep)
--     if sep == nil then
--         sep = "%s"
--     end

--     local t = {}
--     for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
--         table.insert(t, str)
--     end
--     return t
-- end

-- local function get_lsp_numbers(severity)
--   -- vim.diagnostic.severity.ERROR
--   -- vim.diagnostic.severity.WARN
--   -- vim.diagnostic.severity.INFO
--   -- vim.diagnostic.severity.HINT

--   local diagnostics = vim.diagnostic.get(0, { severity = severity })
--   local count = 0
--   for _ in pairs(diagnostics) do count = count + 1 end

--   return count
-- end

-- local generator = function()
--     local el_segments = {}

--     local extensions = require('el.extensions')
--     table.insert(el_segments, extensions.mode)
    
--     local file_namer = function(_window, buffer)
--       local full_path_to_file = split((buffer.name), "/")
--       local file = full_path_to_file[#full_path_to_file]
--       local full_pwd_path = split(os.getenv("PWD"), "/")
--       local cwd = full_pwd_path[#full_pwd_path]

--       local path = cwd .. "/../" .. file
--       return path
--     end
--     table.insert(el_segments, " ")
--     table.insert(el_segments, file_namer)

--     table.insert(el_segments, " ")
--     table.insert(el_segments, extensions.git_changes)

--     local subscribe = require('el.subscribe')
--     table.insert(el_segments,
--     subscribe.buf_autocmd(
--       "el_lsp_status",
--       "BufWritePre",
--       function(window, buffer)
--         local errors = get_lsp_numbers(vim.diagnostic.severity.ERROR)
--         local warnings = get_lsp_numbers(vim.diagnostic.severity.WARN)
--         local hints = get_lsp_numbers(vim.diagnostic.severity.HINT)

--         local lsp = string.format(" [E: %s W: %s H: %s]", errors, warnings, hints)

--         return lsp
--       end
--     ))
--     return el_segments
-- end

-- require('el').setup {
--     generator = generator
-- }

