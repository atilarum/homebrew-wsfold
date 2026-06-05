class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/atilarum/wsfold"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.11.0/wsfold_Darwin_arm64.tar.gz"
      sha256 "ee48e6f88ad4ef02127eb4484b84804fa852779ce8e05ad4917f92dafc932e00"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.11.0/wsfold_Darwin_x86_64.tar.gz"
      sha256 "148721b51b3b0e4ae279cf172bcd8e3be93db57f10965f8e4dccf3ce155c696b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.11.0/wsfold_Linux_arm64.tar.gz"
      sha256 "216b0dbd63b1ba2ee4897d9f10501423be715f0e33de4304ed2522032e974ed7"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.11.0/wsfold_Linux_x86_64.tar.gz"
      sha256 "326c50f6c4f55007b7a97a598e2f8d5708444a7e39b4f42c9c2e04d41a6aac04"
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
