module Biz
  module Periods
    class After < Abstract

      def timeline
        super.forward
      end

      private

      def weeks
        Range.new(
          Week.since_epoch(schedule.in_zone.local(origin)),
          Week.since_epoch(Time.heat_death)
        )
      end

      def relevant?(period)
        origin < period.end_time
      end

      def boundary
        TimeSegment.after(origin)
      end

    end
  end
end
