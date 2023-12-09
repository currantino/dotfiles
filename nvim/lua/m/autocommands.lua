 --vim.api.nvim_create_autocmd("BufWritePost", {
 --       pattern = {"*.tex"},
 --       command = "!pdflatex -interaction=batchmode % > /dev/null && open %:r.pdf "
--})

function Indent_latex()
        if 'tex' == vim.bo.filetype then os.execute("latexindent --silent --overwrite " .. vim.fn.expand("%")) end
end

vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = {"*.tex"},
        command = "lua Indent_latex()"
})

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})
