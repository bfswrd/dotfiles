return function(builtins)
	local sources = {
		-- c/c++/java
		builtins.formatting.clang_format.with({
			filetypes = { "java", "c", "cpp" },
			extra_args = function(params)
				return { "-style='{IndentWidth:" .. vim.api.nvim_buf_get_option(params.bufnr, 'shiftwidth').."}'" }
			end,
		}),

		-- python
		builtins.formatting.isort,
		builtins.formatting.autopep8,

		-- E501 - line too long
		-- W503 - line break before binary operator
		builtins.diagnostics.flake8.with({ extra_args = { "--ignore", "E501,W503" } }),

		-- rust
		builtins.formatting.rustfmt,

		-- JS html css stuff
		builtins.formatting.prettierd.with({
			filetypes = { "html", "json", "scss", "css", "javascript", "javascriptreact", "typescript" },
			extra_args = function(params)
				return { "-i", vim.api.nvim_buf_get_option(params.bufnr, "shiftwidth") }
			end,
		}),
        builtins.formatting.phpcbf, -- PHP

		-- Lua
		builtins.formatting.stylua,

		-- Shell
		builtins.formatting.shfmt,
		builtins.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
	}

	return sources
end
