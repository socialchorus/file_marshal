module FileMarshal
  class Writer
    class Temp < Writer
      def file
        @file ||= Tempfile.new(name)
      end
    end
  end
end