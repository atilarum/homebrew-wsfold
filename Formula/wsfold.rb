class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/wsfold/wsfold"
  version "0.4.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.4.2/wsfold_Darwin_arm64.tar.gz"
      sha256 "3dd7b2d15ce54a479e86139ce89e00ffa6318133acd96d33ae9399674c73deb3"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.4.2/wsfold_Darwin_x86_64.tar.gz"
      sha256 "d6657f1405209259b073f62dc6a2308b095c0b73ba115f1d6eb373546767c8ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.4.2/wsfold_Linux_arm64.tar.gz"
      sha256 "db974b51eb7715df12bc6ea1540b7a8d94ab2493ba85ee802d06817969d2a1bb"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.4.2/wsfold_Linux_x86_64.tar.gz"
      sha256 "93fcc049cb5301f652c5ce5f3ec701591da239f86858fa0a8a0626f500f34e05"
    end
  end

  def install
    bin.install "wsfold"

    (zsh_completion/"_wsfold").write Utils.safe_popen_read(bin/"wsfold", "completion", "zsh")
  end

  def caveats
    <<~EOS
      zsh completion has been installed to Homebrew's completion directory.

      If your shell is already configured for Homebrew completions, nothing else is required.

      Otherwise, you can enable wsfold completion manually:

        eval "$(wsfold completion zsh)"

      To persist it in zsh:

        echo 'eval "$(wsfold completion zsh)"' >> ~/.zshrc
        exec zsh
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/wsfold --help")
  end
end
