
class Weather

def greeting

  puts '             .d88888b.                                           '
  puts '            d88P" "Y88b                                          '
  puts '            888     888                                          '
  puts '            888     88888888b.  .d88b. 88888b.                   '
  puts '            888     888888 "88bd8P  Y8b888 "88b                  '
  puts '            888     888888  88888888888888  888                  '
  puts '            Y88b. .d88P888 d88PY8b.    888  888                  '
  puts '             "Y88888P" 88888P"  "Y8888 888  888                  '
  puts '                       888                                       '
  puts '                       888                                       '
  puts '                       888                                       '
  puts '                                                                 '
  puts '   888       888                888   888                        '
  puts '   888   o   888                888   888                        '
  puts '   888  d8b  888                888   888                        '
  puts '   888 d888b 888 .d88b.  8888b. 88888888888b.  .d88b. 888d888    '
  puts '   888d88888b888d8P  Y8b    "88b888   888 "88bd8P  Y8b888P"      '
  puts '   88888P Y8888888888888.d888888888   888  88888888888888        '
  puts '   8888P   Y8888Y8b.    888  888Y88b. 888  888Y8b.    888        '
  puts '   888P     Y888 "Y8888 "Y888888 "Y888888  888 "Y8888 888        '
  puts '                                                                 '
  puts '  888b     d888                          d88888888888b.8888888   '
  puts '  8888b   d8888                         d88888888   Y88b 888     '
  puts '  88888b.d88888                        d88P888888    888 888     '
  puts '  888Y88888P888 8888b. 88888b.        d88P 888888   d88P 888     '
  puts '  888 Y888P 888    "88b888 "88b      d88P  8888888888P"  888     '
  puts '  888  Y8P  888.d888888888  888     d88P   888888        888     '
  puts '  888   "   888888  888888 d88P    d8888888888888        888     '
  puts '  888       888"Y88888888888P"    d88P     888888      8888888   '
  puts '                       888                                       '
  puts '                       888                                       '
  puts '                                                                 '

  end

def forecast24Hours()
  #Get city's name:
  print 'Name in English of the city: '
  name = gets.chomp

  puts ''
  puts '==============================='
  puts '         API Loading...        '
  puts '==============================='
  puts ''

  #gets weather data
  uri = URI('http://api.openweathermap.org/data/2.5/forecast?q=' + name + '&units=metric&lang=en&cnt=9' + @api_param)
  json = Net::HTTP.get(uri)
  data = JSON.parse(json)

  #Output
  if data['cod'] == '200'
    name = data['city']['name']
    data['list'].each do |day|
        puts '== ' + Time.at(day['dt']).strftime('%F %R %:z') + ' =='

        puts 'The weather in ' + name + ' is ' + day['weather'][0]['description']

        puts 'The mainly temperature in ' + name + ' is ' + day['main']['temp'].to_s + '℃'

        puts 'The minimal and maximal temperatures in ' + name + ' are ' + day['main']['temp_min'].to_s + '℃  ~ ' + day['main']['temp_max'].to_s + '℃'

        puts 'The percent of clouds in ' + name + ' is ' + day['clouds']['all'].to_s + '%'

        puts 'The wind speed in ' + name + ' is ' + day['wind']['speed'].to_s + ' metric/second at ' + day['wind']['deg'].to_s + ' degree'

        puts 'The percent of humidity in ' + name + ' is ' + day['main']['humidity'].to_s + '%'

        puts 'The amount of pressure in ' + name + ' is ' + day['main']['pressure'].to_s + 'hPa'

        puts ''
    end
  else
    puts data['cod'].to_s + ' - ' + data['message']
  end

  puts ''
  puts 'Information from OpenWeatherMap : http://openweathermap.org/'
  puts ''
end


def forecast3Hours5Days()
  #Get city's name:
  print 'Name in English of the city: '
  name = gets.chomp

  puts ''
  puts '==============================='
  puts '         API Loading...        '
  puts '==============================='
  puts ''

  #gets weather data
  uri = URI('http://api.openweathermap.org/data/2.5/forecast?q=' + name + '&units=metric&lang=en' + @api_param)
  json = Net::HTTP.get(uri)
  data = JSON.parse(json)

  #Output
  if data['cod'] == '200'
    name = data['city']['name']
    data['list'].each do |day|
        puts '== ' + Time.at(day['dt']).strftime('%F %R %:z') + ' =='

        puts 'The weather in ' + name + ' is ' + day['weather'][0]['description']

        puts 'The mainly temperature in ' + name + ' is ' + day['main']['temp'].to_s + '℃'

        puts 'The minimal and maximal temperatures in ' + name + ' are ' + day['main']['temp_min'].to_s + '℃  ~ ' + day['main']['temp_max'].to_s + '℃'

        puts 'The percent of clouds in ' + name + ' is ' + day['clouds']['all'].to_s + '%'

        puts 'The wind speed in ' + name + ' is ' + day['wind']['speed'].to_s + ' metric/second at ' + day['wind']['deg'].to_s + ' degree'

        puts 'The percent of humidity in ' + name + ' is ' + day['main']['humidity'].to_s + '%'

        puts 'The amount of pressure in ' + name + ' is ' + day['main']['pressure'].to_s + 'hPa'

        puts ''
    end
  else
    puts data['cod'].to_s + ' - ' + data['message']
  end

  puts ''
  puts 'Information from OpenWeatherMap : http://openweathermap.org/'
  puts ''
end


def weatherNow()
  #Get city's name:
  print 'Name in English of the city: '
  name = gets.chomp

  puts ''
  puts '==============================='
  puts '         API Loading...        '
  puts '==============================='
  puts ''


  # Fetch weather data
  uri = URI('http://api.openweathermap.org/data/2.5/weather?q=' + name + '&units=metric&lang=en' + @api_param)
  json = Net::HTTP.get(uri)
  weather = JSON.parse(json)

  if weather['cod'] == 200
    #Output
    name = weather['name']
    puts 'It is ' + (Time.at(weather['dt']) + 2 * 60 * 60).strftime('%F %R %:z') + ' in ' + name

    puts 'The weather in ' + name + ' is ' + weather['weather'][0]['description']

    puts 'The temperature in ' + name + ' is ' + weather['main']['temp'].to_s + '℃'

    puts 'The minimal and maximal temperatures in ' + name + ' are ' + weather['main']['temp_min'].to_s + '℃  ~ ' + weather['main']['temp_max'].to_s + '℃'

    puts 'The next sunrise in ' + name + ' is at ' + (Time.at(weather['sys']['sunrise']) + 2 * 60 * 60).strftime('%F %R %:z') + ','
    puts ''
    puts 'The next sunset is at ' + (Time.at(weather['sys']['sunset']) + 2 * 60 * 60).strftime('%F %R %:z')

    puts 'The percent of clouds in ' + name + ' is ' + weather['clouds']['all'].to_s + '%'

    puts 'The wind speed in ' + name + ' is ' + weather['wind']['speed'].to_s + 'metric/second'

    puts 'The percent of humidity in ' + name + ' is ' + weather['main']['humidity'].to_s + '%'

    puts 'The amount of pressure in ' + name + ' is ' + weather['main']['pressure'].to_s + 'hPa'

    puts ''
    puts 'Information from OpenWeatherMap : http://openweathermap.org/'
    puts ''
  else
    puts weather['cod'].to_s + ' - ' + weather['message']
  end
end
