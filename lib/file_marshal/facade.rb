module FileMarshal
  def self.dump(file)
    hash = FileMarshal::Dumper.new(file).to_hash
    hash.to_json
  end

  def self.load(string, path=nil)
    hash = JSON.parse(string)
    loader = FileMarshal::Loader.new(hash)
    path ? loader.to_file(path) : loader.tempfile
  end
end