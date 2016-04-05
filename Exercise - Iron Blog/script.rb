require_relative './Blog.rb'
require_relative './Post.rb'

require 'date'
require 'colorize'
require 'io/console'

blog = Blog.new
blog.add_post Post.new("Post title 1", Date.new(2016,1,5), "Post 1 text")
blog.add_post Post.new("Post title 2", Date.new(2016,1,25), "Post 2 text", true)
blog.add_post Post.new("Post title 3", Date.new(2016,1,28), "Post 3 text")
blog.add_post Post.new("Post title 4", Date.new(2016,2,5), "Post 4 text")
blog.add_post Post.new("Post title 5", Date.new(2016,2,25), "Post 5 text")
blog.add_post Post.new("Post title 6", Date.new(2016,3,5), "Post 6 text")
blog.add_post Post.new("Post title 7", Date.new(2016,3,25), "Post 7 text")
blog.add_post Post.new("Post title 8", Date.new(2016,4,5), "Post 8 text")

blog.create_front_page