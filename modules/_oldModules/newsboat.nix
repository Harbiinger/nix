{ inputs, pkgs, ... }:
{
  programs.newsboat = {
    enable = true;
    urls = [
      {
        url = "https://mullvad.net/en/blog/feed/atom";
        tags = ["Privacy"];
        title = "The Mullvad Blog";
      }
      {
        url = "https://github.com/Alexays/Waybar/releases.atom";
        tags = ["GitHub"];
        title = "Waybar release notes";
      }
      {
        url = "https://github.com/hyprwm/Hyprland/releases.atom";
        tags = ["GitHub"];
        title = "Hyprland release notes";
      }
      {
        url = "https://github.com/hyprwm/Hyprlock/releases.atom";
        tags = ["GitHub"];
        title = "Hyprlock release notes";
      }
      {
        url = "https://www.patrick-breyer.de/en/feed/";
        tags = ["Privacy"];
        title = "Patrick Breyer";
      }
      {
        url = "https://podcast.darknetdiaries.com/";
        tags = ["Podcast"];
        title = "Darknet Diaries";
      }
      {
        url = "https://monero.top/";
        tags = ["Privacy, Monero"];
        title = "Monero Top";
      }

    ];

    extraConfig = ''
      bind-key j down
      bind-key k up
      bind-key l open
      bind-key h quit
      color listfocus black color51
      color title black color51
      color listnormal_unread color160 default
      color info black color51
      color hint-key color160 color51
    '';

  };
}
