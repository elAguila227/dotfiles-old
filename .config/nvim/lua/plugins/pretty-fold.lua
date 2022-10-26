local status_ok, pretty_fold = pcall(require, "pretty-fold")
if not status_ok then
  return
end

config = {
  sections = {
    left = {
      '', function()
        sp = vim.o.shiftwidth
        return string.rep(' ', (vim.v.foldlevel*sp)-sp)
      end,
      '﬋ ', '─┤', 'content', '├',
    },
    right = {
      '┤ ', 'number_of_folded_lines', ': ', 'percentage', ' │',
      function(config) return config.end_chars:rep(2) end, ''
    }
  },
  end_chars = ' ',
  -- fill_char = '•',
  fill_char = '─',

  remove_fold_markers = true,

  -- Keep the indentation of the content of the fold string.
  keep_indentation = false,

  -- Possible values:
  -- "delete" : Delete all comment signs from the fold string.
  -- "spaces" : Replace all comment signs with equal number of spaces.
  -- false    : Do nothing with comment signs.
  process_comment_signs = 'spaces',

  -- Comment signs additional to the value of `&commentstring` option.
  comment_signs = {},

  -- List of patterns that will be removed from content foldtext section.
  stop_words = {
    '@brief%s*', -- (for C++) Remove '@brief' and all spaces after.
  },

  add_close_pattern = true, -- true, 'last_line' or false

  matchup_patterns = {
    {  '{', '}' },
    { '%(', ')' }, -- % to escape lua pattern char
    { '%[', ']' }, -- % to escape lua pattern char
  },

  ft_ignore = { 'neorg' },
}

pretty_fold.setup(config)
