# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class CocoapodsCacheProxyServer < Formula
    desc "calsx 规则合并"
    homepage "https://github.com/0x1306a94/homebrew-apps"
    url "https://raw.githubusercontent.com/0x1306a94/homebrew-apps/master/cocoapods-cache-proxy-server.zip"
    sha256 "f4d12523994fae1e781ad1a2df25b9f05c1b31bc32c8cdca783b107a4f6c4f92"
  
    # depends_on "cmake" => :build
  
    def datadir
      prefix/"cocoapods-cache-proxy-server"
    end
  
    def install
      bin.install "cocoapods-cache-proxy-server"
      (datadir).mkpath
      (datadir/"conf.yaml").write <<~EOS
      ---
      user: admin
      password: 123456dd
      port: 9898
      cacheDir: #{datadir}
      verbose: true
      EOS
      puts <<~EOS
  
        How to use?
        config file path: #{datadir}/conf.yaml
        cache dir: #{datadir}
        
        # start
        brew services start cocoapods-cache-proxy-server

        # stop
        brew services stop cocoapods-cache-proxy-server

        # restart
        brew services restart cocoapods-cache-proxy-server

      EOS
    end
  
    plist_options :manual => "cocoapods-cache-proxy-server"
  
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
          <string>#{opt_bin}/cocoapods-cache-proxy-server</string>
          <string>-conf</string>
          <string>#{datadir}/conf.yaml</string>
        </array>
        <key>WorkingDirectory</key>
        <string>#{datadir}</string>
        <key>StandardErrorPath</key>
        <string>#{datadir}/error.log</string>
        <key>StandardOutPath</key>
        <string>#{datadir}/out.log</string>
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