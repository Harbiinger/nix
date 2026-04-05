{ inputs, ... }:
{

  den.aspects.nvchad = {

    homeManager = {
        imports = [
          inputs.nvchad4nix.homeManagerModule
        ];

        programs.nvchad = {
          enable = true;
          hm-activation = true;
          extraConfig = ''
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
            return M
          '';
        };
      };

  };

}
