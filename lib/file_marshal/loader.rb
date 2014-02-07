module FileMarshal
  class Loader
    attr_reader :attributes, :file

    def initialize(opts)
      opts.symbolize_keys!
      @attributes = FileAttributes.new(
        opts[:name], opts[:content], opts[:updated_at]
      )
    end

    delegate :name,
        to: :attributes

    def tempfile
      Writer::Temp.new(attributes).build
    end

    def to_file(path)
      Writer::File.new(attributes, path).build
    end
  end
end