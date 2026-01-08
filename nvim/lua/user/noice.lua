-- Dismiss any pending noice messages on startup to prevent command prompt
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.schedule(function()
      pcall(function()
        require("noice").cmd("dismiss")
      end)
    end)
  end,
})

require("noice").setup({
    lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
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
