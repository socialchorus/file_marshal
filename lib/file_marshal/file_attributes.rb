module FileMarshal
  class FileAttributes < Struct.new(:name, :content, :updated_at)
  end
end