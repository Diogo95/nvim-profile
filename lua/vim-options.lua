-- vim.cmd("set expandtab")
-- vim.cmd("set tabstop=2")
-- vim.cmd("set softtabstop=2")
-- vim.cmd("set shiftwidth=2")
vim.g.mapleader=" "
-- Set basic options
vim.opt.scrolloff = 10
vim.opt.relativenumber = true
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.visualbell = true
vim.opt.clipboard:append('unnamedplus') -- Use system clipboard

-- Function to set key mappings
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Tab navigation
map('n', '<A-n>', ':tabnext<CR>')
map('n', '<A-p>', ':tabprev<CR>')

-- Pane navigation
map('n', '<A-h>', '<C-w>h')
map('n', '<A-l>', '<C-w>l')
map('n', '<A-k>', '<C-w>k')
map('n', '<A-j>', '<C-w>j')

-- Jump between methods (NeoVim doesn't have direct equivalents for these actions)
-- You might need to use a plugin or custom function for this
-- map('n', '[[', '<cmd>lua require(\'some_plugin\').method_up()<CR>')
-- map('n', ']]', '<cmd>lua require(\'some_plugin\').method_down()<CR>')

-- Easy visual indentation
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Execute macro saved in 'q' register
map('n', 'qj', '@q')

-- Popup navigation (NeoVim doesn't have direct equivalents for these actions)
-- You might need to use a plugin or custom function for this
-- map('i', '<C-j>', '<cmd>lua require(\'some_plugin\').popup_menu_select_next()<CR>')
-- map('i', '<C-k>', '<cmd>lua require(\'some_plugin\').popup_menu_select_prev()<CR>')

-- Move to start/end of line
map('n', 'gh', '^')
map('n', 'gl', '$')

-- Comment lines (requires a commenting plugin like 'Comment.nvim')
map('n', '<leader>cc', '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>')
map('n', 'gcc', '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>')

-- Jump around with easymotion (requires 'easymotion' plugin)
map('n', '<leader>j', '<Plug>(easymotion-s)')

-- Open NERDTree (requires 'nerdtree' plugin)
map('n', '<leader>x', ':NERDTreeToggle<CR>')

-- Folding (NeoVim doesn't have direct equivalents for these actions)
-- You might need to use a plugin or custom function for this
-- map('n', '<leader>zc', '<cmd>lua require(\'some_plugin\').collapse_all_regions()<CR>')
-- map('n', '<leader>zo', '<cmd>lua require(\'some_plugin\').expand_all_regions()<CR>')

-- Windows
map('n', '<leader><leader>', '<C-W>o') -- Close other windows
map('n', '<leader>T', ':terminal<CR>') -- Open terminal
-- Additional window mappings would require specific plugin support

-- Window splits
map('n', '<leader>wv', ':vsplit<CR>') -- Split vertically
map('n', '<leader>wh', ':split<CR>') -- Split horizontally
map('n', '<leader>wu', '<C-W>o') -- Unsplit (close other splits)
map('n', '<leader>wo', '<C-W>H') -- Move to opposite split

-- Display options (these would require specific plugin support)
-- map('n', '<leader>dd', '<cmd>lua require(\'some_plugin\').toggle_distraction_free()<CR>')
-- map('n', '<leader>dz', '<cmd>lua require(\'some_plugin\').toggle_zen_mode()<CR>')
-- map('n', '<leader>df', '<cmd>lua require(\'some_plugin\').toggle_fullscreen()<CR>')

-- Actions (these would require specific plugin support)
-- map('n', '<leader>am', '<cmd>lua require(\'some_plugin\').show_intention_actions()<CR>')
-- map('n', '<leader>as', '<cmd>lua require(\'some_plugin\').search_everywhere()<CR>')

-- File navigation (these would require specific plugin support)
-- map('n', '<leader>ff', '<cmd>lua require(\'some_plugin\').goto_file()<CR>')
-- map('n', '<leader>fr', '<cmd>lua require(\'some_plugin\').recent_files()<CR>')
-- map('n', '<leader>fc', '<cmd>lua require(\'some_plugin\').find_in_path()<CR>')
-- map('n', '<leader>fl', '<cmd>lua require(\'some_plugin\').recent_locations()<CR>')
map('n', '<leader>fs', ':enew<CR>') -- New scratch file

-- Go to the middle of the file
vim.keymap.set("n", "<leader>m", function()
  local middle_line = math.floor(vim.fn.line('$') / 2)
  vim.cmd.normal({ args = { middle_line .. "G" }, bang = true })
end, { desc = "Jump to middle of file" })

-- map('n', '<leader>pv', '<cmd>lua require(\'some_plugin\').select_in_project_view()<CR>')

-- Information (these would require specific plugin support)
-- map('n', '<leader>;', '<cmd>lua require(\'some_plugin\').file_structure_popup()<CR>')

-- Close active tab
map('n', '<leader>q', ':bd<CR>') -- Close current buffer
map('n', '<leader>Q', ':e #<CR>') -- Reopen closed tab
-- map('n', '<leader>cu', '<cmd>lua require(\'some_plugin\').close_all_unmodified_editors()<CR>')

-- Refactoring (these would require specific plugin support)
-- map('n', '<leader>rn', '<cmd>lua require(\'some_plugin\').rename_element()<CR>')
-- map('n', '<leader>rm', '<cmd>lua require(\'some_plugin\').extract_method()<CR>')
-- map('n', '<leader>rv', '<cmd>lua require(\'some_plugin\').introduce_variable()<CR>')
-- map('n', '<leader>rf', '<cmd>lua require(\'some_plugin\').introduce_field()<CR>')
-- map('n', '<leader>rs', '<cmd>lua require(\'some_plugin\').change_signature()<CR>')
-- map('n', '<leader>rr', '<cmd>lua require(\'some_plugin\').refactorings_quick_list()<CR>')
map('n', '<leader>rl', 'gg=G``') -- Reformat code
-- map('n', '<leader>sw', '<cmd>lua require(\'some_plugin\').surround_with()<CR>')
-- map('n', '<leader>oi', '<cmd>lua require(\'some_plugin\').optimize_imports()<CR>')

-- Go to code (these would require specific plugin support)
-- map('n', '<leader>gd', '<cmd>lua require(\'some_plugin\').goto_declaration()<CR>')
-- map('n', '<leader>gy', '<cmd>lua require(\'some_plugin\').goto_type_declaration()<CR>')
-- map('n', '<leader>gs', '<cmd>lua require(\'some_plugin\').goto_super_method()<CR>')
-- map('n', '<leader>gi', '<cmd>lua require(\'some_plugin\').goto_implementation()<CR>')
-- map('n', '<leader>gu', '<cmd>lua require(\'some_plugin\').show_usages()<CR>')
-- map('n', '<leader>gU', '<cmd>lua require(\'some_plugin\').find_usages()<CR>')
-- map('n', '<leader>gt', '<cmd>lua require(\'some_plugin\').goto_test()<CR>')
map('n', '<leader>h', '<C-o>') -- Go back
map('n', '<leader>l', '<C-i>') -- Go forward

-- Git windows (these would require specific plugin support)
map('n', '<leader>vc', ':Git commit<CR>')
map('n', '<leader>vs', ':Git<CR>')
map('n', '<leader>vb', ':Git branch<CR>')
map('n', '<leader>va', ':Git annotate<CR>')
map('n', '<leader>nw', '<C-W>w') -- Next project window
map('n', '<leader>pw', '<C-W>W') -- Previous project window
map('n', '<leader>wa', ':only<CR>') -- Close all editors but active

-- Errors (these would require specific plugin support)
-- map('n', '<leader>en', '<cmd>lua require(\'some_plugin\').goto_next_error()<CR>')
-- map('n', '<leader>ep', '<cmd>lua require(\'some_plugin\').goto_previous_error()<CR>')
-- map('n', '<leader>ed', '<cmd>lua require(\'some_plugin\').show_error_description()<CR>')

-- Run (these would require specific plugin support)
-- map('n', ',r', '<cmd>lua require(\'some_plugin\').run()<CR>')
-- map('n', ',rc', '<cmd>lua require(\'some_plugin\').run_class()<CR>')
-- map('n', ',rf', '<cmd>lua require(\'some_plugin\').rerun_failed_tests()<CR>')
-- map('n', ',d', '<cmd>lua require(\'some_plugin\').debug()<CR>')
-- map('n', ',b', '<cmd>lua require(\'some_plugin\').build()<CR>')
-- map('n', ',s', '<cmd>lua require(\'some_plugin\').stop()<CR>')

-- Debug (these would require specific plugin support)
-- map('n', '<leader>db', '<cmd>lua require(\'some_plugin\').toggle_line_breakpoint()<CR>')
-- map('n', '<leader>de', '<cmd>lua require(\'some_plugin\').evaluate_expression()<CR>')
-- map('n', '<leader>dR', '<cmd>lua require(\'some_plugin\').remove_all_breakpoints()<CR>')

-- Generate (these would require specific plugin support)
-- map('n', '<leader>ga', '<cmd>lua require(\'some_plugin\').generate()<CR>')

