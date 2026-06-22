class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/atilarum/wsfold"
  version "0.12.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.12.1/wsfold_Darwin_arm64.tar.gz"
      sha256 "6462756d7818ee7a20a8f5c029fc7901945953009ceafa2ad0446d0efbe1ae1d"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.12.1/wsfold_Darwin_x86_64.tar.gz"
      sha256 "123a679a6e661c30171655196b14f1ca9a11236218f5d32a08990a6cfdd12834"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.12.1/wsfold_Linux_arm64.tar.gz"
      sha256 "39cb4b484d386750c2a530fff7725467b4e21afcef4eefc42b2ff9a49aaec67f"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.12.1/wsfold_Linux_x86_64.tar.gz"
      sha256 "6bfaf051cdd6c2fc86eadef036c1d0d601e2767694185ecb69f94bdf6322783b"
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
