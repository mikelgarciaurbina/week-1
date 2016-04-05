class Twitter
	attr_accessor :all_users

    def initialize
    	@all_users = []
    end

    def read_tweet(tweet)
    	user_tweet = tweet.split(":")
    	user = create_user(user_tweet[0])
    	mentions = user_tweet[1].scan(/(?<=@)\w+/)
    	mentions.each do |username|
    		user_mentioned = create_user(username)
	        user.mentions.push(user_mentioned)
	    end
    end

    def create_user(username)
    	user = @all_users.select { |u| u.username == username }
    	if user.size == 0
    		user = User.new(username)
    		@all_users << user
    	else
    		user = user.first
    	end
		user
    end

    def print_users
    	@all_users.each do |user|
    		puts user.username
    		user.mentions.each do |mention_user|
	    		print mention_user.username + ", "
		    end
		    puts ""
	    end
	end

	def user_connections
		puts ""
	end
end