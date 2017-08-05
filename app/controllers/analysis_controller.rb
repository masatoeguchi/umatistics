class AnalysisController < ApplicationController

  def show
    racePlace = params[:racePlace]
    length = params[:length].to_i
    course = params[:course]
    baba = params[:condition]

    @race_same_condition = RaceData.find_by_sql(["select * from race_data where racePlace = '#{racePlace}' AND length = '#{length}' AND course = '#{course}' AND condition = '#{baba}';"])
    binding.pry
  end
end