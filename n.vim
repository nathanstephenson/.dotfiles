if has('nvim') "only use lua function if running from nvim (lua isn't supported in native vim)
	lua require('init')
endif

source ./init.vim
