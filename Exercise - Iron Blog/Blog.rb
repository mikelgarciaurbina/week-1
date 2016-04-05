class Blog
    def initialize
        @posts = []
        @actual_page = 0
        @post_per_page = 3
    end

    def add_post(post)
    	@posts << post
    end

    def create_front_page
        post_order = order_post_by_date
        start_index_page = @actual_page * @post_per_page
    	post_order.each_with_index do |post, index|
            if are_post_in_actual_page?(index, start_index_page)
                publish_front_page(post)
            end
    	end
        show_pagination()
        user_input()
    end

    def are_post_in_actual_page?(index, start_index_page)
        index >= start_index_page && index < start_index_page + @post_per_page
    end

    def publish_front_page(post)
        puts (post.sponsor) ? "******* #{post.title} *******" : post.title
        puts "***************".colorize(:blue)
        puts post.text
        puts "-----------------".colorize(:blue)
    end

    def show_pagination
        pages_size = @posts.size / @post_per_page + 1
        (1..pages_size).each do |num|
            if num == @actual_page + 1
                print " " + num.to_s.colorize(:red)
            else
                print " " + num.to_s
            end
        end
        puts ""
    end

    def user_input
        input = read_char
        if input != "\e[A"
            if input == "\e[C" && @actual_page < @posts.size / @post_per_page
                @actual_page += 1
            elsif input == "\e[D" && @actual_page > 0
                @actual_page -= 1
            end
            create_front_page
        end
    end

    def order_post_by_date
        @posts.sort{ |a, b| b.date <=> a.date }
    end

    def read_char
        STDIN.echo = false
        STDIN.raw!

        input = STDIN.getc.chr
        if input == "\e" then
            input << STDIN.read_nonblock(3) rescue nil
            input << STDIN.read_nonblock(2) rescue nil
        end
        ensure
        STDIN.echo = true
        STDIN.cooked!

        return input
    end
end