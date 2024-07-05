module Cricket
  class Team
    attr_accessor :name, :max_players
    def initialize(name, max_players)
      @name = name
      @max_players = max_players
      @players = []
    end
  end
  class Player
    attr_accessor :name
    def initialize(name)
      @name = name
    end
  end
end
