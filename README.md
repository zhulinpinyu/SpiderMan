== SpiderMan

Net Spider

Step 1:

bundle

rake db:migrate

rails s

rake resque:work QUEUE="*" or rake resque:work QUEUE="crawler_queue"

refresh [localhost:3000/deals](localhost:3000/deals) see data.