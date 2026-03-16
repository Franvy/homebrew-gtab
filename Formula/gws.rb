class Gws < Formula
  desc "Ghostty workspace manager — save and restore terminal window layouts"
  homepage "https://github.com/Franvy/gws"
  url "https://github.com/Franvy/gws/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "ee6a5a255a2590b8d4aae0e2492590d8879c6e0cb79264b19d984737ed70ad88"
  license "MIT"

  def install
    bin.install "gws"
  end

  def caveats
    <<~EOS
      Workspaces are stored in ~/.config/gws/ by default.
      Override with: export GWS_DIR="/your/path"

      Requires Ghostty terminal: https://ghostty.org
    EOS
  end

  test do
    assert_match "gws — Ghostty Workspace Manager", shell_output("#{bin}/gws --help")
  end
end
