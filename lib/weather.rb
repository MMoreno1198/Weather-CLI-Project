class Cli

    def run

      puts "                   _|      _|              _|                                   ".colorize(:yellow)
      puts "                   _|_|  _|_|    _|_|    _|_|_|_|    _|_|_|                     ".colorize(:yellow)
      puts "                   _|  _|  _|  _|_|_|_|    _|      _|    _|                     ".colorize(:yellow)
      puts "                   _|      _|  _|          _|      _|    _|                     ".colorize(:yellow)
      puts "                   _|      _|    _|_|_|      _|_|    _|_|_|                     ".colorize(:yellow)
      puts "                                                                                ".colorize(:yellow)
      puts "                                                                                ".colorize(:yellow)
      puts "   _|          _|                        _|      _|                             ".colorize(:yellow)
      puts "   _|          _|    _|_|      _|_|_|  _|_|_|_|  _|_|_|      _|_|    _|  _|_|   ".colorize(:yellow)
      puts "   _|    _|    _|  _|_|_|_|  _|    _|    _|      _|    _|  _|_|_|_|  _|_|       ".colorize(:yellow)
      puts "     _|  _|  _|    _|        _|    _|    _|      _|    _|  _|        _|         ".colorize(:yellow)
      puts "       _|  _|        _|_|_|    _|_|_|      _|_|  _|    _|    _|_|_|  _|         ".colorize(:yellow)
      puts "                                                                                ".colorize(:yellow)

        puts "Enter the Name of a City"

        puts "+-+-+-+-+-+ +-+-+-+ +-+-+-+-+ +-+-+ +-+ +-+-+-+-+".colorize(:green)
        puts "      |Enter| |the| |Name| |of| |a| |City|       ".colorize(:green)
        puts "+-+-+-+-+-+ +-+-+-+ +-+-+-+-+ +-+-+ +-+ +-+-+-+-+".colorize(:green)

        puts " "

        @input = gets.strip.downcase.split.first

        get_weather(@input)

    end

    def get_weather(input)

        Api.find_location(input)

            puts " "
            puts "It is currently #{Feature.all[0].weather} in #{Feature.all[0].title}."
            puts " "
            puts "To see #{Feature.all[0].title}'s current Temperature and Humidity type 'yes'. Or 'source' for the source of this information."

        @input = gets.strip.downcase.split.first

            puts " "

        if @input == "source"

            puts "This information comes from #{Feature.all[0].source}."
            puts " "

            new_exit

        elsif @input == "yes"

            puts "It is Currently #{Feature.all[0].temp}°F with a Humidity of #{Feature.all[0].humidity}% in #{Feature.all[0].title}."
            puts " "

            new_exit

        elsif @input == "exit"

            puts "Goodbye!"
            puts " "

        else

            new_exit

        end
    end

    def new_exit

        puts "Enter another City or 'exit' to Exit."

        @input = gets.strip.downcase.split.first

        puts " "

        if @input == "source"

            puts "This information comes from #{Feature.all[0].source}."
            puts " "

            new_exit

        elsif @input != "exit"

            get_weather(@input)

        else

            puts "Goodbye!"
            puts " "

        end
    end

end
