require 'journey'

describe Journey do
    before (:each) do
        @station = double("a station")
        @station2 = double("a station 2")
    end

    describe "#start_journey" do
        it "registers entry station" do
            expect{subject.start_journey(@station)}.to change{subject.entry_station}.from(nil).to(@station)
        end
    end

    describe "#end_journey" do
        it "clears entry_station variable to nil" do
            subject.start_journey(@station)
            expect{subject.end_journey(@station2)}.to change{subject.entry_station}.from(@station).to(nil)
        end

        it "saves entire journey to list of journies" do
              subject.start_journey(@station)
              subject.end_journey(@station2)
              expect(subject.list_of_journies[-1]). to eq({entry: @station, exit: @station2})
        end

    end


end
