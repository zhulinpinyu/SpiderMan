
class DealsController < ApplicationController
  def index
    Resque.enqueue(Crawler,"http://www.dianping.com/shenzhen/food")    
    redirect_to deals_path
  end

  def deals
    @deals = Deal.all
  end
end
