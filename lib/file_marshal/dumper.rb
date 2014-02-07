module FileMarshal
  class Dumper
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def to_hash
      { 
        updated_at: file.mtime,
        name: File.basename(file.path),
        content: content
      }
    end

    def content
      file.rewind
      file.read
    end
  end
end