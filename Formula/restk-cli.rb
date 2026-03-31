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
  version "0.7.2"
  license "Proprietary"

  # Update these URLs and checksums on each release
  # Checksums from: releases.restk.ai/restk-cli-releases/production/cli/vX.Y.Z/checksums.txt
  on_macos do
    if Hardware::CPU.arm?
      url "https://releases.restk.ai/restk-cli-releases/production/cli/v#{version}/restk-cli-v#{version}-darwin-arm64.tar.gz"
      sha256 "cd4d342c62b16dc196ce34b67616d1998e4ca3abfb8d26f9b368f698a070e04b"
    else
      url "https://releases.restk.ai/restk-cli-releases/production/cli/v#{version}/restk-cli-v#{version}-darwin-amd64.tar.gz"
      sha256 "0c57ece26d976cfe4d425257eccb6843c8e1a95e37065954fff6c0ae660bc272"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://releases.restk.ai/restk-cli-releases/production/cli/v#{version}/restk-cli-v#{version}-linux-arm64.tar.gz"
      sha256 "793121c62ef557f8ddbc757a23aa9c65c75687c8b81def95bdfd8edd35552fa6"
    else
      url "https://releases.restk.ai/restk-cli-releases/production/cli/v#{version}/restk-cli-v#{version}-linux-amd64.tar.gz"
      sha256 "cc5446601e548b611d000bc2baa4addbce6ba68122d2a46d6a8d6ac5fba9f8e8"
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
