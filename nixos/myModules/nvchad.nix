{ inputs, config, pkgs, ... }: {

  imports = [
   inputs.nvchad4nix.homeManagerModule
  ];

  programs.nvchad = {
    enable = true;

    extraPlugins = ''return {
    }'';
    
    extraPackages = with pkgs; [
      nodePackages.bash-language-server
      nixd
      (python3.withPackages(ps: with ps; [
        python-lsp-server
      ]))
    ];

    chadrcConfig = ''
      local M = {}
      M.base16 = {
        theme = "gruvbox-light-medium"
      }
      return M
    '';

    hm-activation = true;

    };
}
