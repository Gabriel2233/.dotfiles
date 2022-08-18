local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_ignore_patterns = { '.git' },
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<Leader>q"] = "close",
                ["<C-h>"] = "which_key",

                ["<C-o>"] = "preview_scrolling_down",
                ["<C-p>"] = "preview_scrolling_up"
            },
            n = {
                ["<Leader>q"] = "close",
                ["<C-h>"] = "which_key",

                ["<C-o>"] = "preview_scrolling_down",
                ["<C-p>"] = "preview_scrolling_up"
            },
        }
    },
}

local M = {}

M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        cwd = "/home/gabriel/.dotfiles",
        hidden = true,
    })
end

return M
