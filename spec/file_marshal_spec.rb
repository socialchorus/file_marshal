require 'spec_helper'

describe FileMarshal do
  let(:path) { File.dirname(__FILE__) + '/support/commodore.jpg' }
  let(:hash) { {hello: 'world'} }

  describe '.dump' do
    let(:dumper) { double('dumper', to_hash: hash) }
    
    let(:file) { File.open(path) }

    it "converts to a string using the Dumper" do
      FileMarshal::Dumper.should_receive(:new).with(file).and_return(dumper)

      FileMarshal.dump(file).should == hash.to_json
    end
  end

  describe '.load' do
    let(:loader) { double("writer", to_file: "file", tempfile: 'tempfile') }
    
    context 'when a path is provided' do
      it "returns a file with the path" do
        FileMarshal::Loader.should_receive(:new)
          .with({'hello' => 'world'})
          .and_return(loader)
        loader.should_receive(:to_file).with(path).and_return('my file')

        FileMarshal.load(hash.to_json, path).should == 'my file'
      end
    end 

    context 'when a path is not provided' do
      it "returns a tempfile" do
        FileMarshal::Loader.should_receive(:new)
          .with({'hello' => 'world'})
          .and_return(loader)
        loader.should_receive(:tempfile).and_return('tempfile')

        FileMarshal.load(hash.to_json).should == 'tempfile'
      end
    end
  end
end