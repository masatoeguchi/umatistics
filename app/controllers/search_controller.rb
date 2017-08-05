class SearchController < ApplicationController

  def show

    @uma_name1 = ""
    @uma_name2 = ""
    @uma_name3 = ""
    @uma_name4 = ""
    @uma_name5 = ""
    @uma_name6 = ""
    @uma_name7 = ""
    @uma_name8 = ""
    @uma_name9 = ""
    @uma_name10 = ""
    @uma_name11 = ""
    @uma_name12 = ""
    @uma_name13 = ""
    @uma_name14 = ""
    @uma_name15 = ""
    @uma_name16 = ""
    @uma_name17 = ""
    @uma_name18 = ""


    keyword = "#{params[:keyword1]}"
    @uma1 = RaceData.find_by_sql(["select * from race_data where name = '#{keyword}';"])
    @uma_name1 = @uma1[0][:name]

    keyword = "#{params[:keyword2]}"
    @uma2 = RaceData.find_by_sql(["select * from race_data where name = '#{keyword}';"])
    @uma_name2 = @uma2[0][:name]

    keyword = "#{params[:keyword3]}"
    @uma3 = RaceData.find_by_sql(["select * from race_data where name = '#{keyword}';"])
    @uma_name3 = @uma3[0][:name]

    keyword = "#{params[:keyword4]}"
    @uma4 = RaceData.find_by_sql(["select * from race_data where name = '#{keyword}';"])
    @uma_name4 = @uma4[0][:name]

    keyword = "#{params[:keyword5]}"
    @uma5 = RaceData.find_by_sql(["select * from race_data where name = '#{keyword}';"])
    @uma_name5 = @uma5[0][:name]

    keyword = "#{params[:keyword6]}"
    @uma6 = RaceData.find_by_sql(["select * from race_data where name = '#{keyword}';"])
    @uma_name6 = @uma6[0][:name]

    keyword = "#{params[:keyword7]}"
    @uma7 = RaceData.find_by_sql(["select * from race_data where name = '#{keyword}';"])
    @uma_name7 = @uma7[0][:name]

    keyword = "#{params[:keyword8]}"
    @uma8 = RaceData.find_by_sql(["select * from race_data where name = '#{keyword}';"])
    @uma_name8= @uma8[0][:name]

    keyword = "#{params[:keyword9]}"
    @uma9 = RaceData.find_by_sql(["select * from race_data where name = '#{keyword}';"])
    @uma_name9 = @uma9[0][:name]

    keyword = "#{params[:keyword10]}"
    @uma10 = RaceData.find_by_sql(["select * from race_data where name = '#{keyword}';"])
    @uma_name10 = @uma10[0][:name]

    keyword = "#{params[:keyword11]}"
    @uma11 = RaceData.find_by_sql(["select * from race_data where name = '#{keyword}';"])
    @uma_name11 = @uma11[0][:name]

    keyword = "#{params[:keyword12]}"
    @uma12 = RaceData.find_by_sql(["select * from race_data where name = '#{keyword}';"])
    @uma_name12 = @uma12[0][:name]

    keyword = "#{params[:keyword13]}"
    @uma13 = RaceData.find_by_sql(["select * from race_data where name = '#{keyword}';"])
    @uma_name13 = @uma13[0][:name]

    keyword = "#{params[:keyword14]}"
    @uma14 = RaceData.find_by_sql(["select * from race_data where name = '#{keyword}';"])
    @uma_name14 = @uma14[0][:name]

    keyword = "#{params[:keyword15]}"
    @uma15 = RaceData.find_by_sql(["select * from race_data where name = '#{keyword}';"])
    @uma_name15 = @uma15[0][:name]

    keyword = "#{params[:keyword16]}"
    @uma16 = RaceData.find_by_sql(["select * from race_data where name = '#{keyword}';"])
    @uma_name16 = @uma16[0][:name]

    keyword = "#{params[:keyword17]}"
    @uma17 = RaceData.find_by_sql(["select * from race_data where name = '#{keyword}';"])
    @uma_name17 = @uma17[0][:name]

    keyword = "#{params[:keyword18]}"
    @uma18 = RaceData.find_by_sql(["select * from race_data where name = '#{keyword}';"])
    @uma_name18 = @uma18[0][:name]

    binding.pry

     # @uma_same_condition << @uma1.select{ |uma| uma[:length] == params[:length]}

    @uma1.each do |uma|
      if uma[:length] == params[:length].to_i &&
         uma[:racePlace] == params[:racePlace] &&
         uma[:condition] == params[:condition]

      then  @uma_same_condition << uma

      end
    end
  end
end
