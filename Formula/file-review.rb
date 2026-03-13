class FileReview < Formula
  desc "File review tool with CodeMirror editor and Vim bindings"
  homepage "https://github.com/desplega-ai/ai-toolbox"
  version "1.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/desplega-ai/ai-toolbox/releases/download/file-review-v#{version}/file-review-darwin-arm64"
      sha256 "d8bc9b7b351c673c39b7b6a0b1cc9f4654e8bda6b0834a563f78d489dd40e23d"
    end
    on_intel do
      url "https://github.com/desplega-ai/ai-toolbox/releases/download/file-review-v#{version}/file-review-darwin-x86_64"
      sha256 "17cabb8e671d3a5929e37a88f89cf921c5a40ca5a465b4d4bea601b2feb2e9b6"
    end
  end

  livecheck do
    url :stable
    regex(/file-review-v?(\d+(?:\.\d+)+)/i)
  end

  def install
    binary_name = Hardware::CPU.arm? ? "file-review-darwin-arm64" : "file-review-darwin-x86_64"
    bin.install binary_name => "file-review"
  end

  test do
    system "#{bin}/file-review", "--help"
  end
end
