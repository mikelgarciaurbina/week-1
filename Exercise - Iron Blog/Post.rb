class Post
	attr_reader :title, :date, :text, :sponsor
    def initialize(title, date, text, sponsor = false)
        @title = title
        @date = date
        @text = text
        @sponsor = sponsor
    end
end