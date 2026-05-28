class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/atilarum/wsfold"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.6.0/wsfold_Darwin_arm64.tar.gz"
      sha256 "8fdcbe0396aeb887a08fcf2cc1c2c77c99550f4bf961358fb74c9a70fe1e1dbe"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.6.0/wsfold_Darwin_x86_64.tar.gz"
      sha256 "7cb5b255f0ba1ccdadf8cf76b3dc8f9eb8f34ef5b10a7b8651d9c60b0d361809"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.6.0/wsfold_Linux_arm64.tar.gz"
      sha256 "bff4cd6396b5b532987f872e4d5875073d2c606da0ab6f3524290ac6e7eed722"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.6.0/wsfold_Linux_x86_64.tar.gz"
      sha256 "86fcb0a64524973f9360bb2d72b47033f1f9c086c734c1baf37970dfcd7b4ff4"
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
