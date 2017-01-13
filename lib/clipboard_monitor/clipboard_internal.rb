require 'emittr'
require 'rufus-scheduler'
require 'clipboard'

module ClipboardMonitor
  class ClipboardInternal
    attr_accessor :last_text, :emitter, :scheduler
    def initialize
      self.last_text = clipboard_text
      self.emitter = Emittr::Emitter.new
      self.scheduler = Rufus::Scheduler.new(frequency: '.2s')
    end
    def clipboard_text
      return Clipboard.paste.strip
    end
    def stop_monitoring
      scheduler.shutdown
    end
    def check_text_change
      current_text = clipboard_text
      if current_text == last_text
        return false
      else
        puts "Change"
        self.last_text = current_text
        return current_text
      end
    end
    def watch_for_text(&block)
      emitter.on :clipboard_text_changed do |contents|
        block.call(contents)
      end
      start_monitoring
    end
    def start_monitoring
      scheduler.every '.2s', overlap: false do
        result = check_text_change
        emitter.emit :clipboard_text_changed, result if result
      end
      scheduler.join
    end
  end
end
