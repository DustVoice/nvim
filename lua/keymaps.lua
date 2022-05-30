-- ===
-- General maps
-- ===
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>lcd', ':lcd %:p:h<CR>', { noremap = true, silent = true })

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

vim.keymap.set('n', '<leader>+', '<C-W>+', { noremap = true })
vim.keymap.set('n', '<leader>-', '<C-W>-', { noremap = true })
vim.keymap.set('n', '<leader><', '<C-W><', { noremap = true })
vim.keymap.set('n', '<leader>>', '<C-W>>', { noremap = true })
vim.keymap.set('n', '<leader>_', '<C-W>_', { noremap = true })
vim.keymap.set('n', '<leader><BAR>', '<C-W><BAR>', { noremap = true })
vim.keymap.set('n', '<leader>=', '<C-W>=', { noremap = true })
vim.keymap.set('n', '<leader>T', '<C-W>T', { noremap = true })

vim.keymap.set('n', '<leader>h', ':noh<CR>')

vim.keymap.set('n', '<leader>.', ':bnext<CR>')
vim.keymap.set('n', '<leader>,', ':bprev<CR>')
-- ===

-- ===
-- Background
-- ===
vim.keymap.set('n', '<leader>bg', ':let &background = ( &background == "dark"? "light" : "dark" )<CR>')
-- ===
