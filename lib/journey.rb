class Journey
    attr_accessor :entry_station, :list_of_journies
    def initialize
        @entry_station
        @list_of_journies = []
    end

    def start_journey(station)
        @entry_station = station

    end

    def travelling?
        @entry_station ? true : false
    end

    def end_journey(station)
        save_journey(@entry_station, station)
        @entry_station = nil
    end

    def save_journey(station1, station2)
        @list_of_journies << {entry: station1, exit: station2}
    end

end
