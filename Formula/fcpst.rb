VERSION="0.1.4"
PRODUCT="fcpst"

class Fcpst < Formula
  desc "A tool for archiving files and directories and extracting several archive formats."
  homepage "https://github.com/clownUR/fcpst"
  version VERSION
  license "MIT"
  option "without-completions", "Disable completions"
  depends_on "bash-completion@2" => :optional

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/clownUR/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_darwin_amd64.tar.gz"
    sha256 "c91c100f4cbb925a629063cb7dbf2f9cb0e7b3acee56f58fc8622d79e2b0ea63"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clownUR/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_darwin_arm64.tar.gz"
    sha256 "9a46d1e738eb10669f085d3c1ba08c4275e13a573d3bbd92afdf5dc9f4ed48bb"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clownUR/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_linux_amd64.tar.gz"
    sha256 "61a7d4516b7ff79f97d8845f157df4fb46f7542b01491e22e82f0ae1fa916fc0"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clownUR/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_linux_arm64.tar.gz"
    sha256 "53c27f80d4797f0e2eaf252c116a7901551640c12a5bddb8c642a4e9a0491d0e"
  end

  def install
    bin.install "fcpst"
    bash_completion.install "completions/bash/fcpst" if build.with? "completions"
    fish_completion.install "completions/fish/fcpst" if build.with? "completions"
    zsh_completion.install "completions/zsh/_fcpst" if build.with? "completions"
  end

  test do
    system "#{bin}/fcpst --version"
  end
end
