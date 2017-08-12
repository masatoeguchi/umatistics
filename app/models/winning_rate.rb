class WinningRate < ActiveRecord::Base

  def self.keisan

    race_all_info = RaceData.all

    racePlace_uniq = race_all_info.uniq.pluck(:racePlace).compact.reject(&:empty?)
    length_to_sort = race_all_info.uniq.pluck(:length).compact.select{|n| n % 100 == 0}
    length_uniq = length_to_sort.sort
    course_uniq = race_all_info.uniq.pluck(:course).compact.reject(&:empty?)
    baba_condition_uniq = race_all_info.uniq.pluck(:baba_condition).compact.reject(&:empty?)

    racePlace_num = 0
    length_num = 0
    course_num = 0
    baba_condition_num = 0


    race_in_a_condition = race_all_info.where(racePlace: racePlace_uniq[racePlace_num], length: length_uniq[length_num], course: course_uniq[course_num], baba_condition: baba_condition_uniq[baba_condition_num])

    if race_in_a_condition.length != 0



     num_of_umaban = race_in_a_condition.group(:umaban).count
binding.pry


     order1 = @race_same_condition.where(order: 1, umaban: umaban[num_of_umaban]).count

     @syouritsu = @order1/@umaban[1].to_f


    end


    winning_rate = WinningRate.new

    while baba_conditon < 5 do
    winning_rate.name = "#{racePlace_uniq[racePalce_num]}"+"#{length_uniq[length_num]}"
    winning_rate.win_ration = 
    winngin_rate.save
    end
    binding.pry

    a = a
  end
end
