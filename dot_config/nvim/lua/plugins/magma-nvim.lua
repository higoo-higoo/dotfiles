vim.cmd([[
  nnoremap <silent><expr> <LocalLeader>r  :MagmaEvaluateOperator<CR>
  nnoremap <silent>       <LocalLeader>rr :MagmaEvaluateLine<CR>
  xnoremap <silent>       <LocalLeader>r  :<C-u>MagmaEvaluateVisual<CR>
  nnoremap <silent>       <LocalLeader>rc :MagmaReevaluateCell<CR>
  nnoremap <silent>       <LocalLeader>rd :MagmaDelete<CR>
  nnoremap <silent>       <LocalLeader>ro :MagmaShowOutput<CR>

  let g:magma_automatically_open_output = v:false
  let g:magma_image_provider = "kitty"
]])
