module FileMarshal
  class Writer
    class File < Writer
      attr_reader :path

      def initialize(attributes, path)
        @attributes = attributes
        @path = path
      end

      def file
        @file ||= ::File.new(path, "w+")
      end
    end
  end
end