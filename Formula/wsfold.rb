class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/atilarum/wsfold"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.8.0/wsfold_Darwin_arm64.tar.gz"
      sha256 "6a2b1d113e1600a099c1881bf88dd4e55b9e9f1e91d9a1dc2a33bf96b513fc9b"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.8.0/wsfold_Darwin_x86_64.tar.gz"
      sha256 "aa70ecd0b537c94e9a7384f93e4ccdfd989db194be82dbac4fe47a148a2f049e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.8.0/wsfold_Linux_arm64.tar.gz"
      sha256 "045a6caf8da3132353044c2069214f06ccee4d4b198431ef286ca291ba8fa4ff"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.8.0/wsfold_Linux_x86_64.tar.gz"
      sha256 "19cc5c4804a79b1950d3ea74ac908f8f9ef221534073992ed351078785f0b8e2"
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
