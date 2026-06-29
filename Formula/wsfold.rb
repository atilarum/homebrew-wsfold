class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/atilarum/wsfold"
  version "0.13.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.13.2/wsfold_Darwin_arm64.tar.gz"
      sha256 "d73cdd00e3888cc2f89c67fa93988eb1d3a0c2c255ec013c3b8e9647983e7c93"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.13.2/wsfold_Darwin_x86_64.tar.gz"
      sha256 "1031a136a2e5aa41e95337d10d2280ca53ea1e7595ee0991443a75f14c705211"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.13.2/wsfold_Linux_arm64.tar.gz"
      sha256 "4d2ed8dda1e1c5790e1c6c6f6011f57e359bd28a08a240bc3434bccb1e3c6fd8"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.13.2/wsfold_Linux_x86_64.tar.gz"
      sha256 "981eb3d6b77a0cac12cddb9f248f28c4f7e584717df2e7b52105b053eb0deafe"
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
