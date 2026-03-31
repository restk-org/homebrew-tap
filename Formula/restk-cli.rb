# Homebrew formula for restk-cli
# Repository: github.com/restk-org/homebrew-tap
#
# To publish:
#   1. Create repo: github.com/restk-org/homebrew-tap
#   2. Copy this file to Formula/restk-cli.rb
#   3. Update VERSION, URLs, and SHA256 checksums on each release
#
# Users install with:
#   brew tap restk/tap
#   brew install restk-cli

class RestkCli < Formula
  desc "RESTk API client CLI — import, export, run, sync"
  homepage "https://restk.ai"
  version "0.6.1"
  license "Proprietary"

  # Update these URLs and checksums on each release
  # Checksums from: releases.restk.ai/restk-cli-releases/production/cli/vX.Y.Z/checksums.txt
  on_macos do
    if Hardware::CPU.arm?
      url "https://releases.restk.ai/restk-cli-releases/production/cli/v#{version}/restk-cli-v#{version}-darwin-arm64.tar.gz"
      sha256 "b2a03edfe9253b240564a74a7e42abe6eebc765cc472094db9710ac97bbc7e71"
    else
      url "https://releases.restk.ai/restk-cli-releases/production/cli/v#{version}/restk-cli-v#{version}-darwin-amd64.tar.gz"
      sha256 "d4cd62240439d161f59190e2773a8d7b9ef98683ad6775a935a54731343966a3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://releases.restk.ai/restk-cli-releases/production/cli/v#{version}/restk-cli-v#{version}-linux-arm64.tar.gz"
      sha256 "982bd371625f3d849e7ce49d37d3832947e9f63c672f392e80d13b7e969123df"
    else
      url "https://releases.restk.ai/restk-cli-releases/production/cli/v#{version}/restk-cli-v#{version}-linux-amd64.tar.gz"
      sha256 "4163b5e5abf86ed5ee2c76991a9008613c0775ff2ad9047aebb556adc059e935"
    end
  end

  def install
    # Binary name in the archive is restk-cli-{os}-{arch}
    if OS.mac? && Hardware::CPU.arm?
      bin.install "restk-cli-darwin-arm64" => "restk-cli"
    elsif OS.mac?
      bin.install "restk-cli-darwin-amd64" => "restk-cli"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "restk-cli-linux-arm64" => "restk-cli"
    else
      bin.install "restk-cli-linux-amd64" => "restk-cli"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/restk-cli --version")
  end
end
