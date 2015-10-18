module DogShoe
  class Table < Base

    class << self
      def find(attrs)
        @doc = parse(fetch(attrs[:url]))
        css(attrs[:css])
        @values.collect do |result|
          new(values: result, keys: @keys)
        end
      end

      def css(selector, args=[])
        out = super(selector)#, *args)
        table_to_magic(out, *args)
      end
    
      def table_to_magic(table, *args)
        trs = table.css('tr')

        @keys = table.css('th').collect do |td|
          scrub(td.text).gsub(/[^0-9a-zA-Z\s]/,'').gsub(/\s/,'_').downcase
        end 
        
        @values = trs.collect do |tr|
          tr.css('td').collect do |td|
            td.text
          end
        end.reject{|tr| tr.empty? }

        @values = @values.collect do |trs|
          trs.collect do |td|
            #td =~ /[0-9]/ ? 
            td.gsub(/[^0-9]/,'').to_f 
            #: td
          end
        end if args.include?(:numeric)
        #throw DogShoe::NotFound if nothing found
        @values
      end

      def scrub(text)
        text.gsub("\n",'').gsub(/^\s*/,'').gsub(/\s*$/,'')
      end
    end

  end
end
