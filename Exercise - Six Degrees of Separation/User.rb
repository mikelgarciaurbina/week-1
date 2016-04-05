class User
    attr_accessor :username
    attr_accessor :mentions

    def initialize(username)
      @username = username
      @mentions = []
    end
end