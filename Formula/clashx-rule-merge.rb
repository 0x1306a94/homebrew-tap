# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class ClashxRuleMerge < Formula
  desc "calsx 规则合并"
  homepage "https://github.com/0x1306a94/homebrew-apps"
  url "https://raw.githubusercontent.com/0x1306a94/homebrew-apps/master/clashx-rule-merge.zip"
  sha256 "7e2ba25b0dfcff851162bbc7fb31b1527e95d554c2862a1154e79e02d4a02a20"

  # depends_on "cmake" => :build

  def datadir
    prefix/"clashx-rule-merge"
  end

  def install
    bin.install "clashx-rule-merge"
    (datadir).mkpath
    (datadir/"conf.yaml").write <<~EOS
      Rule:
    EOS

    puts <<~EOS

      \033[32mHow to use?\033[0m

      \033[36mManual operation:\033[0m
      \033[33mytoo-clashx-rule-merge --port 8080 -- file xxx.yaml\033[0m

      \033[36mDaemon running:\033[0m
      \033[33mbrew services start ytoo-clashx-rule-merge\033[0m # start
      \033[33mbrew services stop ytoo-clashx-rule-merge\033[0m # stop

      \033[32mHow to configure rules?\033[0m
      \033[33m1.First open the #{datadir}/conf.yaml file.\033[0m
      \033[33m2.And then append the rule. The rule USES YAML syntax.\033[0m
      \033[33m3.A rule contains (match mode, match, route).\033[0m
      \033[35mThe sample:\033[0m
        Rule:
        - DOMAIN,www.google.com,PROXY
        - DOMAIN-SUFFIX,qq.com,DIRECT
        - DOMAIN-SUFFIX,apple.com,PROXY
        - IP-CIDR,10.20.120.0/24,DIRECT 
      
    EOS
  end

  plist_options :manual => "clashx-rule-merge"

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
        <string>#{opt_bin}/clashx-rule-merge</string>
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