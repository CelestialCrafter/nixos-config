{
  security = {
    rtkit.enable = true;
    pam = {
      services.hyprlock = {};
      loginLimits = [
        {
          domain = "@users";
          item = "rtprio";
          type = "-";
          value = 1;
        }
      ];
    };
  };
}
