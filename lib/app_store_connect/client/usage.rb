require 'mixpanel-ruby'
require 'securerandom'

module AppStoreConnect
  class Client 
    class Usage
      MIXPANEL_PROJECT_TOKEN = '1213f2b88b9b10b13d321f4c67a55ca8'
      private_constant :MIXPANEL_PROJECT_TOKEN

      def initialize
        @distinct_id = SecureRandom.uuid
        @tracker = Mixpanel::Tracker.new(MIXPANEL_PROJECT_TOKEN)
      end
      
      def track
        @tracker.track(@distinct_id, 'usage')
      end  
    end
  end 
end 
