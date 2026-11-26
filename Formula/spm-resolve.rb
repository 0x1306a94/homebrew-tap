# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class SpmResolve < Formula
  version "0.1.0"
  desc "Swift Pagckage 依赖解析"
  homepage "https://github.com/0x1306a94/spm-resolve"
  url "https://github.com/0x1306a94/spm-resolve/releases/download/#{SpmResolve.version}/spm-resolve-#{SpmResolve.version}.zip"
  sha256 "e0c7ac7f06ad86e656cf21ff645c14b112e9be9658048895eed6972150db8f9b"

  def install
    bin.install "spm-resolve"
  end

  test do
    system "#{bin}/spm-resolve", "--version"
  end
end
