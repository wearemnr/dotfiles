{ pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      wamnr.iosevka-ss08
      wamnr.iosevka-term-ss08
      wamnr.iosevka-fixed-ss08
      fira-code
      fantasque-sans-mono
      # iosevka-term-ss08-font
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
