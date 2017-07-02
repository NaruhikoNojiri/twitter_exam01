module TweetsHelper
    def choose_index_or_edit
        if action_name == "confirm"
            confirm_tweets_path
        elsif condition == "edit"
            tweet_path
        end
    end
end
