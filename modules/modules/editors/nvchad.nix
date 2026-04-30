{ inputs, ... }:
{

  den.aspects.nvchad = {

    homeManager = { pkgs, ... }: {
      imports = [
        inputs.nvchad4nix.homeManagerModule
      ];

      programs.nvchad = {
        enable = true;
        hm-activation = true;
        extraPackages = with pkgs; [
          pyright
          typescript-language-server
        ];

        extraPlugins = ''
          return {
          }
        '';

        extraConfig = ''
          require("lspconfig").pyright.setup({
            cmd = { "pyright-langserver", "--stdio" },
            filetypes = { "python" },
          })

          require("lspconfig").ts_ls.setup({
            cmd = { "typescript-language-server", "--stdio" },
            filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
          })

          require("lspconfig").nixd.setup({
            cmd = { "nixd" },
            settings = {
              nixd = {
                formatting = {
                  command = { "nixfmt" },
                },
              },
            },
          })
        '';

        chadrcConfig = ''
          local M = {}
          M.base16 = {
            theme = "gruvbox-light-medium"
          }
          M.nvdash = {
            load_on_startup = true,
            header = {
              "                            ",
              "     ▄▄         ▄ ▄▄▄▄▄▄▄   ",
              "   ▄▀███▄     ▄██ █████▀    ",
              "   ██▄▀███▄   ███           ",
              "   ███  ▀███▄ ███           ",
              "   ███    ▀██ ███           ",
              "   ███      ▀ ███           ",
              "   ▀██ █████▄▀█▀▄██████▄    ",
              "     ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀   ",
              "                            ",
              "     Powered By  eovim    ",
              "                            ",
            },

            buttons = {
              { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
              { txt = "  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
            },
          }
          return M
        '';
      };
    };

  };

}
