class AnalysisController < ApplicationController

  def show
    # racePlace = params[:racePlace]
    # length = params[:length].to_i
    # course = params[:course]
    # baba_condition = params[:baba_condition]


    if params[:racePlace] != ""
      @race_same_condition = RaceData.where(racePlace: params[:racePlace])
    end

    if params[:length] != ""
      @race_same_condition = @race_same_condition.where(length: params[:length])
    end

    if params[:course] != ""
      @race_same_condition = @race_same_condition.where(course: params[:course])
    end

    if params[:baba_condition] != ""
      @race_same_condition = @race_same_condition.where(baba_condition: params[:baba_condition])
    end

     @umaban = @race_same_condition.group(:umaban).count

     @order1 = @race_same_condition.where(order: 1, umaban:1).count

     @syouritsu = @order1/@umaban[1].to_f



    #  while number.to_i <= 18 do
    #  number = 1
    #  '@umaban_num'+'#{number}' = umaban.reject {|item| item != number}
    #  umaban_num_

    #  win_num << umaban_betsu.where(order: 1).length
    #  number = @number.to_i + 1
    # # end
    binding.pry


    # RaceData.find_by_sql(
    #   ["select * from race_data where racePlace = '#{racePlace}' AND length = '#{length}' AND course = '#{course}' AND baba_condition = '#{baba_condition}';"])
  end
end