return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        hls = {
          mason = false,
          cmd = { "haskell-language-server-wrapper", "--lsp" },
          codeLens = { enabale = true },
          settings = {
            haskell = {
              hlintOn = true,
              formattingProvider = "stylish-haskell",
            },
          },
        },
      },
    },
  },
}
