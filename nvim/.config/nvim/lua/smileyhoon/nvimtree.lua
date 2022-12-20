local glyphs = {}

local installed, circles = pcall(require, 'circles')
if installed then
  circles.setup({ icons = { empty = '', filled = '', lsp_prefix = '' } })
  glyphs = circles.get_nvimtree_glyphs()
end

glyphs.git = {
  unstaged = '',
  staged = '',
  unmerged = '',
  renamed = '',
  untracked = '',
  deleted = '',
  ignored = '◌',
}

require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  view = {
    width = 30,
    hide_root_folder = false,
    side = 'left',
    mappings = {
      custom_only = false,
      list = {}
    },
    number = true,
    relativenumber = true,
    signcolumn = "no"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  renderer = {
      group_empty = true,
      highlight_opened_files = "name",
      special_files = {
        ["README.md"] = true,
        ["Makefile"] = true,
        ["MAKEFILE"] = true,
      },
      root_folder_modifier = ":t",
      icons = {
          glyphs = glyphs
      }
  }
}

