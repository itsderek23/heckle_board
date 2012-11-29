# Realtime Ruby Meetup Heckle Board

A demo of a realtime functionality w/Ruby via the Sinatra framework and [Pusher](http://pusher.com), created for the 
[Fort Collins Ruby Meetup](http://www.meetup.com/FoCoRuby/).

![screenshot](https://dl.dropbox.com/u/468982/meetup/realtime_board_screenshot.jpg)

# Running

* Install [foreman](https://github.com/ddollar/foreman). Foreman is used to run the Sinatra app + load environment variables. 
* Create a `.env` file, entering your Pusher creds. See `.env.example` for an example.
* `foreman start`

# Deploying to Heroku

* Setup [config vars](https://devcenter.heroku.com/articles/config-vars) for the environment variables created above. Example:
    `heroku config:add APP_ID=3223476`
* git push heroku
