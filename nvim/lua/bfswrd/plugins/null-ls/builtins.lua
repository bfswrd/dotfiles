return function(builtins)
	local sources = {
		-- c/c++/java
		builtins.formatting.clang_format.with({
			filetypes = { "java", "c", "cpp" },
			extra_args = { "--style={IndentWidth: 4}" },
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
			extra_args = { "--tab-width=4", "--print-width=120" },
			replace = {
				["^.*://.*"] = function()
					return "stdin"
				end,
			},
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
