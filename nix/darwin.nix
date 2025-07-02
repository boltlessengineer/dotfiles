{ self, pkgs, pkgs-unstable, ... }: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [
      pkgs.fzf
      pkgs.tmux
      pkgs.tree
      pkgs.vim
      pkgs.git
      pkgs.ollama
      # I don't want to touch this due to current neovim settings.
      # remove it when lux.nvim is out
      (pkgs-unstable.lua5_1.withPackages (ps: with ps; [luarocks]))
    ];

  launchd.user.agents = {
    # reference:
    # - https://www.danielcorin.com/til/nix-darwin/launch-agents/
    # - https://medium.com/@anand34577/setting-up-ollama-as-a-background-service-on-macos-66f7492b5cc8
    ollama-serve = {
      environment = {
        OLLAMA_HOST = "0.0.0.0";
      };
      serviceConfig = {
        Label = "com.ollama.serve";
        ProgramArguments = [ "${pkgs.ollama}/bin/ollama" "serve" ];
        KeepAlive = true;
        RunAtLoad = true;
        # TODO: ensure /var/log/ollama exist
        # StandardOutPath = "/var/log/ollama/stdout.log";
        # StandardErrorPath = "/var/log/ollama/stderr.log";
        StandardOutPath = "/tmp/ollama_boltless.log";
        StandardErrorPath = "/tmp/ollama_boltless.err";
      };
    };
  };

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
  # Enable rosetta binaries
  nix.settings.extra-platforms = "x86_64-darwin aarch64-darwin";

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  system.primaryUser = "boltless";

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  system.defaults.finder = {
    FXRemoveOldTrashItems = true;
    ShowPathbar = true;
    ShowStatusBar = true;
  };

  system.defaults.dock = {
    autohide = true;
    autohide-delay = 0.0;
    autohide-time-modifier = 0.6;
    mru-spaces = false;
    show-recents = false;
    # Disable bottom-right corner action
    wvous-br-corner = 1;
    # persistent-apps = [];
  };

  system.defaults.NSGlobalDomain = {
    AppleShowAllExtensions = true;
    # default minimum is 15 (225ms)
    InitialKeyRepeat = 10;
    # default minimum is 2 (30ms)
    KeyRepeat = 1;
    # Use f1, f2, etc. keys as standard function keys.
    "com.apple.keyboard.fnState" = true;
  };

  # reference https://medium.com/@zmre/nix-darwin-quick-tip-activate-your-preferences-f69942a93236
  # for more
  # https://gist.github.com/ChristopherA/98628f8cd00c94f11ee6035d53b0d3c6
  # is also cool
  system.defaults.CustomUserPreferences = {
    # see https://apple.stackexchange.com/a/429820
    "com.apple.Safari.SandboxBroker" = {
      ShowDevelopMenu = true;
    };
    "com.apple.Safari" = {
      IncludeDevelopMenu = true;
      IncludeInternalDebugMenu = true;
      SearchProviderIdentifier = "com.duckduckgo";
      ShowFullURLInSmartSearchField = true;
      # preview url on bottom left corner when hover links
      ShowOverlayStatusBar = true;
      WebAutomaticSpellingCorrectionEnabled = false;
      WebContinuousSpellCheckingEnabled = true;
      WebKitDeveloperExtrasEnabledPreferenceKey = true;
    };
    # Tried to set Mission Control keyboard shortcuts... but failed
    # "com.apple.symbolichotkeys" = {
    #   AppleSymbolicHotKeys = {
    #     "79" = {
    #       enabled = 1;
    #       value = {
    #         parameters = [65535 123 8650752];
    #         type = "standard";
    #       };
    #     };
    #     "80" = {
    #       enabled = 1;
    #       value = {
    #         parameters = [65535 123 8781824];
    #         type = "standard";
    #       };
    #     };
    #     "81" = {
    #       enabled = 1;
    #       value = {
    #         parameters = [65535 124 8650752];
    #         type = "standard";
    #       };
    #     };
    #     "82" = {
    #       enabled = 1;
    #       value = {
    #         parameters = [65535 124 8781824];
    #         type = "standard";
    #       };
    #     };
    #     "118" = {
    #       enabled = 1;
    #       value = {
    #         parameters = [65535 18 262144];
    #         type = "standard";
    #       };
    #     };
    #     # 119 = {
    #     #   enabled = 1;
    #     #   value = {
    #     #     parameters = [65535, 19, 262144];
    #     #     type = "standard";
    #     #   };
    #     # };
    #     # 120 = {
    #     #   enabled = 1;
    #     #   value = {
    #     #     parameters = [65535, 20, 262144];
    #     #     type = "standard";
    #     #   };
    #     # };
    #     # 121 = {
    #     #   enabled = 1;
    #     #   value = {
    #     #     parameters = [65535, 21, 262144];
    #     #     type = "standard";
    #     #   };
    #     # };
    #     # 122 = {
    #     #   enabled = 1;
    #     #   value = {
    #     #     parameters = [65535, 23, 262144];
    #     #     type = "standard";
    #     #   };
    #     # };
    #   };
    # };
  };

  # NOTE: put SaneSideButtons (installed via homebrew cask) to Login Items
  # reference: https://discourse.nixos.org/t/automatically-launching-macos-applications-on-login/19823/2
  # TODO: package this into single nix package with SaneSideButtons itself. See pkgs.sensible-side-buttons as a reference
  system.activationScripts.extraActivation.text = ''
    osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/SaneSideButtons.app", hidden:false}'
    softwareupdate --install-rosetta --agree-to-license
  '';

  # # Enable Touch ID support
  # security.pam.enableSudoTouchIdAuth = true;

  homebrew = {
    enable = true;
    casks = [
      "discord"
      "ghostty"
      "raycast"
      # there are also pkgs.sensible-side-buttons (original version) which is unfree license
      # this one is foked version of it: "SaneSideButtons"
      # NOTE: I should put this on Login Items manually. See: https://github.com/thealpa/SaneSideButtons
      "sanesidebuttons"
    ];
    masApps = {
      Numbers = 409203825;
      Pages = 409201541;
      Things3 = 904280696;
    };
  };
}
