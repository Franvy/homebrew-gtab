class Gtab < Formula
  desc "Ghostty tab workspace manager with an interactive TUI"
  homepage "https://github.com/Franvy/gtab"
  version "1.5.1"
  license "MIT"

  on_arm do
    url "https://github.com/Franvy/gtab/releases/download/v1.5.1/gtab-1.5.1-aarch64-apple-darwin.tar.gz"
    sha256 "17a55d47db24f412edf84db4a94295b5416350cafaa8b67f8ab41f3a6e268724"
  end

  depends_on :macos

  def install
    bin.install "gtab"
  end

  def caveats
    <<~EOS
      Run this once to enable the default Ghostty-local Cmd+G:
        gtab init

      Workspaces are stored in ~/.config/gtab/ by default.
      Override with: export GTAB_DIR="/your/path"

      Requires Ghostty terminal: https://ghostty.org
    EOS
  end

  test do
    ENV["GTAB_DIR"] = testpath/"gtab"
    (testpath/"gtab").mkpath
    (testpath/"gtab/demo.applescript").write <<~APPLESCRIPT
      tell application "Ghostty"
      end tell
    APPLESCRIPT

    assert_match version.to_s, shell_output("#{bin}/gtab --version")
    assert_match "demo", shell_output("#{bin}/gtab list")
    assert_match "close_tab = off", shell_output("#{bin}/gtab set")
    assert_match "ghostty_shortcut = cmd+g", shell_output("#{bin}/gtab set")
    assert_match "Ghostty-local shortcut is the default fast path", shell_output("#{bin}/gtab set")

    system bin/"gtab", "set", "close_tab", "on"
    assert_match "close_tab = on", shell_output("#{bin}/gtab set")

    assert_match "launch_mode has been removed", shell_output("#{bin}/gtab set launch_mode window", 1)
  end
end
