{
  description = "gBar status bar for Wayland including volume control etc.";

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.default =
      with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        name = "gBar";
        src = ./.;
        nativeBuildInputs = [meson ninja pkg-config];
        buildInputs = [gtk3 gtk-layer-shell libpulseaudio pamixer];
        build = ''
          meson build --buildtype=release -DWithHyprland=false -DWithNvidia=false -DWithBlueZ=false
        '';
      };
  };
}
