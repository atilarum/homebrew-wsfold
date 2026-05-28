class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/atilarum/wsfold"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.5.1/wsfold_Darwin_arm64.tar.gz"
      sha256 "9655791f7a3d2595371ca8b722387bcc50b475a7583d94d74f65d00f0677262d"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.5.1/wsfold_Darwin_x86_64.tar.gz"
      sha256 "eb5fd2b89de47ca18dd151db9d00020781dc42801bc6a2e57894c3933e8c9aa5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.5.1/wsfold_Linux_arm64.tar.gz"
      sha256 "a75bab175825e4b1068b2735e47b7bdf05ce79d0a8934448f840bfad1346fddb"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.5.1/wsfold_Linux_x86_64.tar.gz"
      sha256 "57af8e843bc459cb5a38accceb839755ec259115b9972c93866177d0147949ee"
    end
  end

  def install
    bin.install "wsfold"

    generate_completions_from_executable(bin/"wsfold", "completion", shells: [:zsh])
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
