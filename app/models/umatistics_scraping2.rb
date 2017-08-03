class UmatisticsScraping2
  def self.product_urls
    agent = Mechanize.new
    links = []
    next_url = "l20100417"
    # スタート時のリンク
    # 自動取得したい

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
      次のページへのリンクが存在すれば取得
    end

    links.each do |link|
      get_product('http://klan.jp/' + link)
      # このeachが取ってきたリンクの数だけ繰り返される
    end

  end

  def self.get_product(link)
    agent = Mechanize.new
    page = agent.get(link)

    week_id = exclude_characters_without_dot(link)
    tansyo_num = page.search('.tansyo span').inner_text
    tansyo_return = page.search('.tansyo dd').inner_text
    fukusyo_num1 = page.search('.fukusyo dl dt:nth-of-type(1) span').inner_text
    fukusyo_num2 = page.search('.fukusyo dl dt:nth-of-type(2) span').inner_text
    fukusyo_num3 = page.search('.fukusyo dl dt:nth-of-type(3) span').inner_text
    fukusyo_return1 = page.search('.fukusyo dl dd:nth-of-type(1)').inner_text
    fukusyo_return2 = page.search('.fukusyo dl dd:nth-of-type(2)').inner_text
    fukusyo_return3 = page.search('.fukusyo dl dd:nth-of-type(3)').inner_text

    wide_num1_1 = page.search('.wide dl dt:nth-of-type(1) span:nth-of-type(1)').inner_text
    wide_num1_2 = page.search('.wide dl dt:nth-of-type(1) span:nth-of-type(2)').inner_text
    wide_num2_1 = page.search('.wide dl dt:nth-of-type(2) span:nth-of-type(1)').inner_text
    wide_num2_2 = page.search('.wide dl dt:nth-of-type(2) span:nth-of-type(2)').inner_text
    wide_num3_1 = page.search('.wide dl dt:nth-of-type(3) span:nth-of-type(1)').inner_text
    wide_num3_2 = page.search('.wide dl dt:nth-of-type(3) span:nth-of-type(2)').inner_text

    wide_return1 = page.search('.wide dl dd:nth-of-type(1)').inner_text
    wide_return2 = page.search('.wide dl dd:nth-of-type(2)').inner_text
    wide_return3 = page.search('.wide dl dd:nth-of-type(3)').inner_text

    wakuren_num1 = page.search('.wakuren dl dt span:nth-of-type(1)').inner_text
    wakuren_num2 = page.search('.wakuren dl dt span:nth-of-type(2)').inner_text

    wakuren_return = page.search('.wakuren dl dd').inner_text

    umaren_num1 = page.search('.wide dl dt span:nth-of-type(1)').inner_text
    umaren_num2 = page.search('.wide dl dt span:nth-of-type(2)').inner_text

    umaren_return = page.search('.umaren dl dd').inner_text

    umatan_num1 = page.search('.umatan dl dt span:nth-of-type(1)').inner_text
    umatan_num2 = page.search('.umatan dl dt span:nth-of-type(2)').inner_text

    umatan_return = page.search('.umatan dl dd').inner_text

    sanrenpuku_num1 = page.search('.sanrenpuku dl dt span:nth-of-type(1)').inner_text
    sanrenpuku_num2 = page.search('.sanrenpuku dl dt span:nth-of-type(2)').inner_text
    sanrenpuku_num3 = page.search('.sanrenpuku dl dt span:nth-of-type(3)').inner_text

    sanrenpuku_return = page.search('.sanrenpuku dl dd').inner_text

    sanrentan_num1 = page.search('.sanrentan dl dt span:nth-of-type(1)').inner_text
    sanrentan_num2 = page.search('.sanrentan dl dt span:nth-of-type(2)').inner_text
    sanrentan_num3 = page.search('.sanrentan dl dt span:nth-of-type(3)').inner_text

    sanrentan_return = page.search('.sanretan dl dd').inner_text

    binding.pry

    # ページ全体から一度のみ取得する情報を抜き出す


      product = Returns.where(week_id: week_id).first_or_initialize
        product.tansyo_num = tansyo_num
        product.tansyo_return1 = exclude_characters(tansyo_return)

        product.fukusyo_num1 = fukusyo_num1
        product.fukusyo_num2 = fukusyo_num2
        product.fukusyo_num3 = fukusyo_num3

        product.fukusyo_return1 = exclude_characters(fukusyo_return1)
        product.fukusyo_return2 = exclude_characters(fukusyo_return2)
        product.fukusyo_return3 = exclude_characters(fukusyo_return3)


        product.wide_num1_1 = wide_num1_1
        product.wide_num1_2 = wide_num1_2
        product.wide_num2_1 = wide_num2_1
        product.wide_num2_2 = wide_num2_2
        product.wide_num3_1 = wide_num3_1
        product.wide_num3_2 = wide_num3_2

        product.wide_return1 = exclude_characters(wide_return1)
        product.wide_return2 = exclude_characters(wide_return2)
        product.wide_return3 = exclude_characters(wide_return3)

        product.wakuren_num1 = wakuren_num1
        product.wakuren_num2 = wakuren_num2

        product.wakuren_return = exclude_characters(wakuren_return)

        product.umaren_num1 = umaren_num1
        product.umaren_num2 = umaren_num2

        product.umaren_return = exclude_characters(umaren_return)

        product.umatan_num1 = umatan_num1
        product.umatan_num2 = umatan_num2

        product.umatan_return = exclude_characters(umatan_return)

        product.sanrenpuku_num1 = sanrenpuku_num1
        product.sanrenpuku_num2 = sanrenpuku_num2
        product.sanrenpuku_num3 = sanrenpuku_num3

        product.sanrenpuku_return = exclude_characters(sanrenpuku_return)

        product.sanrentan_num1 = sanrentan_num1
        product.sanrentan_num2 = sanrentan_num2
        product.sanrentan_num3 = sanrentan_num3

        product.sanrentan_return = exclude_characters(sanrentan_return)

        product.save

      # オーダーに数字が入力されていればDBへ保存
  end

  def self.exclude_characters(value)
    value.delete("^0-9.")
  end

end