class Gtab < Formula
  desc "Ghostty tab workspace manager — save and restore terminal window layouts"
  homepage "https://github.com/Franvy/gtab"
  url "https://github.com/Franvy/gtab/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "6c9f69ebd1fbf84c3a485fdbc2d625f06e9c34e1b534556062ae720cc7fd1109"
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
