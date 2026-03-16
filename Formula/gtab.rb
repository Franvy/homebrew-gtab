class Gtab < Formula
  desc "Ghostty tab workspace manager — save and restore terminal window layouts"
  homepage "https://github.com/Franvy/gtab"
  url "https://github.com/Franvy/gtab/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "4dabd8863294dc88a0581614f148619f57dad902e8be45867fda0de75a978e6d"
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
