module Qonfig
  module DataSets
    module Sortings
      class Sorting
        attr_reader :row

        def initialize(ext_params = {})
          params            = default_params.merge(ext_params||{})

          self.row          = params[:row]
        end

        def default_params
          {

          }
        end

        def row=( row )
          if( row.is_a?(Hash) )
            @row    = Row.new(row)
          elsif( row.is_a?(Row) )
            @row    = row
          elsif( row.nil? )
            @row = nil
          else
            raise Exception.new("I'm sorry you can't do that")
          end
        end

        def serializable_hash
          {
            :row            => (row.present? ? row.serializable_hash : {})
          }.delete_if{|k,v|v.blank?}
        end
      end
    end
  end
end