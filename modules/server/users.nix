{
  users.users.main = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    hashedPassword = "$6$DcvkYqBlOGtC06/3$ClnRatf3T5sIJtp5nHWO7fG3Nrs89w8EfBMeNs6JA9dOwXUnfUjw6tZDBOInm4.PCyJ3WD4xHr1q/t2L3pXcU0";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPbAoAEvQfpRnvRuYry1FE36kmLKFwywyC/TZGWHPAHM celestial.moe | 23/02/2025"
    ];
  };
}
