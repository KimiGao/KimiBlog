Paperclip.options[:command_path] = "/usr/bin"
Paperclip.options[:image_magick_path] = "/usr/bin"  
Paperclip.options[:swallow_stderr] = false

def run cmd, params = "", expected_outcodes = 0
  command = %Q<#{%Q[#{path_for_command(cmd)} #{params}].gsub(/\s+/, " ")}>
  command = "#{command} 2>#{bit_bucket}" if Paperclip.options[:swallow_stderr]
  output = `#{command}`
  unless [expected_outcodes].flatten.include?($?.exitstatus)
    raise PaperclipCommandLineError, "Error while running #{cmd}"
  end
  output
end
