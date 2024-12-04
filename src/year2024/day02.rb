module Year2024
  class Day02
    PART1_ANSWER = 282
    PART2_ANSWER = 349

    def part1(input)
      safe_reports = 0

      input.each_line do |line|
        report_ints = line.split.map(&:to_i)
        safe_reports += 1 if safe_report?(report_ints, should_retry: false)
      end

      safe_reports
    end

    def part2(input)
      safe_reports = 0

      input.each_line do |line|
        report_ints = line.split.map(&:to_i)
        safe_reports += 1 if safe_report?(report_ints, should_retry: true)
      end

      safe_reports
    end

    private

    def safe_report?(report_ints, should_retry:)
      safe = true
      report_direction = nil

      report_ints.each_with_index do |num, i|
        next if i == report_ints.length - 1
        abs_diff = report_ints[i+1] - num

        if report_direction.nil?
          report_direction = abs_diff.positive? ? "pos" : "neg"
        end
        this_direction = abs_diff.positive? ? "pos" : "neg"

        unless report_direction == this_direction
          safe = false
        end

        unless [-3, -2, -1, 1, 2, 3].include?(abs_diff)
          safe = false
        end
      end

      if report_ints.uniq.length != report_ints.length
        safe = false
      end

      if should_retry && !safe
        report_ints.each_with_index do |num, i|
          new_report_ints = report_ints.dup
          new_report_ints.delete_at(i)
          if safe_report?(new_report_ints, should_retry: false)
            safe = true
            break
          end
        end
      end

      safe
    end
  end
end
