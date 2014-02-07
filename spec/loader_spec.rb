require 'spec_helper'

describe FileMarshal::Loader do
  let(:file) { File.open(File.dirname(__FILE__) + '/support/commodore.jpg') }
  let(:attributes) { JSON.parse(FileMarshal::Dumper.new(file).to_hash.to_json) }
  let(:loader) { FileMarshal::Loader.new(attributes) }

  describe '#tempfile' do
    let(:new_file) { loader.tempfile }

    it "is a tempfile" do
      new_file.should be_a Tempfile
    end

    it "should have the right mtime" do
      new_file.mtime.should == attributes[:updated_at]
    end

    it "should have the right content" do
      new_file.read.should == attributes[:content]
    end
  end

  describe '#file' do
    let(:new_file) { loader.to_file(new_commodore_path) }
    let(:new_commodore_path) { File.dirname(__FILE__) + '/support/new_commodore.jpg' }

    before do
      File.delete(new_commodore_path) if File.exist?(new_commodore_path)
    end

    it "creates the file" do
      loader.to_file(new_commodore_path)
      File.exist?(new_commodore_path).should be_true
    end

    it "should have the right mtime" do
      new_file.mtime.should == attributes[:updated_at]
    end

    it "should have the right content" do
      new_file.read.should == attributes[:content]
    end
  end

  describe '#name' do
    it "gets it from the attributes passed in" do
      loader.name.should == 'commodore.jpg'
    end
  end
end