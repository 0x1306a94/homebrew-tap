# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class TencentMarsXlogUtil < Formula
  version "0.1.2"
  desc "腾讯Xlog 日志解码"
  homepage "https://github.com/0x1306a94/tencent-mars-xlog-rust"
  url "https://github.com/0x1306a94/tencent-mars-xlog-rust/releases/download/#{TencentMarsXlogUtil.version}/tencent-mars-xlog-util-macos-universal-v#{TencentMarsXlogUtil.version}-binaries.zip"
  sha256 "8c5c5e832f1defe1e4efc9900c28d786da6943ac5a35319ba31ccaebd0118861"

  # depends_on "cmake" => :build

  def install
    bin.install "tencent-mars-xlog-util"
    puts <<~EOS

           \033[32mtencent-mars-xlog-util #{TencentMarsXlogUtil.version}\033[0m
           0x1306a94 <0x1306a94@gmail.com>
           tencent-mars-xlog-util

           \033[33mUSAGE:\033[0m
               tencent-mars-xlog-util <SUBCOMMAND>

           \033[33mOPTIONS:\033[0m
               \033[32m-h, --help\033[0m       Print help information
               \033[32m-V, --version\033[0m    Print version information

           \033[33mSUBCOMMANDS:\033[0m
               \033[32mdecode\033[0m     Decode Xlog
               \033[32mgen-key\033[0m    Generate the key
               \033[32mhelp\033[0m       Print this message or the help of the given subcommand(s)

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
