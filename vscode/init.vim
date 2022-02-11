let mapleader=","

if exists('g:vscode')
  nnoremap <leader>te <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
  nnoremap <leader>e <Cmd>call VSCodeNotify('workbench.view.explorer')<CR>
endif

