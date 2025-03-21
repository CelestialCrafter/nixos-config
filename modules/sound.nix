{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;

    # oratory1990's settings for the ath m50x
    extraConfig.pipewire."99-equalizer" = {
      "context.modules" = [
        {
          name = "libpipewire-module-filter-chain";
          args = {
            "node.description" = "Equalizer Sink";
            "media.name" = "Equalizer Sink";
            "filter.graph" = {
              nodes = [
                {
                  type = "builtin";
                  name = "eq_band_1";
                  label = "bq_highshelf";
                  control = {
                    Freq = 0.0;
                    Q = 1.0;
                    Gain = -4.7;
                  };
                }
                {
                  type = "builtin";
                  name = "eq_band_2";
                  label = "bq_peaking";
                  control = {
                    Freq = 40.0;
                    Q = 0.6;
                    Gain = -4.6;
                  };
                }
                {
                  type = "builtin";
                  name = "eq_band_3";
                  label = "bq_lowshelf";
                  control = {
                    Freq = 105.0;
                    Q = 0.71;
                    Gain = 5.5;
                  };
                }
                {
                  type = "builtin";
                  name = "eq_band_4";
                  label = "bq_peaking";
                  control = {
                    Freq = 150.0;
                    Q = 0.8;
                    Gain = -4.3;
                  };
                }
                {
                  type = "builtin";
                  name = "eq_band_5";
                  label = "bq_peaking";
                  control = {
                    Freq = 335.0;
                    Q = 1.3;
                    Gain = 5.7;
                  };
                }
                {
                  type = "builtin";
                  name = "eq_band_6";
                  label = "bq_peaking";
                  control = {
                    Freq = 1600.0;
                    Q = 1.2;
                    Gain = 1.6;
                  };
                }
                {
                  type = "builtin";
                  name = "eq_band_7";
                  label = "bq_peaking";
                  control = {
                    Freq = 2600.0;
                    Q = 2.0;
                    Gain = -1.1;
                  };
                }
                {
                  type = "builtin";
                  name = "eq_band_8";
                  label = "bq_peaking";
                  control = {
                    Freq = 4300.0;
                    Q = 4.0;
                    Gain = -4.5;
                  };
                }
                {
                  type = "builtin";
                  name = "eq_band_9";
                  label = "bq_peaking";
                  control = {
                    Freq = 5300.0;
                    Q = 1.0;
                    Gain = 5.5;
                  };
                }
                {
                  type = "builtin";
                  name = "eq_band_10";
                  label = "bq_peaking";
                  control = {
                    Freq = 5700.0;
                    Q = 4.0;
                    Gain = -3.5;
                  };
                }
                {
                  type = "builtin";
                  name = "eq_band_11";
                  label = "bq_highshelf";
                  control = {
                    Freq = 10000.0;
                    Q = 0.71;
                    Gain = -1.0;
                  };
                }
              ];

              links = [
                {
                  output = "eq_band_1:Out";
                  input = "eq_band_2:In";
                }
                {
                  output = "eq_band_2:Out";
                  input = "eq_band_3:In";
                }
                {
                  output = "eq_band_3:Out";
                  input = "eq_band_4:In";
                }
                {
                  output = "eq_band_4:Out";
                  input = "eq_band_5:In";
                }
                {
                  output = "eq_band_5:Out";
                  input = "eq_band_6:In";
                }
                {
                  output = "eq_band_6:Out";
                  input = "eq_band_7:In";
                }
                {
                  output = "eq_band_7:Out";
                  input = "eq_band_8:In";
                }
                {
                  output = "eq_band_8:Out";
                  input = "eq_band_9:In";
                }
                {
                  output = "eq_band_9:Out";
                  input = "eq_band_10:In";
                }
                {
                  output = "eq_band_10:Out";
                  input = "eq_band_11:In";
                }
              ];
            };

            "audio.channels" = 2;
            "audio.position" = [
              "FL"
              "FR"
            ];
            "capture.props" = {
              "node.name" = "effect_input.eq";
              "media.class" = "Audio/Sink";
            };
            "playback.props" = {
              "node.name" = "effect_output.eq";
              "node.passive" = true;
            };
          };
        }
      ];
    };
  };
}
