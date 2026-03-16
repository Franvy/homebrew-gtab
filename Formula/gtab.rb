class Gtab < Formula
  desc "Ghostty tab workspace manager — save and restore terminal window layouts"
  homepage "https://github.com/Franvy/gtab"
  url "https://github.com/Franvy/gtab/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "a15548244f8ac98dd66830f59fcb3251667d76cb763707b1779a33aa99a47a82"
  license "MIT"

  def install
    bin.install "gtab"
  end

  def caveats
    <<~EOS
      Workspaces are stored in ~/.config/gtab/ by default.
      Override with: export GTAB_DIR="/your/path"

      Requires Ghostty terminal: https://ghostty.org
    EOS
  end

  test do
    assert_match "gtab — Ghostty Tab Workspace Manager", shell_output("#{bin}/gtab --help")
  end
end
