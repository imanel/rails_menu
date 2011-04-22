module RailsMenu
  class Element

    attr_accessor :id, :url, :options, :active

    def initialize(id, url = '', options = {})
      @id = id.to_s
      @url = url
      @options = options
      @active = false
    end

  end
end