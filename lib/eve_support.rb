module EveSupport
  module Password
    def self.generate_random_pass
      Array.new(14){[*'0'..'9', *'a'..'z', *'A'..'Z'].sample}.join
    end
  end
end
