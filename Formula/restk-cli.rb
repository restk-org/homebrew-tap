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
  version "0.7.0"
  license "Proprietary"

  # Update these URLs and checksums on each release
  # Checksums from: releases.restk.ai/restk-cli-releases/production/cli/vX.Y.Z/checksums.txt
  on_macos do
    if Hardware::CPU.arm?
      url "https://releases.restk.ai/restk-cli-releases/production/cli/v#{version}/restk-cli-v#{version}-darwin-arm64.tar.gz"
      sha256 "f7706f26b59021bfd2d74c95a49d6a320575b4e292039b855d8480a00aada402"
    else
      url "https://releases.restk.ai/restk-cli-releases/production/cli/v#{version}/restk-cli-v#{version}-darwin-amd64.tar.gz"
      sha256 "dcaa846d5768458d87531389409ea292bed82dd926179cd576b067dd50458b5b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://releases.restk.ai/restk-cli-releases/production/cli/v#{version}/restk-cli-v#{version}-linux-arm64.tar.gz"
      sha256 "ffbe78c383a6173345fca1792a733efa51b40847d8dce86e957e3a67365bcb63"
    else
      url "https://releases.restk.ai/restk-cli-releases/production/cli/v#{version}/restk-cli-v#{version}-linux-amd64.tar.gz"
      sha256 "7b46451e743fcebf8225215e1b0688a3c4b3fda2782c856fb044306de7ac1cfa"
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
