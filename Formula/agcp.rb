class Agcp < Formula
  desc "Lightweight Rust proxy translating Anthropic Claude API to Google Cloud Code API"
  homepage "https://github.com/skyline69/agcp"
  version "1.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/skyline69/agcp/releases/download/v#{version}/agcp-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "ed27590d2cd4cc8baf1f42455873e837fcf083d0faae5260d7378a0c202a5554"
    else
      url "https://github.com/skyline69/agcp/releases/download/v#{version}/agcp-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "81730ec95715ad23720ed57d8f8570a2e8e0f33120137e5fdfcb8c6b49a55da6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/skyline69/agcp/releases/download/v#{version}/agcp-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aa16696908d66f357559e30ac2efc981a2210720988c58b7567e64db9a31d06b"
    else
      url "https://github.com/skyline69/agcp/releases/download/v#{version}/agcp-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1668007ba3b822f6c808e10e90aada475bfbcb7161ac2611e41a718c15b6c574"
    end
  end

  def install
    bin.install "agcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agcp --version")
  end
end
