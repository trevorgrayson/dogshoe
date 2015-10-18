require 'open-uri'
require 'nokogiri'

module DogShoe
  class Base

    attr_reader :doc

    def initialize(attributes = {})
      @values = attributes[:values]
      @keys = attributes[:keys].collect{|k| k.to_sym}
    end

    def [](key)
      @values[key]
    end

    class << self
      def parse(body)
        Nokogiri::HTML(body)
      end

      def fetch(uri)
        open(uri)
      end

      def css(selector)
        @doc.css(selector)
      end

      def values
        @values
      end

      def find(attrs)
        @doc = parse(fetch(attrs[:url]))
        results = css(attrs[:css])
        #self.class.new(results)
        results
      end

    end

    def method_missing(name, *args, &block)
      super unless @keys.include? name
      @values[@keys.index(name)]
    end

  end
end
