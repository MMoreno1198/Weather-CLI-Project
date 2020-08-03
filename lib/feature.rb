
class Feature

    attr_accessor :weather, :temp, :title, :humidity, :source

    @@all = []

    def initialize(attr_accessor)

        @weather = weather
        @temp = temp
        @title = title
        @humidity = humidity
        @source = source

        @@all << self

    end

    def self.all

        @@all

    end

    def self.destroy_all
        self.all.clear

    end
end
