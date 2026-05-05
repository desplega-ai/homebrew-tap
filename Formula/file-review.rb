class FileReview < Formula
  desc "File review tool with CodeMirror editor and Vim bindings"
  homepage "https://github.com/desplega-ai/ai-toolbox"
  version "1.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/desplega-ai/ai-toolbox/releases/download/file-review-v#{version}/file-review-darwin-arm64"
      sha256 "00c2454e5eae733b7e91e95970c033393faca7bc3d904b3aba8306c0453cdce6"
    end
    on_intel do
      url "https://github.com/desplega-ai/ai-toolbox/releases/download/file-review-v#{version}/file-review-darwin-x86_64"
      sha256 "24ee90b21e0ee817bf407437660c1dbbbaa1ea3890b41e768ffde1ddbf79baef"
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
