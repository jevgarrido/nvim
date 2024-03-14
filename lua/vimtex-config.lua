
-- Viewer options: One may configure the viewer either by specifying a built-in
-- viewer method:
vim.g['vimtex_view_method'] = 'general'
vim.g['vimtex_view_general_viewer'] = 'SumatraPDF'
vim.g['vimtex_view_general_options'] = '-reuse-instance -forward-search @tex @line @pdf'
vim.g['vimtex_view_automatic'] = 0

-- Never open QuickFix window automatically
vim.g['vimtex_quickfix_mode']               = 2
vim.g['vimtex_quickfix_open_on_warning']    = 0
