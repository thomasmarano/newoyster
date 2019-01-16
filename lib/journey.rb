class Journey
    attr_accessor :entry_station, :list_of_journies
    def initialize
        @entry_station
        @list_of_journies = []
    end

    def travelling?
        @entry_station ? true : false
    end

      def save_journey(station1, station2)
          @list_of_journies << {entry: station1, exit: station2}
      end
end
