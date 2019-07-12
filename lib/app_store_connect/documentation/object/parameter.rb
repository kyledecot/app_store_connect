module AppStoreConnect 
  module Documentation
    class Object 
      class Parameter 
        def initialize(element:)
          @element = element
        end
        
        def name
          @element.at('.parametertable-name').text.tap do |name|
            name.gsub!(/(\[|\])/, "") if array?
          end 
        end 

        def type
          @element.at('.parametertable-type').text.chomp("\n")
        end 

        def array?
          !!@element.at('.parametertable-type').text.match(/\[.+\]/)
        end 
        
        def required?
          !!@element.at('.parametertable-requirement')&.text&.match(/Required/)
        end 
      end 
    end 
  end 
end 
