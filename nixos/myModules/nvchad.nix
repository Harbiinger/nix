{ inputs, config, pkgs, ... }: {

  imports = [
    inputs.nvchad4nix.homeManagerModule
  ];

  programs.nvchad = {
    enable = true;

    # extraPlugins = ''return {
    #   {"github/copilot.vim", lazy=false},
    # }'';
    
    extraPackages = with pkgs; [
      nodePackages.bash-language-server
      nixd
      (python3.withPackages(ps: with ps; [
        python-lsp-server
      ]))
    ];
    hm-activation = true;
  };
}
