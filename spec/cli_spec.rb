require 'spec_helper'

describe Dens::CLI do

  it "moves files from the origin to the destination" do
    mover = double(:mover)
    origin = "origin"
    destination = "destination"

    expect(mover).to receive(:move).with(origin, destination)
    Dens::CLI.new(
      origin: origin,
      destination: destination,
      mover: mover
    ).start
  end

end
