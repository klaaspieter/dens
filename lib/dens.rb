require "dens/version"
require "dens/cli"
require "fileutils"

module Dens

  def self.move(origin, destination)
    Mover.move(origin, destination)
  end

  class Mover
    attr_reader :origin, :destination

    OriginDoesNotExistError = Class.new(RuntimeError)
    DestinationDoesNotExistError = Class.new(RuntimeError)

    def initialize(origin, destination = Dir.pwd)
      @origin = origin
      @destination = destination
    end

    def self.move(origin, destination)
      Mover.new(origin, destination).move
    end

    def move
      raise OriginDoesNotExistError unless Dir.exists?(origin)
      raise DestinationDoesNotExistError unless Dir.exists?(destination)

      Dir.glob(File.join(origin, "*.png")).each do |drawable_origin|
        drawable_extension = File.extname(drawable_origin)
        drawable_name = File.basename(drawable_origin, drawable_extension)

        partitions = drawable_name.partition("-")
        density = partitions.last
        name = partitions.first

        drawable_destination = File.join(destination, "drawable", name)
        if (!density.empty?)
          directory = File.join(destination, "drawable-#{density}")
          if File.exists?(directory)
            drawable_destination = File.join(directory, name)
          end
        end
        drawable_destination += drawable_extension

        puts "#{drawable_origin} => #{drawable_destination}"
        FileUtils.move(drawable_origin, drawable_destination)
      end
    end
  end
end
