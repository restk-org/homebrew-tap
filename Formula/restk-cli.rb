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
  version "0.8.0"
  license "Proprietary"

  # Update these URLs and checksums on each release
  # Checksums from: releases.restk.ai/restk-cli-releases/production/cli/vX.Y.Z/checksums.txt
  on_macos do
    if Hardware::CPU.arm?
      url "https://releases.restk.ai/restk-cli-releases/production/cli/v#{version}/restk-cli-v#{version}-darwin-arm64.tar.gz"
      sha256 "e0cdc60cedb00c9121516b8ef80a094f443d83ddc6e84962f93e6b1f11671357"
    else
      url "https://releases.restk.ai/restk-cli-releases/production/cli/v#{version}/restk-cli-v#{version}-darwin-amd64.tar.gz"
      sha256 "bc34f4cead4315835a6651f0123294e8a5f570b3ae767c124b77c809066ad8ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://releases.restk.ai/restk-cli-releases/production/cli/v#{version}/restk-cli-v#{version}-linux-arm64.tar.gz"
      sha256 "bb39b94f0d47617f4cc1ccd56eb909abe25bc359f22c4ef560fc6af14bdcad85"
    else
      url "https://releases.restk.ai/restk-cli-releases/production/cli/v#{version}/restk-cli-v#{version}-linux-amd64.tar.gz"
      sha256 "cbd1f8a694a7c60a908ea8288db57bedf5acb36eb50fd76b70afeb86b01e3e64"
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
