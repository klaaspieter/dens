class Dens::CLI
  attr_reader :origin, :destination, :mover

  def initialize(options = {})
    @origin = options.fetch(:origin)
    @destination = options.fetch(:destination)
    @mover = options.fetch(:mover, Dens::Mover)
  end

  def start
    mover.move(origin, destination)
  end

  def self.start
    Dens::CLI.new(origin: ARGV[0], destination: ARGV[1]).start
  end
end
