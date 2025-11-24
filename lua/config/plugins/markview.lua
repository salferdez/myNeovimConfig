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
					pad_char = " ",
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
			  headings = {
				enable = true,

				heading_1 = {
					style = "icon",
					sign = icon,
					sign_hl = "MarkviewHeading1Sign",
					icon = "█ ",
					icon_hl = "MarkviewHeading1Sign",
					hl = "MarkviewHeading1"
				},
				heading_2 = {
					style = "icon",
					sign = icon,
					sign_hl = "MarkviewHeading2Sign",
					icon = "█ ",
					icon_hl = "MarkviewHeading2Sign",
					hl = "MarkviewHeading2"
				},
				heading_3 = {
					style = "icon",
					sign = icon,
					sign_hl = "MarkviewHeading3Sign",
					icon = "█ ",
					icon_hl = "MarkviewHeading3Sign",
					hl = "MarkviewHeading3"
				},
			  },
			  horizontal_rules = presets.horizontal_rules.double,
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
