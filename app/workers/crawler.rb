require "anemone"

class Crawler
  @queue = :crawler_queue
  def self.perform(link)
    Anemone.crawl(link) do |anemone|
      anemone.on_every_page do |page|
        segment = page.doc
        if segment && segment.at('dd > .average') && segment.at('dd > .detail > .shopname > .BL') && segment.at('dd > .detail > .address')
          deal = {
            price: segment.at('dd > .average').text, 
            name: segment.at('dd > .detail > .shopname').text,           
            address: segment.at('dd > .detail > .address').text 
          }
          Deal.new(deal).save
        end
      end
    end
  end
  
end