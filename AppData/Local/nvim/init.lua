-- 1. Automatically install the package manager (lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2. Tell the package manager to install oil.nvim and icons
require("lazy").setup({
  {
    'stevearc/oil.nvim',
    opts = {
    	view_options = {
		show_hidden = true,
	},
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  }
})

-- 3. Set a shortcut: Pressing the minus key "-" will open Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
