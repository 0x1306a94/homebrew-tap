# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class YtooClashxRuleMerge < Formula
  desc "calsx 规则合并"
  homepage "https://github.com/0x1306a94/homebrew-apps"
  url "https://raw.githubusercontent.com/0x1306a94/homebrew-apps/master/ytoo-clashx-rule-merge"
  sha256 "875881034ffc4c8c6a5894a64a724cee718b1e45229909344893744560c29ed0"

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel 
    cnf = ENV['HOME']/.ytoo-clashx-rule-merge/conf.yaml
    if cnf.exist?
        system "echo 'Rule:' > #{cnf}"
    else
        puts "Then #{cnf} file does not exist"
    end
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
        <string>#{plist_name}/string>
        <key>ProgramArguments</key>
        <array>
            <string>#{opt_bin}/ytoo-clashx-rule-merge</string>
            <string>--port</string>
            <string>9999</string>
            <string>--file</string>
            <string>#{ENV['HOME']}/.ytoo-clashx-rule-merge/conf.yaml</string>
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