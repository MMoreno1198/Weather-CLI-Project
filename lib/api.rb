
class API

@@key = "b7c5053e0f854824ad80674105cca444"

def self.get_request

  response = HTTParty.get("https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&exclude={part}&appid=#{@@key}")

end
end
