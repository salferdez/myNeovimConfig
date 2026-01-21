return {
	"OXY2DEV/markview.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.icons"
	},
	config = function()
		local presets = require("markview.presets")
		local miniIcons = require("mini.icons")
		local icon, hl, boolean = miniIcons.get("extension", "h")

		require("markview").setup({
			modes = { "n", "i", "no", "c" },
			hybrid_modes = { "n" },
			latex = {
				enable = true,
				blocks = {
					enable = true,
					hl = "MarkviewCode",
					pad_char = "",
					pad_amount = 3,
					text = "  LaTeX ",
					text_hl = "MarkviewCodeInfo"
				},
				fonts = {
					enable = true,
					default = {
						enable = true,
					},
				},
				inlines = {
					enable = true,
					padding_left = "",
					padding_right = "",
					hl = "MarkviewInlineCode"
				},
				subscripts = {
					enable = true,
					fake_preview = true,
					hl = "MarkviewSubscript"
				},
				superscripts = {
					enable = true,
					hl = "MarkviewSuperscript"
				},
				symbols = {
					enable = true,
					hl = "MarkviewComment"
				},
				texts = {
					enable = true,
				},
			},
			markdown = {
				enable = true,
				headings = presets.headings.glow,
				horizontal_rules = presets.horizontal_rules.double,
				list_items = {
					enable = true,
					wrap = false,

					indent_size = vim.opt.shiftwidth,
					shift_width = vim.opt.shiftwidth,

					marker_minus = {
						add_padding = true,
						conceal_on_checkboxes = true,

						text = "●",
						hl = "MarkviewListItemMinus"
					},

					marker_plus = {
						add_padding = true,
						conceal_on_checkboxes = true,

						text = "◈",
						hl = "MarkviewListItemPlus"
					},

					marker_star = {
						add_padding = true,
						conceal_on_checkboxes = true,

						text = "◇",
						hl = "MarkviewListItemStar"
					},

					marker_dot = {
						text = function(_, item)
							return string.format("%d.", item.n);
						end,
						hl = "@markup.list.markdown",
						add_padding = true,
						conceal_on_checkboxes = true
					},

					marker_parenthesis = {
						text = function(_, item)
							return string.format("%d)", item.n);
						end,
						hl = "@markup.list.markdown",
						add_padding = true,
						conceal_on_checkboxes = true
					}
				},
				tables = {
					enable = true,
					strict = true,

					block_decorator = true,
					use_virt_lines = false,

					parts = {
						top = { "╭", "─", "╮", "┬" },
						header = { "│", "│", "│" },
						separator = { "├", "─", "┤", "┼" },
						row = { "│", "│", "│" },
						bottom = { "╰", "─", "╯", "┴" },

						overlap = { "┝", "━", "┥", "┿" },

						align_left = "╼",
						align_right = "╾",
						align_center = { "╴", "╶" }
					},

					hl = {
						top = { "MarkviewTableHeader", "MarkviewTableHeader", "MarkviewTableHeader", "MarkviewTableHeader" },
						header = { "MarkviewTableHeader", "MarkviewTableHeader", "MarkviewTableHeader" },
						separator = { "MarkviewTableHeader", "MarkviewTableHeader", "MarkviewTableHeader", "MarkviewTableHeader" },
						row = { "MarkviewTableBorder", "MarkviewTableBorder", "MarkviewTableBorder" },
						bottom = { "MarkviewTableBorder", "MarkviewTableBorder", "MarkviewTableBorder", "MarkviewTableBorder" },

						overlap = { "MarkviewTableBorder", "MarkviewTableBorder", "MarkviewTableBorder", "MarkviewTableBorder" },

						align_left = "MarkviewTableAlignLeft",
						align_right = "MarkviewTableAlignRight",
						align_center = { "MarkviewTableAlignCenter", "MarkviewTableAlignCenter" }
					}
				},
			},
			markdown_inline = {
				enable = true,
				highlights = {
					enable = true,
					default = {
						padding_left = "",
						padding_right = "",
						hl = "MarkviewPalette3"
					},
				},
			},
			preview = {
				enable = true,
				icon_provider = "mini",
			},
		})
	end
}
