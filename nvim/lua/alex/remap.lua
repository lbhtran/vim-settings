local nnoremap = require("alex.keymap").nnoremap
local vnoremap = require("alex.keymap").vnoremap

nnoremap("<Space>", "<Nop>")

-- NvimTree
nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>po", "<cmd>NvimTreeToggle<CR>")

-- NERDCommenter
nnoremap("<leader>/", "<Plug>NERDCommenterToggle")
vnoremap("<leader>/", "<Plug>NERDCommenterToggle<CR>gv")

-- Neogen
nnoremap("<leader>nf", ":lua require('neogen').generate()<CR>")
--nnoremap("<leader>nf", "<Plug>Neogen<CR>")


local keyset = vim.keymap.set
-- Auto complete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: There's always complete item selected by default, you may want to enable
-- no select by `"suggest.noselect": true` in your configuration file.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice.
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)


local builtin = require("telescope.builtin")
nnoremap("<leader>ff", builtin.find_files)
nnoremap("<leader>fg", builtin.live_grep)
nnoremap("<leader>fb", builtin.buffers)
nnoremap("<leader>fh", builtin.help_tags)
