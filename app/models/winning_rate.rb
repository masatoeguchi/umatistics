class WinningRate < ActiveRecord::Base

def self.basic_info

  @race_all_info = RaceData.all

# array_name = @race_all_info.limit(10).

  @uma_num = 0

  @racePlace_num = 0
  @length_num = 0
  @course_num = 0
  @baba_condition_num = 0

  @counter1 = 0
  @counter2 = 0
  @counter3 = 0
  @counter4 = 0
  @counter5 = 0


  @umaban_uniq = @race_all_info.uniq.pluck(:umaban).compact.sort
  @racePlace_uniq = @race_all_info.uniq.pluck(:racePlace).compact.reject(&:empty?)
  length_to_sort = @race_all_info.uniq.pluck(:length).compact.select{|n| n % 100 == 0}
  @length_uniq = length_to_sort.sort
  @course_uniq = @race_all_info.uniq.pluck(:course).compact.reject(&:empty?)
  @baba_condition_uniq = @race_all_info.uniq.pluck(:baba_condition).compact.reject(&:empty?)

binding.pry
  keisan
end

def self.keisan
  method1
  # binding.pry
  method2
  # binding.pry
  method3
  # binding.pry
  method4
  # binding.pry
  method5
end





def self.method1

  while @uma_num < 19 do

  @race_in_a_condition = @race_all_info.where(umaban: @umaban_uniq[@uma_num], racePlace: @racePlace_uniq[@racePlace_num], length: @length_uniq[@length_num], course: @course_uniq[@course_num], baba_condition: @baba_condition_uniq[@baba_condition_num])

    unless @race_in_a_condition.count == 0
      info_save
    end

    @uma_num += 1
  end
  @counter1 += 1
end

def self.method2

  @uma_num = 0

  if @counter2 == 0
    @racePlace_num = 1
  else
    @racePlace_num = 0
  end

  while @racePlace_num < 10 do
    method1
    @racePlace_num += 1
  end
  @counter2 += 1
end

def self.method3

  @uma_num = 0
  @racePlace_num = 0

  if @counter3 == 0
    @length_num = 1
  else
    @length_num = 0
  end

  while @length_num < 20 do
    method2
    @length_num += 1
  end
  @counter3 += 1
end

def self.method4

  @uma_num = 0
  @racePlace_num = 0
  @length_num = 0

  if @counter4 == 0
    @course_num = 1
  else
    @course_num = 0
  end

  while @course_num < 2 do
    method3
    @course_num += 1
  end
  @counter4 += 1
end

def self.method5

  @uma_num = 0
  @racePlace_num = 0
  @length_num = 0
  @course_num = 0

  if @counter5 == 0
    @baba_condition_num = 1
  else
    @baba_condition_num = 0
  end

  while @baba_condition_num < 4 do
    method4
    @baba_condition_num += 1
  end
  @counter5 += 1
end

def self.info_save
  winning_rate = WinningRate.new

  @umaban        = @race_in_a_condition.pluck(:umaban)
  @num_of_umaban = @race_in_a_condition.group(:umaban).count
  @order1        = @race_in_a_condition.where(order:1, umaban: @umaban_uniq[@uma_num]).count
  @order1or2     = @race_in_a_condition.where(order:1||2, umaban: @umaban_uniq[@uma_num]).count
  @order1or2or3  = @race_in_a_condition.where(order:1||2||3, umaban: @umaban_uniq[@uma_num]).count
  winning_rate.name = "#{@racePlace_uniq[@racePlace_num]}"+"#{@length_uniq[@length_num]}"+"#{@course_uniq[@course_num]}"+"#{@baba_condition_uniq[@baba_condition_num]}"+"#{@umaban_uniq[@uma_num]}番"
  @win_ratio = @order1/@num_of_umaban[1].to_f
  @top2_ratio = @order1or2/@umaban[1].to_f
  @top3_ratio = @order1or2or3/@umaban[1].to_f

  winning_rate.win_ratio = @win_ratio
  winning_rate.top2_ratio = @top2_ratio
  winning_rate.top3_ratio = @top3_ratio

  winning_rate.save
end




#           else
#             break
#           end
#       end

#          if race_in_a_condition.length != 0
#   binding.pry



#        @syouritsu = @order1/@umaban[1].to_f


#       end


#       winning_rate = WinningRate.new

#       binding.pry

#       a = a
#     end
#   end












# def self.method1
#   @uma_num = 0

#   while @uma_num < 10 do
#     puts "#{@baba_condition_num}"+"#{@course_num}"+"#{@length_num}"+"#{@racePlace_num}"+"#{@uma_num}"
#     @uma_num += 1
#   end
#   @counter1 += 1
# end

# def self.method2

#   @uma_num = 0

#   if @counter2 == 0
#     @racePlace_num = 1
#   else
#     @racePlace_num = 0
#   end

#   while @racePlace_num < 10 do
#     method1
#     @racePlace_num += 1
#   end
#   @counter2 += 1
# end

# def self.method3

#   @uma_num = 0
#   @racePlace_num = 0

#   if @counter3 == 0
#     @length_num = 1
#   else
#     @length_num = 0
#   end

#   while @length_num < 10 do
#     method2
#     @length_num += 1
#   end
#   @counter3 += 1
# end

# def self.method4

#   @uma_num = 0
#   @racePlace_num = 0
#   @length_num = 0

#   if @counter4 == 0
#     @course_num = 1
#   else
#     @course_num = 0
#   end

#   while @course_num < 10 do
#     method3
#     @course_num += 1
#   end
#   @counter4 += 1
# end

# def self.method5

#   @uma_num = 0
#   @racePlace_num = 0
#   @length_num = 0
#   @course_num = 0

#   if @counter5 == 0
#     @baba_condition_num = 1
#   else
#     @baba_condition_num = 0
#   end

#   while @baba_condition_num < 10 do
#     method4
#     @baba_condition_num += 1
#   end
#   @counter5 += 1
# end

end
























