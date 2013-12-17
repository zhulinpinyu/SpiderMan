require "anemone"

Anemone.crawl("http://www.dianping.com/shenzhen/food") do |anemone|
  anemone.on_every_page do |page|
    segment = page.doc
    if segment
      if segment.at('dd > .average')
        puts segment.at('dd > .average').text
      end
      if segment.at('dd > .detail > .shopname > .BL')
        puts segment.at('dd > .detail > .shopname').text
      end
      if segment.at('dd > .detail > .address')
        puts segment.at('dd > .detail > .address').text
      end
    end
  end
end