# sinatra-sandbox
Playing around with Sinatra and some external API's. Nothing serious - just for demo purposes.

#####TweetService Module
```
./lib/tweet.rb
```

Twitter API v1.1 requires you to authenticate via OAuth, so you'll need to register your application with Twitter. Register application with Twitter: https://apps.twitter.com/

Twitter RESTful API documentation: https://dev.twitter.com/rest/public

Ruby gem: https://github.com/sferik/twitter

You need to create an `.env` file in the root folder and add credentials for your application and your Twitter user.

```
CONSUMER_KEY        = ...
CONSUMER_SECRET     = ...
ACCESS_TOKEN        = ...
ACCESS_TOKEN_SECRET = ...
```



