# FileMarshal

FileMarshal has the goal of providing easy ways to serialize files to send across the wire. Marshal is unable to dump files because they are IO and potentially limitless. In practice, files are finite and we want to move them around. Enjoy!

## Installation

Add this line to your application's Gemfile:

    gem 'file_marshal'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install file_marshal

## Usage

FileMarshal uses the class methods `FileMarshal.dump(file)` and `FileMarshal.load(string)` to pack and unpack files. As with other types of serialization including YAML, JSON, and Marshal, the files are packaged as a string. 

In order to serialize a file into a string you could use this code:

    file = File.new(my_path, 'r')
    serialized_file = FileMarshal.dump(file) # => a string of data that can be read again

When you are ready to read these serializations back into a file, use the load method:

    tempfile = FileMarshal.load(serialized_file)

If you are looking for a file with a specific path, rather than a tempfile, pass the path in as a second argument:

    file = FileMarshal.load(serialized_file, new_path)

In reality, this string is JSON, and under the covers there are classes that work with hashes to pass the data around. In many instances you will want to use these underlying classes instead of the `.dump` and `.load` methods:

    hash = FileMarshal::Dumper.new(file).to_hash

    tempfile = FileMarshal::Loader.new(hash).tempfile
    file = FileMarshal::Loader.new(hash).to_file(my_great_path)

Everything is very small objects, which should make other usages as easy as inspecting the code.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
