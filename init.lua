

-- Key mappings
local opts = { noremap = true }


-- Essential Mappings
-- Remap <leader> and <localleader> to <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Move lines up and down
vim.keymap.set( 'n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true } )
vim.keymap.set( 'n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true } )
vim.keymap.set( 'v', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true } )
vim.keymap.set( 'v', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true } )
vim.keymap.set( 'i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true } )
vim.keymap.set( 'i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true } )

-- Set 'j' and 'k' to 'gj' and 'gk' respectively
vim.keymap.set('', 'j', "(v:count == 0 ? 'gj' : 'j')", { noremap = true, expr = true } )
vim.keymap.set('', 'k', "(v:count == 0 ? 'gk' : 'k')", { noremap = true, expr = true } )

-- Press '<esc>' in TERMINAL mode to return to NORMAL mode
vim.keymap.set( 't', '<ESC>', '<C-\\><C-N>', opts )

-- Quick edit and quick update config file
vim.keymap.set( 'n', '<leader>v', ':edit $MYVIMRC<CR>', opts )
vim.keymap.set( 'n', '<leader>s', ':source $MYVIMRC<CR>', opts )

-- Quick way to supress search highlighting
vim.keymap.set( 'n', '<leader>h', ':noh<CR>', opts )

-- Quick insert space
vim.keymap.set( 'n', '<C-Space>', 'i <ESC>')


-- Other Mappings

-- Write current date and time
vim.keymap.set( 'n', '<F12>', '"=strftime("%d/%m/%Y %X")<CR>P', opts )
vim.keymap.set( 'i', '<F12>', '<ESC>"=strftime("%d/%m/%Y %X")<CR>po', opts )

-- Enable ctrl-C ctrl-V for copy and paste
vim.keymap.set( '', '<C-c>', '"+ygv', opts )
vim.keymap.set( 'i', '<C-v>', '<ESC>:set paste<CR>a<C-r>+<ESC>:set nopaste<CR>a', opts )

-- Open new tab with a terminal
vim.keymap.set( 'n', '<leader>t', ':tabe<CR>:te<CR>i', opts )

-- Use ',' to enter COMMAND mode
vim.keymap.set( 'n', ',', ':', opts )

-- Set cwd to current file's location
vim.keymap.set( 'n', '<leader><leader>cd', ':cd %:p:h<CR>:pwd<CR>', opts )


-- Set interface language to English 
vim.api.nvim_exec( 'language en_US', true )

-- Enable filetype detection etc
vim.cmd [[ filetype plugin indent on ]]
vim.cmd [[ syntax enable ]]

-- Set spell checker by default on Markdown and LaTeX files.
-- vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*.md", "*.tex" }, command = "setlocal spell spelllang=en_us" })
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*.md", "*.tex" }, command = "setlocal spell" })


-- Toggle line numbers
vim.opt.relativenumber  = true
vim.opt.number          = true

-- set tab width
vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4

-- Other options
vim.opt.expandtab   = true  -- Expand tab characters to spaces
vim.opt.autoindent  = true  -- toggle auto indentation
vim.opt.smartindent = true  -- toggle smart indentation
vim.opt.wrap        = true  -- toggle text wrapping
vim.opt.linebreak   = true  -- line breaks at special characters only

vim.opt.guicursor   = ""
vim.opt.guifont     = "Consolas:h14"

vim.opt.modifiable  = true
vim.opt.scrolloff   = 1

vim.opt.mouse       = "a"
vim.opt.swapfile    = false



-- Create LaTeX environment from name
vim.keymap.set( 'n', '<leader>e', 'ciw\\begin{}<Enter>\\end{}<Esc>Pk$P$', { noremap = true, silent = true } )

-- Put environment arround existing text
vim.keymap.set( 'v', '<leader>a', '"ac', { noremap = true, silent = true } )
vim.keymap.set( 'n', '<leader>o', 'ciw\\begin{}<Enter>\\end{}<Esc>Pk$P$"apk$', { noremap = true, silent = true } )



local Plug = vim.fn['plug#']

vim.call('plug#begin', '$XDG_CONFIG_HOME/nvim/plugged')

    -- Look and feel
    Plug 'itchyny/lightline.vim'
    Plug( 'sonph/onehalf', {rtp = 'vim/'} )
    Plug 'mhinz/vim-startify'
    -- ----------


    -- Navigation
    Plug 'ggandor/leap.nvim'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'preservim/tagbar'
    -- ----------


    -- Edition and Completion
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'neoclide/coc.nvim'
    -- ----------


    -- Debugging
    Plug 'puremourning/vimspector'
    -- ----------


    -- Git integration
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'shumphrey/fugitive-gitlab.vim'
    -- ----------
    

    -- Language extensions
    Plug 'rust-lang/rust.vim'           -- rust

    Plug 'JuliaEditorSupport/julia-vim' -- julia

    Plug 'lervag/vimtex'                -- LaTeX

    Plug 'jakewvincent/mkdnflow.nvim'   -- Markdown
    Plug 'nvim-lua/plenary.nvim'        -- needed by mkdnflow.nvim
    -- ----------


    -- Creative writing
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'ron89/thesaurus_query.vim'
    -- ----------
    
vim.call('plug#end')



-- Netrw config
vim.g['netrw_home']	= '$HOME'
vim.g['netrw_banner'] = 0
vim.g['netrw_keepdir'] = 1
-- ----------


-- onehalf config
vim.api.nvim_exec( 'colorscheme onehalfdark', true )
-- ----------


-- Goyo config
vim.api.nvim_create_autocmd("User", { pattern = "GoyoEnter", command = "Limelight" })
vim.api.nvim_create_autocmd("User", { pattern = "GoyoLeave", command = "Limelight!" })
-- ----------


-- Startify config
vim.keymap.set( 'n', '<leader>n', ':tabe<CR>:Startify<CR>', opts )
vim.g['startify_session_persistence'] = 1
-- ----------


-- rust.vim config
vim.g['rustfmt_autosave'] = 1
-- ----------


-- tagbar config
vim.keymap.set( 'n', '<F8>', ':TagbarToggle<CR>', opts )
vim.g['tagbar_ctags_bin'] = 'C:\\Users\\vale_je\\ctags\\ctags.exe'
-- ----------


-- leap config
require('leap').add_default_mappings()
-- ----------


-- COC config
require('coc-config')
vim.keymap.set( 'n', '<leader>d', ':CocDisable<CR>', { noremap = true, silent = true } )
-- ----------


-- vimtex config
require('vimtex-config')
-- ----------


-- mkdnflow config
require('mkdnflow-config')
-- ----------

