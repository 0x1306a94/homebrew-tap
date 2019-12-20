# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class YtooClashxRuleMerge < Formula
  desc "calsx 规则合并"
  homepage "https://github.com/0x1306a94/homebrew-apps"
  url "https://raw.githubusercontent.com/0x1306a94/homebrew-apps/master/ytoo-clashx-rule-merge.zip"
  sha256 "362057e463d03c44818e8c7b271f26ed11b9d5b417434df3df24c261389c57ad"

  # depends_on "cmake" => :build

  def datadir
    prefix/"clashx-rule-merge"
  end

  def install
    bin.install "ytoo-clashx-rule-merge"
    system "mkdir", "-p", "#{datadir}"
    (datadir/"conf.yaml").write <<~EOS
      Rule:
    EOS
  end

  plist_options :manual => "ytoo-clashx-rule-merge"

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>KeepAlive</key>
      <true/>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{opt_bin}/ytoo-clashx-rule-merge</string>
        <string>--port</string>
        <string>9999</string>
        <string>--file</string>
        <string>#{datadir}/conf.yaml</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
    </dict>
    </plist>
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