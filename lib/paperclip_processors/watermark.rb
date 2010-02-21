# custom watermarking processor
# using the passed watermark image path and applies it to the source image.
# if no watermark_path is passed, then nothing happens, we just pass it through.
module Paperclip
  class Watermark < Thumbnail # because I'm lazy

    attr_accessor :watermark_path

    # Adds a watarmark
    def initialize file, options = {}, attachment = nil
      super
      @watermark_path = options[:watermark_path]
    end
    
    # Adds a watermark and returns the Tempfile
    # that contains the new image.
    def make
      src = @file
      
      if @watermark_path.blank?
        return src # no watermark path, just return the source file
      else
        # create the destination file
        dst = Tempfile.new([@basename, @format].compact.join("."))
        dst.binmode
        
        # assemble the composite options for the command
        command = <<-end_command
          -gravity center -geometry +0+10 #{@watermark_path}
          "#{ File.expand_path(src.path) }[0]"
          "#{ File.expand_path(dst.path) }"
        end_command

        # perform the watermarking
        begin
          success = Paperclip.run("composite", command.gsub(/\s+/, " "))
        rescue PaperclipCommandLineError
          raise PaperclipError, "There was an error processing the watermark for #{@basename}" if @whiny
        end
        return dst
      end
    end

  end
end