class WinningRate < ActiveRecord::Base

  def self.keisan
    racePlace_uniq = RaceData.uniq.pluck(:racePlace).compact.reject(&:empty?)
    length_to_sort = RaceData.uniq.pluck(:length).compact.select{|n| n % 100 == 0}
    length_uniq = length_to_sort.sort
    course_uniq = RaceData.uniq.pluck(:course).compact.reject(&:empty?)
    baba_condition_uniq = RaceData.uniq.pluck(:baba_condition).compact.reject(&:empty?)

    binding.pry
  end
end
