VERSION="0.1.1"
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
    sha256 "f4ab387e2e03c559140a970497d90c0ae4e653fe80509647e7ce1b4df3ee3889"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clownUR/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_darwin_arm64.tar.gz"
    sha256 "cb674e3facf3831a20cf1be9363f935f13205f604e672d4a8204228cd544fed4"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clownUR/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_linux_amd64.tar.gz"
    sha256 "3be99051d6e2b039b0b91e47edba926676ea4b864727bf7eb960b88f8ec6affb"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clownUR/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_linux_arm64.tar.gz"
    sha256 "334a660d3c5ab128d5f0712cacb60a032a85b1909949ba15fcf0a6f5023ea9d3"
  end

  def install
    bin.install "fcpst"
    bash_completion.install "completions/bash/sibling.bash" if build.with? "completions"
    fish_completion.install "completions/fish/sibling.bash" if build.with? "completions"
    zsh_completion.install "completions/zsh/sibling.bash" if build.with? "completions"
  end

  test do
    system "#{bin}/fcpst --version"
  end
end
