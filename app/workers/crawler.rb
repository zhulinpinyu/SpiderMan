require "anemone"

Anemone.crawl("http://www.dianping.com/search/category/7/10") do |anemone|
  anemone.on_every_page do |page|
    puts page.doc
  end
end