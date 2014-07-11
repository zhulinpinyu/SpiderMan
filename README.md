
[![Code Climate](https://codeclimate.com/github/zhulinpinyu/SpiderMan.png)](https://codeclimate.com/github/zhulinpinyu/SpiderMan)

###SpiderMan

Net Spider

####Step:

    bundle
    rake db:migrate
    rails s
    rake resque:work QUEUE="*" or rake resque:work QUEUE="crawler_queue"

Visit [http://localhost:3000](http://localhost:3000/) trigger crawler.    
Refresh [http://localhost:3000/deals](http://localhost:3000/deals) see data.
