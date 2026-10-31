{ ... }:

# nixpkgs wraps only kime-candidate-window, but the frontends dlopen their
# libraries at runtime and panic with NoWaylandLib on NixOS (no global lib dir).
{
  nixpkgs.overlays = [
    (final: prev: {
      kime = prev.kime.overrideAttrs (old: {
        postFixup = (old.postFixup or "") + ''
          wrapProgram "$out/bin/kime-wayland" \
            --prefix LD_LIBRARY_PATH : "${
              final.lib.makeLibraryPath [
                final.wayland
                final.libxkbcommon
              ]
            }"
          wrapProgram "$out/bin/kime-xim" \
            --prefix LD_LIBRARY_PATH : "${
              final.lib.makeLibraryPath [
                final.libx11
                final.libxcb
                final.freetype
                final.fontconfig
              ]
            }"
        '';
      });
    })
  ];
}
