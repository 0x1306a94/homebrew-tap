# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class FileCipher < Formula
  version "1.0.0"
  desc "简单的文件加解密"
  homepage "https://github.com/0x1306a94/file_cipher"
  url "https://github.com/0x1306a94/file_cipher/releases/download/#{FileCipher.version}/file_cipher-macos-universal-v#{FileCipher.version}-binaries.zip"
  sha256 "fa6eb289e73e1b4acd561f77b639fac21ba2a79a2c38c3d9c3cd92b0353c9ba1"

  # depends_on "cmake" => :build

  def install
    bin.install "file_cipher"
    puts <<~EOS

           Simply use xor to encrypt and decrypt files

           Usage: file_cipher [OPTIONS] --input <INPUT> --output <OUTPUT> --xor <XOR>
           
           Options:
             -i, --input <INPUT>    input file path or input directory
             -o, --output <OUTPUT>  output directory
             -e, --encrypt          encrypt the input file
             -d, --decrypt          decrypt the input file
             -x, --xor <XOR>        each byte of the input file is xor evaluated against this value, and it can't be zero
             -h, --help             Print help
             -V, --version          Print version
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
