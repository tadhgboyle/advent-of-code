module Year2023
  class Day05
    PART1_ANSWER = 31599214 # 35 test
    PART2_ANSWER = ""

    def part1(input)
      seeds = []

      all_maps = {
        "seed-to-soil" => [],
        "soil-to-fertilizer" => [],
        "fertilizer-to-water" => [],
        "water-to-light" => [],
        "light-to-temperature" => [],
        "temperature-to-humidity" => [],
        "humidity-to-location" => [],
      }

      current_map = nil
      input.each_line do |line|
        line.chomp!
        next if line[0].nil?

        if line.start_with?("seeds: ")
          seeds = line.split(": ").drop(1).first.split(" ").map(&:to_i)
        elsif line[0] =~ /\A[-+]?[0-9]+\z/
          all_maps[current_map] << line.split(" ").map(&:to_i)
        elsif line[0].is_a?(String)
          current_map = line.split(" ").first
        end
      end

      seed_location_numbers = {}
      seeds.each do |seed|
        p "--- seed #{seed} ---"
        soil = convert(via: "seed-to-soil", id: seed, all_maps: all_maps)
        fertilizer = convert(via: "soil-to-fertilizer", id: soil, all_maps: all_maps)
        water = convert(via: "fertilizer-to-water", id: fertilizer, all_maps: all_maps)
        light = convert(via: "water-to-light", id: water, all_maps: all_maps)
        temperature = convert(via: "light-to-temperature", id: light, all_maps: all_maps)
        humidity = convert(via: "temperature-to-humidity", id: temperature, all_maps: all_maps)
        location = convert(via: "humidity-to-location", id: humidity, all_maps: all_maps)
        
        seed_location_numbers[seed] = location
      end

      p seed_location_numbers
      
      seed_location_numbers.values.min
    end

    def part2(input)
      nil
    end

    private

    def convert(via:, id:, all_maps:)
      p "--- #{via} ---"
      maps = all_maps[via]
      source = id
      destination = nil

      maps.each do |map|
        destination_range_start = map[0]
        source_range_start = map[1]
        range_length = map[2] - 1

        source_range_end = source_range_start + range_length

        if source < source_range_start
          p "source less than source range start"
          next
        end

        difference = source - source_range_start
        p "diff #{difference}, source #{source}, sr start #{source_range_start}, sr end #{source_range_end}, range #{range_length}"

        if source >= source_range_start && source <= source_range_end
          p "source range covers #{source + difference}"
          destination = destination_range_start + difference
          break
        else
          p "source range does not cover #{source + difference}"
        end

        p "trying next map"
      end

      if destination.nil?
        p "using source as destination"
        destination = source
      end

      p "found destination #{destination} for #{source}"

      destination
    end
  end
end
