class Agcp < Formula
  desc "Lightweight Rust proxy translating Anthropic Claude API to Google Cloud Code API"
  homepage "https://github.com/skyline69/agcp"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/skyline69/agcp/releases/download/v#{version}/agcp-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "9a3d72bab590375fff64923ab59b500b00e99499a54de74058795323c068db81"
    else
      url "https://github.com/skyline69/agcp/releases/download/v#{version}/agcp-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "bdec946fad36fc2bcf3f7c1d429bc9982dda48cb6ad2451fff2840619f9f1fa9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/skyline69/agcp/releases/download/v#{version}/agcp-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fa62c4e89e7aaf175097ca130dd418bf6227666381cd93184661dec7754d023a"
    else
      url "https://github.com/skyline69/agcp/releases/download/v#{version}/agcp-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "27af967aaf5a71bed069d30fadaff9ee3c873bb50e62489afe466b0df3874c9c"
    end
  end

  def install
    bin.install "agcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agcp --version")
  end
end
