set ignorecase
set wildignorecase
set clipboard=unnamedplus

let mapleader=","

if exists('g:vscode')
  " Explorer(Side bar)
  nnoremap <leader>te <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
  nnoremap <leader>e <Cmd>call VSCodeNotify('workbench.view.explorer')<CR>
  nnoremap <leader>o <Cmd>call VSCodeNotify('outline.focus')<CR>
  nnoremap <leader>to <Cmd>call VSCodeNotify('workbench.action.toggleAuxiliaryBar')<CR>

  " @see https://github.com/vscode-neovim/vscode-neovim#keyboard-quickfix
  nnoremap z= <Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>

  " Search
  nnoremap ? <Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>
  nnoremap <leader>st <Cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>

  " Buffers
  nnoremap <leader>c <Cmd>Tabclose<CR>
  nnoremap <leader>bo <Cmd>Tabonly<CR>
  nnoremap <leader>bb <Cmd>Tabprevious<CR>
  nnoremap <leader>bn <Cmd>Tabnext<CR>
  nnoremap <leader>bf <Cmd>call VSCodeNotify('workbench.action.showAllEditors')<CR>
  nnoremap <leader>be <Cmd>call VSCodeNotify('workbench.files.action.focusOpenEditorsView')<CR>

  " Programming
  nnoremap gi <Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>
  nnoremap gt <Cmd>call VSCodeNotify('editor.action.goToTypeDefinition')<CR>
  nnoremap gk <Cmd>call VSCodeNotify('docsView.documentationView.unpin')<CR><Cmd>call VSCodeNotify('docsView.documentation.focus')<CR>
  nnoremap <leader>lr <Cmd>call VSCodeNotify('editor.action.rename')<CR>
  nnoremap <leader>lj <Cmd>call VSCodeNotify('editor.action.marker.nextInFiles')<CR>
  nnoremap <leader>lk <Cmd>call VSCodeNotify('editor.action.marker.prevInFiles')<CR>
  nnoremap <leader>lf <Cmd>call VSCodeNotify('editor.action.formatDocument')<CR>
  nnoremap <leader>lw <Cmd>call VSCodeNotify('workbench.actions.view.problems')<CR>
  nnoremap <leader>ld <Cmd>call VSCodeNotify('workbench.actions.view.problems')<CR>
endif
