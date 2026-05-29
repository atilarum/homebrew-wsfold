class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/atilarum/wsfold"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.7.0/wsfold_Darwin_arm64.tar.gz"
      sha256 "a904d96a5299aeb0219347db7daa82cd398f51cd8b537149ebb4310786a04dfc"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.7.0/wsfold_Darwin_x86_64.tar.gz"
      sha256 "de9f4dea85e1bad3217d55449ff3bbcb82633a0da206c7d7ca0e35b99f185519"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.7.0/wsfold_Linux_arm64.tar.gz"
      sha256 "ee5103bb6f58e725ae2271003143658d9f9f3ac0abc00be724e4cf877f313fc8"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.7.0/wsfold_Linux_x86_64.tar.gz"
      sha256 "ab4445613cec65114e1ebd4ec455901ab317db67cf5045058c5ceca762a9ddcb"
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
