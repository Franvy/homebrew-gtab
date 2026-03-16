class Gtab < Formula
  desc "Ghostty tab workspace manager — save and restore terminal window layouts"
  homepage "https://github.com/Franvy/gtab"
  url "https://github.com/Franvy/gtab/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "e3c84a4c224ac7522f46f41723a6d988b190e7d18a9a3f420ec5140f900f52a3"
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
