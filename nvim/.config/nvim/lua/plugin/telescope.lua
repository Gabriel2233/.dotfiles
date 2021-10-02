local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_ignore_patterns = {"node_modules", ".git", ".autoload"},
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        }
    },
}

local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "~/.dotfiles/nvim",
    })
end

return M
