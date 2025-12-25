require("noice").setup({
    lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  cmdline = {
    enabled = true,
  },
  messages = {
    enabled = true,
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
  },
})

vim.opt.cmdheight = 0

-- Optional: use noice with notify
require("notify").setup({
  background_colour = "#000000",
  stages = "fade",
})
