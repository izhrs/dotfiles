{ pkgs, ... }: {
  # I tested both TLP and auto-cpufreq and found tlp slightly better in my usecase:
  # ~11-13W idle draw with Wi-Fi and Bluetooth on, screen brightness at 30%,
  # YT Music playing in Firefox, a static wallpaper, and editing in Helix.
  # TLP additionally provides a power-profiles-daemon-like interface,
  # usable via powerprofilesctl and Noctalia.
  services = {
    tlp = {
      enable = true;
      pd.enable = true;

      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 80;

        # Allow turbo boost & HWP dynamic boost on both AC and battery
        # trades a bit of idle efficiency for snappier response to bursts
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 1;
        CPU_HWP_DYN_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_BAT = 1;
      };
    };

    thermald.enable = true; # Enable thermald, the temperature management daemon. (only necessary if on Intel CPUs)
    upower.enable = true; # required for noctalia's power panel
  };

  environment.systemPackages = [
    pkgs.power-profiles-daemon # only for powerprofilectl
  ];
}
