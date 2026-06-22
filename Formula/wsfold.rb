class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/atilarum/wsfold"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.12.0/wsfold_Darwin_arm64.tar.gz"
      sha256 "4e476ec9fd6f153907e3226ce62081fdf41239c66cb27b3434609b5737079d3d"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.12.0/wsfold_Darwin_x86_64.tar.gz"
      sha256 "ff03fce26b3424fe3d452318ea746cf4381e33f11df1e9dff211ed59ce32e860"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.12.0/wsfold_Linux_arm64.tar.gz"
      sha256 "689991e3e20cf180c118461402d87fca3ffce2c469e54c3d1602f6d778b50077"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.12.0/wsfold_Linux_x86_64.tar.gz"
      sha256 "f8fb0285a4091d35243e874377177cd0f56f4c7cd4138c275e22ca57904df1cc"
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
