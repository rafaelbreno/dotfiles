" GoImport
autocmd BufEnter * lua require'completion'.on_attach()
autocmd BufWritePre *.go lua goimports(1000)
