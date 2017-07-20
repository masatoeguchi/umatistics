class TopController < ApplicationController

  @uma1
  @uma2
  @uma3
  @uma4
  @uma5
  @uma6
  @uma7
  @uma8
  @uma9
  @uma10
  @uma11
  @uma12
  @uma13
  @uma14
  @uma15
  @uma16
  @uma17
  @uma18

  @uma_name1 = []
  @uma_name2 = []
  @uma_name3 = []
  @uma_name4 = []
  @uma_name5 = []
  @uma_name6 = []
  @uma_name7 = []
  @uma_name8 = []
  @uma_name9 = []
  @uma_name10 = []
  @uma_name11 = []
  @uma_name12 = []
  @uma_name13 = []
  @uma_name14 = []
  @uma_name15 = []
  @uma_name16 = []
  @uma_name17 = []
  @uma_name18 = []



  def index
  end

  def search
    keyword = "#{params[:keyword]}"
    @uma = RaceData.find_by_sql(["select * from race_data where name = '#{keyword}';"])
    @uma_name = @uma[0][:name]
    redirect_to acton: :index
    # binding.pry
  end
end
