class WinningRate < ActiveRecord::Base

# race_all_info = RaceData.all

@uma_num = 0
@racePlace_num = 0
@length_num = 0
@course_num = 0
@baba_condition_num = 0

# racePlace_uniq = race_all_info.uniq.pluck(:racePlace).compact.reject(&:empty?)
# length_to_sort = race_all_info.uniq.pluck(:length).compact.select{|n| n % 100 == 0}
# length_uniq = length_to_sort.sort
# course_uniq = race_all_info.uniq.pluck(:course).compact.reject(&:empty?)
# baba_condition_uniq = race_all_info.uniq.pluck(:baba_condition).compact.reject(&:empty?)

# race_in_a_condition = race_all_info.where(racePlace: racePlace_uniq[@racePlace_num], length: length_uniq[@length_num], course: course_uniq[@course_num], baba_condition: baba_condition_uniq[@baba_condition_num])

def self.keisan
  @counter1 = 0
  @counter2 = 0
  @counter3 = 0
  @counter4 = 0
  @counter5 = 0

  method1
  method2
  method3
  method4
  method5
end

# def self.method1
#   while @uma_num < 19 do
#   winning_rate = Winning_rate.new

#   num_of_umaban = race_in_a_condition.group(:umaban).count
#   order1       = race_in_a_condition.where(order: 1, umaban: umaban).count
#   order1or2    = race_in_a_condition.where(order: 1 or 2, umaban: umaban).count
#   order1or2or3 = race_in_a_condition.where(order: 1 or 2 or 3, umaban: umaban).count
#   winning_rate.name = "#{racePlace_uniq[racePalce_num]}"+"#{length_uniq[@length_num]}"+"#{course_uniq[@course_num]}"+"#{baba_condition_uniq[@baba_condition_num]}"+"#{umaban}番"

#   winning_rate.win_ratio = @order1/@umaban[1].to_f
#   winning_rate.top2_ratio = @order1or2/@umaban[1].to_f
#   winning_rate.top3_ratio = @order1or2or3/@umaban[1].to_f

#   @uma_num += 1
#   end
# end

# def self.method2
#   @uma_num = 0
#   @racePlace_num = 0
#   while @racePlace_num < 10 do
#     method1
#     @racePlace_num += 1
#   end
# end

#   def self.method3
#       @uma_num = 0
#       @racePlace_num = 0
#       @length_num = 0
#     while @length_num < 10 do
#       method2
#       @length_num += 1
#     end
#   end

#   def self.method4
#       @uma_num = 0
#       @racePlace_num = 0
#       @length_num = 0
#       @course_num = 0
#     while @course_num < 10 do
#       method3
#       @course_num += 1
#     end
#   end

#   def self.method5
#       @uma_num = 0
#       @racePlace_num = 0
#       @length_num = 0
#       @course_num = 0
#       @baba_condition_num = 0
#     while @baba_condition_num < 10 do
#       method4
#       @baba_condition_num += 1
#     end
#   end




#           while baba_conditon < 5 do

#             umaban += 1
#             if umaban < 19
#               break

#           if race_in_a_condition.length != 0
#             winning_rate.save

#               if @racePlace_num



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



def self.method1
  @uma_num = 0

  while @uma_num < 10 do
    puts "#{@baba_condition_num}"+"#{@course_num}"+"#{@length_num}"+"#{@racePlace_num}"+"#{@uma_num}"
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

  while @length_num < 10 do
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

  while @course_num < 10 do
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

  while @baba_condition_num < 10 do
    method4
    @baba_condition_num += 1
  end
  @counter5 += 1
end

end

# def method5
#   while @baba_condition_num
# end

























