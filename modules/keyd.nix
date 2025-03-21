# ESCAPE HATCH: backspace + escape + enter

{
  services.keyd = {
    enable = true;
    keyboards.bocchi = {
      ids = [ "534b:5431:f85c548c" ];
      settings = {
        global.default_layout = "colemak";

        main = {
          capslock = "overload(navigation, esc)";
          compose = "layer(layouts)";
        };

        "hiragana:layout" = {
          grave = "ろ";
          "1" = "ぬ";
          "2" = "ふ";
          "3" = "あ";
          "4" = "う";
          "5" = "え";
          "6" = "お";
          "7" = "や";
          "8" = "ゆ";
          "9" = "よ";
          "0" = "わ";
          minus = "ほ";
          equal = "へ";

          q = "た";
          w = "て";
          e = "い";
          r = "す";
          t = "か";
          y = "ん";
          u = "な";
          i = "に";
          o = "ら";
          p = "せ";
          leftbrace = "゛";
          rightbrace = "゜";
          backslash = "む";

          a = "ち";
          s = "と";
          d = "し";
          f = "は";
          g = "き";
          h = "く";
          j = "ま";
          k = "の";
          l = "り";
          semicolon = "れ";
          apostrophe = "け";

          z = "つ";
          x = "さ";
          c = "そ";
          v = "ひ";
          b = "こ";
          n = "み";
          m = "も";
          comma = "ね";
          dot = "る";
          slash = "め";

          shift = "layer(hiragana_shift)";
        };

        "hiragana_shift:S" = {
          "3" = "ぁ";
          "4" = "ゥ";
          "5" = "ぇ";
          "6" = "ぉ";
          "7" = "ゃ";
          "8" = "ゅ";
          "9" = "ょ";
          "0" = "ゎ";

          e = "ぃ";
          leftbrace = "「";
          rightbrace = "」";

          z = "っ";
        };

        # for some reason, include layouts/colemak just didnt work
        "colemak:layout" = {
          s = "r";
          g = "d";
          e = "f";
          d = "s";
          semicolon = "o";
          r = "p";
          f = "t";
          t = "g";
          u = "l";
          j = "n";
          k = "e";
          p = ";";
          o = "y";
          i = "u";
          l = "i";
          n = "k";
          y = "j";
        };

        layouts = {
          "1" = "setlayout(colemak)";
          "2" = "setlayout(hiragana)";
          "3" = "setlayout(main)";
        };

        navigation = {
          h = "left";
          j = "down";
          k = "up";
          l = "right";
        };
      };

      extraConfig = "include layouts/colemak";
    };
  };
}
