module FileMarshal
  class Writer
    attr_reader :attributes, :file

    def initialize(attributes)
      @attributes = attributes
    end

    delegate :name, :content, :updated_at,
      to: :attributes

    def build
      write
      set_time
      prepare
    end  

    def file
      raise NotImplementedError
    end

    def write
      file.write(content)
      file
    end

    def set_time
      ::File.utime(file.atime, Time.parse(updated_at), file.path)
    end

    def prepare
      file.rewind
      file
    end
  end
end