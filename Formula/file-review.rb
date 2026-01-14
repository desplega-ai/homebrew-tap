class FileReview < Formula
  desc "File review tool with CodeMirror editor and Vim bindings"
  homepage "https://github.com/desplega-ai/ai-toolbox"
  version "1.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/desplega-ai/ai-toolbox/releases/download/file-review-v#{version}/file-review-darwin-arm64"
      sha256 "e12a95587b58f388de496291636aeed1b5186d86b1e1b78df3ac8da5590420f0"
    end
    on_intel do
      url "https://github.com/desplega-ai/ai-toolbox/releases/download/file-review-v#{version}/file-review-darwin-x86_64"
      sha256 "1ec8164687608a325428a693cbeafb0303787e9f97b16f31b39685a2f8e99723"
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
