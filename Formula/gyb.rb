# typed: false
# frozen_string_literal: true

# :nodoc:
class Gyb < Formula
  desc "\"Generate Your Boilerplate\""
  homepage "https://nshipster.com/swift-gyb/"
  url "https://raw.githubusercontent.com/apple/swift/fdae97aaad7b3ec7f03ed8e544a00b19de2cc93b/utils/gyb"
  version "2022-04-12"
  sha256 "5647355be7d91007cc4c849da79bea235a7d7f97871384f0d12f639402d53190"

  depends_on xcode: ["10.0", :build]

  resource "gyb.py" do
    url "https://raw.githubusercontent.com/apple/swift/fdae97aaad7b3ec7f03ed8e544a00b19de2cc93b/utils/gyb.py"
    sha256 "f3a74dc844f99c5e74e520a829f1c962e7d4eb802de845fb5b38f800f5612b9f"
    version "2022-04-12"
  end
  depends_on "python@3" if MacOS.version <= :snow_leopard

  def install
    resource("gyb.py").stage { bin.install "gyb.py" }
    bin.install "gyb"
    chmod 0755, bin/"gyb"
  end

  test do
    system bin/"gyb", "--help"
  end
end
