module AppStoreConnect 
  class DocumentationPage 
    def initialize(page:)
      @page = page
    end 

    def type?
      @page.at('.topic-title .eyebrow')&.text == 'Type'
    end

    def object?
      @page.at('.topic-title .eyebrow')&.text == 'Object'
    end 
  end 
end 
