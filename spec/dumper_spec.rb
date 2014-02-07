require "spec_helper"

describe FileMarshal::Dumper do
  let(:file) { File.open(File.dirname(__FILE__) + '/support/commodore.jpg') }
  let(:dumper) { FileMarshal::Dumper.new(file) }

  describe "#to_hash" do
    let(:attributes) { dumper.to_hash }

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