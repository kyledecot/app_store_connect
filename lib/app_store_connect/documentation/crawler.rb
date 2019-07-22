require 'mechanize'

module AppStoreConnect
  class Crawler
    def initialize
      @agent = Mechanize.new do |a|
        a.user_agent_alias = 'Mac Safari'
      end
    end

    def get(uri)
      @agent.get(uri) do |page|
        return page
      end
    end
  end
end 
