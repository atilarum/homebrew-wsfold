class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/atilarum/wsfold"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.10.0/wsfold_Darwin_arm64.tar.gz"
      sha256 "52d2d3ece772a0cfb9cfa464cd038c1afcc64a37b6fdc62996854b07380847b3"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.10.0/wsfold_Darwin_x86_64.tar.gz"
      sha256 "343d6517d5d35c6df2e4b2f6bc5af6a2ec539d5d7a42d610bd9b39c17c18e888"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.10.0/wsfold_Linux_arm64.tar.gz"
      sha256 "be1341b3bdf34a33e0e7c5ef9cfaef58c767d57c0e79829115bc4fe5f2e97ca6"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.10.0/wsfold_Linux_x86_64.tar.gz"
      sha256 "6e963eb85be92b7775336472ae05923786c91e1a478f6f693465d7d06f980d1d"
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
