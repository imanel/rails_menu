module RailsMenu
  class Set

    class << self
      def list
        @list ||= {}
      end

      def [](list_name)
        list[list_name]
      end
    end

    attr_accessor :name

    def initialize(name = 'default', element_list = [])
      @name = name
      @element_list = []
      element_list.each{ |elem| self.add(*elem) }

      self.class.list[name] = self
    end

    def add(id, url = '', options = {})
      element = Element.new(id.to_s, url, options)
      @element_list << element
      element
    end

    def elements
      @element_list
    end

  end
end