class Agcp < Formula
  desc "Lightweight Rust proxy translating Anthropic Claude API to Google Cloud Code API"
  homepage "https://github.com/skyline69/agcp"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/skyline69/agcp/releases/download/v#{version}/agcp-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "77d94f6f597d24c6e77d3310146afacfe387fff9361472d602c6b7da58b70b5d"
    else
      url "https://github.com/skyline69/agcp/releases/download/v#{version}/agcp-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "9ff371b1b1ff1fd7f963e0de2bacf420f7f4dcf42a78c45ad6cae361e51a33c6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/skyline69/agcp/releases/download/v#{version}/agcp-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fa7f17e2e7ce7c6a1a6ae9a1abf56567cf6e12121673eac942349edfc10a5a30"
    else
      url "https://github.com/skyline69/agcp/releases/download/v#{version}/agcp-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0d0b0be6cfd431377bb3bd2afc58df486fc6b752a080fd284d8484043bff4430"
    end
  end

  def install
    bin.install "agcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agcp --version")
  end
end
