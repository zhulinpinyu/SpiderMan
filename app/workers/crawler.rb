require "anemone"

class Crawler
  @queue = :crawler_queue
  def self.perform(link)
    Anemone.crawl(link) do |anemone|
      anemone.on_every_page do |page|
        segment = page.doc
        if segment
          price = segment.at('dd > .average')
          name = segment.at('dd > .detail > .shopname > .BL')
          addressphone = segment.at('dd > .detail > .address')
          if price && name && addressphone
            price = price.text.strip
            name = name.text
            addressphone = addressphone.text.strip.split("\n") unless addressphone.text.empty? 
            address = addressphone[0]
            phone = addressphone[1] ? addressphone[1].strip : nil
            if price != "-" && name && address && phone
              deal = {
                price: price, 
                name: name,           
                address: address,
                phone: phone[2,phone.length]
              }
              Deal.new(deal).save unless Deal.find_by(address: address)
            end
          end
        end
      end
    end
  end
  
end