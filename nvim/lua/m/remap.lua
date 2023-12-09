vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader><leader>", function()
        vim.cmd("so")
end)

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })

vim.keymap.set('n', '<ScrollWheelUp>', '<C-y>')
vim.keymap.set('n', '<ScrollWheelDown>', '<C-e>')
vim.keymap.set('i', '<ScrollWheelUp>', '<C-y>')
vim.keymap.set('i', '<ScrollWheelDown>', '<C-e>')
vim.keymap.set('v', '<ScrollWheelUp>', '<C-y>')
vim.keymap.set('v', '<ScrollWheelDown>', '<C-e>')


local function render_latex()
        os.execute("pdflatex -interaction=batchmode " .. vim.fn.expand("%") .. " > /dev/null")
end

local function open_rendered_latex()
        os.execute("open " .. vim.fn.expand("%:r") .. ".pdf")
end

local function render_and_open_latex()
        if 'tex' == vim.bo.filetype then
                render_latex()
                open_rendered_latex()
        end
end

-- render and open pdf of current file
vim.keymap.set('n', '<leader>rf', render_and_open_latex)

-- format visual selection
vim.keymap.set('v', '<leader>f', function ()
        vim.lsp.buf.format({
                async = false
        })
end)

-- format whole file
vim.keymap.set('n', '<leader>f', function ()
        vim.lsp.buf.format({
                async = false
        })
end)

-- jumping back and forth between snippet params
local opts = { noremap = true, silent = true }
vim.keymap.set({'i', 's'}, '<c-j>', "<cmd>lua require('luasnip').jump(1)<CR>", opts)
vim.keymap.set({'i', 's'}, '<c-k>', "<cmd>lua require('luasnip').jump(-1)<CR>", opts)


local function autofinish_line()
        local current_line = vim.api.nvim_get_current_line()
        local last_char = string.sub(current_line, -1)
        if last_char == ')' then
                vim.api.nvim_buf_set_text({{
                       buffer =  0},
                       {start_row = vim.fn.line(".")},
                       {start_col = string.len(current_line)},
                       {end_row = vim.fn.line(".")},
                       {end_col = string.len(current_line) + 1},
                       {replacement = current_line .. ";"
                }})
        end
end

vim.keymap.set('n', '<leader>c', autofinish_line)
