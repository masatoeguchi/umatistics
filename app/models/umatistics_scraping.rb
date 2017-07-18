class UmatisticsScraping
  def self.product_urls
    agent = Mechanize.new
    links = []
    next_url = "l20010225"
    # スタート時のリンク
    # 自動取得したい

      # !To improve!
    # 新馬戦に限りw_diffをNULLに
    # レース番号を取得
    # 第何週か、芝の荒れ具合
    # 障害物競争、除外、芝で入力

    while true
      url = "http://klan.jp/" + next_url
      current_page = agent.get(url)
      elements = current_page.search('dt a')
      elements.each do |ele|
        links << ele.get_attribute('href')
        # １ページ目のリンク格納
      end

      if current_page.at('.prev a')
        next_link = current_page.at('.prev a')
        next_url = next_link.get_attribute('href')
      else
        break
      end
      # 次のページへのリンクが存在すれば取得
    end

    links.each do |link|
      get_product('http://klan.jp/' + link)
      # このeachが取ってきたリンクの数だけ繰り返される
    end

  end

  def self.get_product(link)
    agent = Mechanize.new
    page = agent.get(link)
    title = page.search('title').inner_text
    date = make_date(title)
    racePlace = page.at('.r-navi div').inner_text
    courseLength = page.search('.summary li:nth-of-type(2)').inner_text
    originalCondition = page.search('.summary li:nth-of-type(5)').inner_text
    condition = make_condition(originalCondition)
    # ページ全体から一度のみ取得する情報を抜き出す

    page = page.at('tbody')

    order = page.search('.order').map{ |n| n.inner_text } if page.search('.order')
    names = page.search('.name a').map{ |n| n.inner_text } if page.search('.name a')
    wakuban = page.search('.wakuban').map{ |n| n.inner_text } if page.search('.wakuban')
    umaban = page.search('.umaban').map{ |n| n.inner_text }if page.search('.umaban')
    odds = page.search('.odds').map{ |n| n.inner_text }if page.search('.odds')
    popular = page.search('.popular').map{ |n| n.inner_text } if page.search('.popular')
    sexage = page.search('.sexage').map{ |n| n.inner_text } if page.search('.sexage')
    burden = page.search('.burden').map{ |n| n.inner_text } if page.search('.burden')
    jockey = page.search('.jockey a').map{ |n| n.inner_text } if page.search('.jockey a')
    originalTime = page.search('.time').map{ |n| n.inner_text } if page.search('.time')
    trainer = page.search('.trainer a').map{ |n| n.inner_text } if page.search('.trainer a')
    originalWeight = page.search('.weight').map{ |n| n.inner_text } if page.search('.weight')
    w_diff = page.search('.w-diff').map{ |n| n.inner_text } if page.search('.w-diff')
    pass3 = page.search('.pass3').map{ |n| n.inner_text } if page.search('.pass3')
    pass4 = page.search('.pass4').map{ |n| n.inner_text } if page.search('.pass4')
    l3 = page.search('.l3').map{ |n| n.inner_text } if page.search('.l3')
    # tbodyより、繰り返し情報の抜き出し

    names.each_with_index do |name,i|
      product = RaceData.where(date: date, name: name).first_or_initialize
      if order[i].to_i >= 1
        product.order = order[i]
        product.name = name
        product.wakuban = wakuban[i]
        product.umaban = umaban[i]
        product.odds = odds[i]
        product.popular = popular[i]
        product.sex = make_sex(sexage[i])
        product.age = sexage[i][1..2]
        product.burden = exclude_characters(burden[i])
        product.jockey = jockey[i]
        product.time = make_time(originalTime[i])
        product.trainer = trainer[i]
        product.weight = exclude_characters(originalWeight[i])
        product.w_diff = w_diff[i]
        product.pass3 = pass3[i]
        product.pass4 = pass4[i]
        product.l3 = l3[i]
        product.racePlace = racePlace[0..1]
        product.course = courseLength[0]
        product.length = courseLength[1..4]
        product.date = date
        product.condition = condition

        product.save
      else
        break
      end
      # オーダーに数字が入力されていればDBへ保存
    end
  end

  def self.make_date(title)
    result = /[12][0-9][0-9][0-9]年1?[0-9]月[123]?[0-9]日/.match(title).to_s
    Date.strptime(result,'%Y年%m月%d日')
  end

  def self.make_condition(condition)
    result = /["稍"]?["良","重","不"]/.match(condition)
  end

  def self.make_sex(sexage)
    sex = sexage[0]
    if sex == '牡'
      'male'
    elsif sex == '牝'
      'female'
    elsif sex == 'セ'
      'oxen'
    else
      nil
    end
  end

  def self.exclude_characters(value)
    value.delete("^0-9.")
  end

  def self.exclude_num(value)
    value.delete("0-9")
  end

  def self.make_time(originalTime)
    time_array = originalTime.split(".")
    (time_array[0].to_f * 60) + time_array[1].to_f + (time_array[2].to_f / 10)
  end


end