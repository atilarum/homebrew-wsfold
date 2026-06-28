class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/atilarum/wsfold"
  version "0.13.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.13.1/wsfold_Darwin_arm64.tar.gz"
      sha256 "1b8e5efa21bfa5afb44f4bfa54d9ea0d9b5f7c350b2eec4143342f87558efbe5"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.13.1/wsfold_Darwin_x86_64.tar.gz"
      sha256 "36893dfc4c2ee0b416af5332cef884dbeba4d625ca74105632bbc98ea0fae93c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.13.1/wsfold_Linux_arm64.tar.gz"
      sha256 "348af68c1848dfdecd97129a07de0a9094d39ceaf2195a838784fec5e32265d1"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.13.1/wsfold_Linux_x86_64.tar.gz"
      sha256 "1a9c91d293cbbf1d4a505595012c9986b60ebd84ea2580ddf52982763403dbf1"
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
