{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      window.title = "Alacritty";
      window.decorations = "none";
      window.dynamic_title = false;
      window.startup_mode = "Maximized";
      window.dynamic_padding = true;
      key_bindings = [
        {
          key = "V";
          mods = "Control|Shift";
          action = "Paste";
        }
        {
          key = "C";
          mods = "Control|Shift";
          action = "Copy";
        }
        {
          key = "Up";
          mods = "Control|Shift";
          action = "ScrollPageUp";
        }
        {
          key = "Down";
          mods = "Control|Shift";
          action = "ScrollPageDown";
        }
      ];
      cursor = {
        style.shape = "Block";
        style.blinking = "Always";
      };
      window.padding = {
        x = 0;
        y = 0;
      };
      scrolling.history = 10000;
      font = let font = "Iosevka Term SS08";
      in {
        normal.family = font;
        bold.family = font;
        italic.family = font;
        size = 11.0;
      };
      draw_bold_text_with_bright_colors = true;
      colors = {
        primary = {
          background = "0x16161c";
          foreground = "0xfdf0ed";
        };
        normal = {
          black = "0x232530";
          red = "0xe95678";
          green = "0x29d398";
          yellow = "0xfab795";
          blue = "0x26bbd9";
          magenta = "0xee64ae";
          cyan = "0x59e3e3";
          white = "0xfadad1";
        };
        bright = {
          black = "0x2e303e";
          red = "0xec6a88";
          green = "0x3fdaa4";
          yellow = "0xfbc3a7";
          blue = "0x3fc6de";
          magenta = "0xf075b7";
          cyan = "0x6be6e6";
          white = "0xfdf0ed";
        };
      };
      background_opacity = 1.0;
      live_config_reload = true;
    };
  };
}
