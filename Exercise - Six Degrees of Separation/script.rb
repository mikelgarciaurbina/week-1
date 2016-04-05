require_relative './User.rb'
require_relative './Twitter.rb'

require 'pry'

twitter = Twitter.new
text = IO.read('sample_input.txt')
text.gsub!(/\r\n?/, "\n")
text.each_line do |tweet|
	twitter.read_tweet(tweet)
end

twitter.print_users