class Agcp < Formula
  desc "Lightweight Rust proxy translating Anthropic Claude API to Google Cloud Code API"
  homepage "https://github.com/skyline69/agcp"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/skyline69/agcp/releases/download/v#{version}/agcp-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "3ae06b90595671fdd56cdcef0bd6cf5ab651f1b390d261a1063b035d60711791"
    else
      url "https://github.com/skyline69/agcp/releases/download/v#{version}/agcp-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b6968ebff86d1ed2a0b9e13c34d5d2827945ed8f04c54501cc62ead7fa2822bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/skyline69/agcp/releases/download/v#{version}/agcp-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7fb9179f6334bdc30f187424e26d6432feb1004cc52a8b97fc9f5eb198f66881"
    else
      url "https://github.com/skyline69/agcp/releases/download/v#{version}/agcp-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "61cc723e077f5920f1db1cf9dcda873f285cdf133a01e02de357f3e7200679c6"
    end
  end

  def install
    bin.install "agcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agcp --version")
  end
end
