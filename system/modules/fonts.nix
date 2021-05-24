{ pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      fira-code
      fantasque-sans-mono
      iosevka-term-ss08-font
      mononoki
      unifont
    ];

    enableDefaultFonts = false;

    fontconfig.defaultFonts = {
      serif = [ "Unifont" ];
      sansSerif = [ "Unifont" ];
      monospace = [ "Unifont" ];
    };
  };
}
