module Year2023
  class Day05
    PART1_ANSWER = 31599214 # 35 test
    PART2_ANSWER = "" # 46 test

    ALL_MAPS = {
      "seed-to-soil" => [],
      "soil-to-fertilizer" => [],
      "fertilizer-to-water" => [],
      "water-to-light" => [],
      "light-to-temperature" => [],
      "temperature-to-humidity" => [],
      "humidity-to-location" => [],
    }

    def part1(input)
      seeds = ingest_maps(input)

      lowest_location_for_seeds(seeds)
    end

    # this works but just never finishes with the full dataset
    def part2(input)
      seed_batches = ingest_maps(input).each_slice(2).map do |start, range|
        (start..(start + (range - 1))).to_a
      end

      p "got seed batches"

      lowest_location = nil

      seed_batches.each do |seeds|
        location = lowest_location_for_seeds(seeds)
        if lowest_location.nil? || location <= lowest_location
          p "new lowest #{location}"
          lowest_location = location
        end
      end

      p lowest_location

      lowest_location
    end

    private

    def ingest_maps(input)
      seeds = []
      current_map = nil
      input.each_line do |line|
        line.chomp!
        next if line[0].nil?

        if line.start_with?("seeds: ")
          seeds = line.split(": ").drop(1).first.split(" ").map(&:to_i)
        elsif line[0] =~ /\A[-+]?[0-9]+\z/
          ALL_MAPS[current_map] << line.split(" ").map(&:to_i)
        else
          current_map = line.split(" ").first
        end
      end

      seeds
    end

    def lowest_location_for_seeds(seeds)
      seed_location_numbers = {}

      seed_soil_numbers = {}
      soil_fertilizer_numbers = {}
      fertilizer_water_numbers = {}
      water_light_numbers = {}
      light_temperature_numbers = {}
      temperature_humidity_numbers = {}
      humidity_location_numbers = {}

      seeds.each do |seed|
        next if seed_location_numbers[seed]
      
        soil = convert_with_cache(seed_soil_numbers, via: "seed-to-soil", id: seed)
        fertilizer = convert_with_cache(soil_fertilizer_numbers, via: "soil-to-fertilizer", id: soil)
        water = convert_with_cache(fertilizer_water_numbers, via: "fertilizer-to-water", id: fertilizer)
        light = convert_with_cache(water_light_numbers, via: "water-to-light", id: water)
        temperature = convert_with_cache(light_temperature_numbers, via: "light-to-temperature", id: light)
        humidity = convert_with_cache(temperature_humidity_numbers, via: "temperature-to-humidity", id: temperature)
        location = convert_with_cache(humidity_location_numbers, via: "humidity-to-location", id: humidity)
      
        seed_location_numbers[seed] = location
      end
      
      seed_location_numbers.values.min
    end

    def convert_with_cache(cache, via:, id:)
      if cache[id]
        result = cache[id]
      else
        result = convert(via: via, id: id)
        cache[id] = result
      end
    
      result
    end    

    def convert(via:, id:)
      maps = ALL_MAPS[via]
      source = id
      destination = source

      maps.each do |map|
        destination_range_start = map[0]
        source_range_start = map[1]
        range_length = map[2] - 1

        source_range_end = source_range_start + range_length

        difference = source - source_range_start

        if source >= source_range_start && source <= source_range_end
          destination = destination_range_start + difference
          break
        end
      end

      destination
    end
  end
end
