class TwitterController < ApplicationController
  def show
  end

  def avatar
    auth =  request.env["omniauth.auth"]
    Twitter.configure do |config|
      config.consumer_key = TWITTER_CONSUMER_KEY
      config.consumer_secret = TWITTER_CONSUMER_SECRET
      config.oauth_token = auth['credentials']['token']
      config.oauth_token_secret = auth['credentials']['secret']
    end
    Twitter.update_profile_image(Rails.root.join('app','assets','images','j3face.jpg').open)
    Twitter.update('I used http://j3face.com to update my avatar to the face of @j3 #j3face #railsconf')
    redirect_to auth['user_info']['urls']['Twitter']
  end
end
