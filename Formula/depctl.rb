# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Depctl < Formula
  version "1.4.5"
  desc "A Rust implementation of dependency management tool similar to depsync"
  homepage "https://github.com/0x1306a94/depctl"
  url "https://github.com/0x1306a94/depctl/releases/download/v#{Depctl.version}/depctl-mac-universal.zip"
  # TODO: Update sha256 after first release is created
  # Run: shasum -a 256 <downloaded_file.zip>
  sha256 "9932ec521c78340584c8c7fac6d779d472b9086fd9cb6825a75252134b210ca8"

  def install
    bin.install "depctl"
    puts <<~EOS
           
           A Rust implementation of dependency management tool similar to depsync
           
           Usage: depctl [platform] [options]
           
           Examples:
             depctl mac              # Sync dependencies for macOS
             depctl --help           # Show help information
             depctl --version        # Show version
         EOS
  end

  test do
    system "#{bin}/depctl", "--version"
  end
end
