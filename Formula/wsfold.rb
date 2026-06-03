class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/atilarum/wsfold"
  version "0.10.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.10.1/wsfold_Darwin_arm64.tar.gz"
      sha256 "eb34e7587f7ef051bebcdebe777245b3be16215a4bdd4979746fa1540c27307d"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.10.1/wsfold_Darwin_x86_64.tar.gz"
      sha256 "44cf778d3837f770cd412ee9ea740bb8d68500543599dbe8830c91dcc5fa36fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.10.1/wsfold_Linux_arm64.tar.gz"
      sha256 "b9b1d31699aa5cbf5a596b907b84ea893da6611362da286453e75e4c875c4fe1"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.10.1/wsfold_Linux_x86_64.tar.gz"
      sha256 "86d03fd49aa9d51c727a5e8f3a2ff13a59768211d2a79de48a079eb9ae386348"
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
