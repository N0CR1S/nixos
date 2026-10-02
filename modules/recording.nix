{ pkgs, ... }:


{
  programs.gpu-screen-recorder = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    gpu-screen-recorder
    gpu-screen-recorder-gtk
  ];

  hardware.graphics = {
    enable = true;

    extraPackages = with pkgs; [
      intel-media-driver
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
}
