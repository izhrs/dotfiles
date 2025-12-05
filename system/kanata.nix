# home row mod configuration using kanata
{
  services.kanata = {
    enable = true;

    keyboards.default = {
      extraDefCfg = "process-unmapped-keys yes";
      config = ''
        (defsrc
          a s d f
          j k l ;
        )

        (defvar
          tap-time 200
          hold-time 200
        )

        (defalias
          a-mod (tap-hold $tap-time $hold-time a lsft)
          s-mod (tap-hold $tap-time $hold-time s lalt)
          d-mod (tap-hold $tap-time $hold-time d lctl)
          f-mod (tap-hold $tap-time $hold-time f lmet)

          j-mod (tap-hold $tap-time $hold-time j rmet)
          k-mod (tap-hold $tap-time $hold-time k rctl)
          l-mod (tap-hold $tap-time $hold-time l ralt)
          ;-mod (tap-hold $tap-time $hold-time ; rsft)
        )

        (deflayer base
          @a-mod @s-mod @d-mod @f-mod
          @j-mod @k-mod @l-mod @;-mod
        )
      '';
    };
  };
}
