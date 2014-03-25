require "spec_helper"
require "tmpdir"

include Dens

describe Mover do

  it "has an origin" do
    mover = Mover.new("origin", "destination")
    expect(mover.origin).to eq "origin"
  end

  it "has a destination" do
    mover = Mover.new("origin", "destination")
    expect(mover.destination).to eq "destination"
  end

  it "uses the current working directory as the default destination" do
    mover = Mover.new("origin")
    expect(mover.destination).to eq Dir.pwd
  end

  it "verifies existence of the origin directory" do
    origin, destination, drawable = create_tmp_dirs
    expect{Mover.move("does not exist", destination)}.to raise_error(Mover::OriginDoesNotExistError)
  end

  it "verifies existence of the destination directory" do
    origin, destination, drawable = create_tmp_dirs
    expect{Mover.move(origin, "does not exist")}.to raise_error(Mover::DestinationDoesNotExistError)
  end

  it "moves files without a suffix into drawable" do
    origin, destination, drawable = create_tmp_dirs
    Mover.move(origin, destination)
    expect(File.exists?(drawable)).to be_true
  end

  it "moves files with a suffix into drawable-[suffix]" do
    origin, destination, drawable = create_tmp_dirs "-density"
    Mover.move(origin, destination)
    expect(File.exists?(drawable)).to be_true
  end

  it "moves files into drawable if drawable-density doesn't exist" do
    origin = create_origin("-density")
    destination, drawable = create_destination
    Mover.move(origin, destination)
    expect(File.exists?(drawable)).to be_true
  end

  def create_tmp_dirs(suffix = "")
    origin = create_origin(suffix)
    destination, drawable = create_destination(suffix)
    [origin, destination, drawable]
  end

  def create_origin(suffix = "")
    origin = Dir.mktmpdir
    FileUtils.touch(File.join(origin, "drawable#{suffix}.png"))
    origin
  end

  def create_destination(suffix = "")
    destination = Dir.mktmpdir
    drawable_directory = File.join(destination, "drawable#{suffix}")
    Dir.mkdir(drawable_directory)
    drawable = File.join(drawable_directory, "drawable.png")
    [destination, drawable]
  end
end
