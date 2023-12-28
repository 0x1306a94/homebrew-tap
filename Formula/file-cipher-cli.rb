# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class FileCipherCli < Formula
  version "1.1.0"
  desc "支持xor或者AES 256 CBC 加解密文件"
  homepage "https://github.com/0x1306a94/file_cipher"
  url "https://github.com/0x1306a94/file_cipher/releases/download/#{FileCipherCli.version}/file_cipher_cli-macos-universal-v#{FileCipherCli.version}-binaries.zip"
  sha256 "07235e8c4bd787bd661466e8cb3cb5c0ca32cfbf03f5b7701117220d83c159d1"

  def install
    bin.install "file_cipher_cli"
    puts <<~EOS
           
           encrypt and decrypt files

           Usage: file_cipher_cli [OPTIONS] <COMMAND>
           
           Commands:
             xor
             aes
             generate-key
             help          Print this message or the help of the given subcommand(s)
           
           Options:
             -v, --verbose...  Increase logging verbosity
             -q, --quiet...    Decrease logging verbosity
             -h, --help        Print help
             -V, --version     Print version
         EOS
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test ytoo`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
