# -*- encoding: utf-8 -*-
module Qonfig
  module Views
    class Partial < Base
      attr_accessor :graphs, :default_graphs, :data_set

      SEARCH_ORDER = [
        [:row_key, :row_value, :column_key],
        [:row_key, :row_value],
        [:row_key]
      ]

      def initialize(ext_params = {})
        params              = default_params_weak.merge(ext_params||{}).merge(default_params_strong)

        @graphs             = {}
        @default_graphs     = {}


        set_data_set(params.delete(:data_set))
        add_graphs(params.delete(:graphs))
        add_default_graphs(params.delete(:default_graphs))

        super(params)
      end

      def default_params_weak
        {
          :graphs               => [],
          :default_graphs       => [],
        }
      end

      def default_params_strong
        {
          :type       => self.class,
        }
      end

      def set_data_set( data_set )
        @data_set = DataSets::DataSet.new( data_set )
      end

      def add_graphs(graphs, ext_options = {})
        add_graphs_int(graphs, ext_options.merge({:add_to => @graphs}))
      end

      def add_default_graphs(default_graphs, ext_options = {})
        add_graphs_int(default_graphs, ext_options.merge({:add_to => @default_graphs}))
      end

      def add_graph(graph, ext_options = {})
        options     = default_add_graph_options.merge(ext_options)

        if( graph.is_a?(Hash) )
          raise Exception.new("Need an uuid") if graph[:uuid].blank?
          options[:add_to][graph[:uuid]] = Analytics::Graph.new(graph)
        elsif( graph.is_a?(Analytics::Graph) )
          options[:add_to][graph.uuid] = graph
        end
      end

      def default_add_graph_options
        {
          :add_to        => @graphs
        }
      end

      def get_graph(ext_options = {})
        options         = default_get_graph_options.merge(ext_options)

        if( options[:with_defaults] )
          graph   = get_the_graph( graphs, options )
          default = get_default_graph( options )

          # this should normally not happen
          if( graph.nil? && default.nil? )
            graph = Analytics::Graph.new
          elsif graph.nil?
            graph = Analytics::Graph.new(default.serializable_hash.merge(
                  {
                    :uuid         => nil,
                    :keys         => options[:keys]
                  }
                ))
          else
            graph = graph.merge(default)
          end
        else
          graph = get_the_graph( graphs, options )
        end

        return graph
      end

      def default_get_graph_options
        {
          :with_defaults        => true
        }
      end

      def update_graph(graph, ext_options = {})
        options           = {}.merge(ext_options)
        default           = get_default_graph(options.merge({:graph => graph}))
        new_functions     = []

        # find not default functions
        if( options[:functions].size > 0 )
          options[:functions].each do |function|
            def_function      = default.function( :name => function.name )

            if( def_function.present? )
              if( def_function.color != function.color || def_function.periodicity != function.periodicity ||
                  def_function.deviation_factor != function.deviation_factor ||
                  def_function.number_of_values_moving_average != function.number_of_values_moving_average )
                new_functions << function
              end
            else
              new_functions << function
            end
          end
        end

        # since merging is not really working on a function level, set all functions here
        new_functions = options[:functions] if new_functions.present?
        new_functions = options[:functions] if default.functions.size != options[:functions].size

        graph.set_functions(new_functions)
        graph.order = new_functions.map{|f|f.uuid}
        add_graph(graph)
      end

      def get_default_graph(ext_options = {})
        if( ext_options.key?(:graph) )
          graph         = ext_options.delete(:graph)
          options       = {
            :default_matching => true,
            :keys             => graph.keys
          }.merge(ext_options)
        else
          options       = {:default_matching => true}.merge(ext_options)
        end

        get_the_graph( default_graphs, options )
      end

      def serializable_graphs(g = graphs)
        g.map{|k,v|v.serializable_hash}
      end

      def serializable_hash
        super.merge({
          :graphs           => serializable_graphs,
          :default_graphs   => serializable_graphs(default_graphs),
          :data_set         => data_set.serializable_hash
        }).delete_if{|k,v|v.blank?}
      end

      private
        def add_graphs_int( graphs, options )
          graphs = [graphs] unless Array.try_convert(graphs)

          graphs.each do |graph|
            add_graph(graph, options)
          end
        end

        def get_the_graph( data, ext_options )
          raise Exception.new("column_value not supported yet") if ext_options[:column_value].present?
          options                 = default_get_the_graph_options.merge(ext_options)
          graph                   = nil

          # don't "fuzzy-match". We want the one matching config, or nothing
          if( options[:default_matching] == false )
            graph = get_graph_int( data, options )
          # fuzzy matching for default config
          else
            keys = options[:keys]

            if( keys.present? )
              options[:search_order].each do |order|
                search_keys = {}
                order.each{|o| search_keys[o] = keys[o]}

                graph = get_graph_int( data, {:keys => search_keys})

                break if graph.present?
              end
            else
              graph = get_graph_int( data )
            end

            if graph.blank?
              graph = get_graph_int( data, {} )
            end
          end

          return graph
        end

        def default_get_the_graph_options
          {
            :search_order       => SEARCH_ORDER,
            :default_matching   => false
          }
        end

        def get_graph_int( graphs, options = {} )
          if( options[:uuid] )
            graph = graphs[options[:uuid]]
          else
            graph = graphs.select{|k,g| g.match?(options[:keys]) }
          end
          
          return graph.values.first
        end
    end
  end
end