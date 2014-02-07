require "spec_helper"

describe FileMarshal::Dumper do
  # Setting the mtime : http://stackoverflow.com/questions/8425689/how-can-i-set-a-file-creation-time-with-ruby-on-mac-os
  # mtime is modified time, ctime is changed at time; mtime is what we want.  

  let(:file) { File.open(File.dirname(__FILE__) + '/support/commodore.jpg') }
  let(:loader) { FileMarshal::Dumper.new(file) }

  describe "#to_hash" do
    let(:attributes) { loader.to_hash }

    it "gets the file name" do
      attributes[:name].should == "commodore.jpg"
    end

    it "gets the updated at time for the file" do
      attributes[:updated_at].should == file.mtime
    end

    it "takes a file and turns it into a string" do
      content = file.read
      attributes[:content].should == content
    end
  end
end