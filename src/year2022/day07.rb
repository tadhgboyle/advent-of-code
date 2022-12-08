require 'pathname'

module Year2022
  class Day07
    PART1_ANSWER = 1845346
    PART2_ANSWER = 3636703

    def part1(input)
      dirs, sizes = generate_dirs_and_sizes(input: input)

      dirs.map do |d|
        size_for_dir(sizes: sizes, dir_path: d)
      end.filter { |size| size <= 100000 }.sum
    end

    def part2(input)
      dirs, sizes = generate_dirs_and_sizes(input: input)

      occupied = sizes.values.sum
      space_needed = 70000000 - 30000000
      dirs.map do |d|
        size_for_dir(sizes: sizes, dir_path: d)
      end.filter { |size| occupied - size <= space_needed }.min
    end

    private

    def generate_dirs_and_sizes(input:)
      dir = Pathname.new("/")
      dirs = [dir]
      sizes = {}
      input.each_line do |line|
        line = line.chomp
        if line.start_with?("$ cd")
          new_dir = line.split("$ cd ")[1]
          dir = new_dir == "/" ? Pathname.new("/") : dir + new_dir
        elsif line.start_with?("$ ls")

        elsif line.start_with?("dir")
          dirs.append(dir + line.split("dir ")[1])
        else
          amount, file_name = line.split(" ")
          sizes[dir + file_name] = amount.to_i
        end
      end

      [dirs, sizes]
    end

    def size_for_dir(sizes:, dir_path:)
      sizes.filter do |size_path, _|
        size_path.to_s.start_with?(dir_path.to_s)
      end.values.sum
    end
  end
end