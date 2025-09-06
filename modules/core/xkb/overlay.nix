final: prev: {
  xkeyboard-config = prev.xkeyboard-config.overrideAttrs (old: {
    postPatch = ''
      cp ${./se_custom} symbols/se_custom
    '';
  });
}
