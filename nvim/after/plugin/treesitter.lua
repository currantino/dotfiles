require'nvim-treesitter.configs'.setup {
        ensure_installed = {
                "c",
                "cpp",
                "java",
                "lua",
                "python",
        },
        -- ...
         rainbow = {
                enable = true,
                -- list of languages you want to disable the plugin for
                -- disable = { "jsx", "cpp" },
                -- Which query to use for finding delimiters
                query = 'rainbow-parens',
                -- Highlight the entire buffer all at once
                strategy = require 'ts-rainbow.strategy.global',
                -- Do not enable for files with more than n lines
                max_file_lines = 3000
        },
        autotag = {
                enable = true,
        },

        sync_install = false,

        auto_install = true,

        highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
        }

}
