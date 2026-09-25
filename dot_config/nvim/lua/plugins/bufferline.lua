require("bufferline").setup({
  options = {
    globalstatus = true,
    -- themable = true,
    -- theme = "dracula"
  },
})

vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
vim.keymap.set("n", "<Leader>x", function()
  local buf = vim.api.nvim_get_current_buf()

  -- 未保存の変更がある場合は、何も閉じない
  if vim.bo[buf].modified then
    vim.notify("未保存の変更があります。先に保存してください。", vim.log.levels.WARN)
    return
  end

  -- 通常の、名前も内容もない空バッファかどうか
  local is_empty = vim.api.nvim_buf_get_name(buf) == ""
      and vim.bo[buf].buftype == ""
      and vim.api.nvim_buf_line_count(buf) == 1
      and vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1] == ""

  if is_empty then
    -- すでに空なら分割を閉じる。ただし現在のタブの最後の1枚は残す
    if vim.fn.winnr("$") == 1 then
      return
    end
    vim.cmd("close")
  else
    -- ファイルを表示している場合は、分割を残して [No Name] にする
    vim.cmd("enew")
  end

  -- どの分割・タブにも表示されなくなった元バッファだけを削除する
  -- 同じファイルを別の分割で開いている場合は、そちらを残す
  if vim.api.nvim_buf_is_valid(buf) and #vim.fn.win_findbuf(buf) == 0 then
    local ok, err = pcall(vim.api.nvim_buf_delete, buf, { force = false })
    if not ok then
      vim.notify(tostring(err), vim.log.levels.WARN)
    end
  end
end, {
  silent = true,
  desc = "Close buffer, then close empty window",
})
