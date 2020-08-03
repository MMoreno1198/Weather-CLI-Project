
class Api

    def self.find_location(string)

        Feature.destroy_all

        url = "https://www.metaweather.com/api/location/search/?query=#{string}"

        response = HTTParty.get(url)

        if response.empty?

            puts " "
            puts "Invalid input. Please enter the name of a major city."
            puts " "

            @input = gets.strip.downcase.split.first

            self.find_location(@input)

        else

        id = response[0]["woeid"]

        self.get_weather(id)

        end
    end

    def self.get_weather(id)

        url = "https://www.metaweather.com/api/location/#{id}"

        response = HTTParty.get(url)

        weather = response["consolidated_weather"][0]["weather_state_name"]

        temp1 = response["consolidated_weather"][0]["the_temp"]

        temp = temp1.round(2)

        humidity = response["consolidated_weather"][0]["humidity"]

        title = response["title"]

        source = response["sources"][0]["title"]

        Feature.new(weather: weather, temp: temp, title: title, humidity: humidity, source: source)

    end
end
