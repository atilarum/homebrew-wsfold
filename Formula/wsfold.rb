class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/atilarum/wsfold"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.13.0/wsfold_Darwin_arm64.tar.gz"
      sha256 "316350e10f4a879074ece84854229390d16bbbfbe90a9fa852cb2a555565f646"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.13.0/wsfold_Darwin_x86_64.tar.gz"
      sha256 "db1d37bdc94ba184ac7acd4e4385eebdf50cb4eafe899d80c04acbaee2ccf666"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.13.0/wsfold_Linux_arm64.tar.gz"
      sha256 "f5b9b93f560e4e4855cf59223df229d00440762aa9f2f633e61ed3d08269a70c"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.13.0/wsfold_Linux_x86_64.tar.gz"
      sha256 "73cc56114fc793c5d89891da09113a01d4846f9fdb984ca6ac5e1e530a1b27f3"
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
