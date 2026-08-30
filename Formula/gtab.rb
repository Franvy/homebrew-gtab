class Gtab < Formula
  desc "Ghostty tab workspace manager with an interactive TUI"
  homepage "https://github.com/Franvy/gtab"
  version "1.8.1"
  license "MIT"

  on_arm do
    url "https://github.com/Franvy/gtab/releases/download/v1.8.1/gtab-1.8.1-aarch64-apple-darwin.tar.gz"
    sha256 "e496ebdf8605d26e402da29e2da20dc1f29ab5c37a0ae6a0f0c68dccedb03784"
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
    assert_match "shortcut_mode = text", shell_output("#{bin}/gtab set")

    assert_match "_gtab_launch_widget", shell_output("#{bin}/gtab shell-init zsh")
    assert_match "unsupported shell", shell_output("#{bin}/gtab shell-init tcsh 2>&1", 1)

    system bin/"gtab", "set", "close_tab", "on"
    assert_match "close_tab = on", shell_output("#{bin}/gtab set")

    assert_match "launch_mode has been removed", shell_output("#{bin}/gtab set launch_mode window", 1)
  end
end
