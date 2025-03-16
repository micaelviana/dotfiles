return {
  'nat-418/boole.nvim',
  event = 'VeryLazy',
  opts = {
    mappings = {
      increment = '<C-a>',
      decrement = '<C-x>',
    },
    additions = {
      { 'let', 'const' },
    },
  },
}
