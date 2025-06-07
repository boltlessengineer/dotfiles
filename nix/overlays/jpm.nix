self: super: {
  jpm = super.jpm.overrideAttrs (oldAttrs: let
    platformFiles = {
      aarch64-darwin = "macos_config.janet";
      aarch64-linux = "linux_config.janet";
      x86_64-darwin = "macos_config.janet";
      x86_64-linux = "linux_config.janet";
    };

    platformFile = platformFiles.${super.stdenv.hostPlatform.system};
  in {
    installPhase = ''
      runHook preInstall

      mkdir -p $out/{lib/janet,share/man/man1}

      janet bootstrap.janet configs/${platformFile}

      substituteInPlace $out/lib/janet/jpm/default-config.janet \
        --replace-fail $out ${super.janet}

      runHook postInstall
    '';
    installCheckPhase = ''
      $out/bin/jpm help
      $out/bin/jpm show-paths
    '';
  });
}
