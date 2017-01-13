module ClipboardMonitor
  class ClipboardMonitor
    def self.on_clipboard_change(&block)
      @clipboard_internal ||= ClipboardInternal.new
      @clipboard_internal.watch_for_text do |txt|
        block.call(txt)
      end
    end
    def self.stop
      @clipboard_internal.stop_monitoring
    end
  end
end
