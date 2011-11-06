# -*- encoding: utf-8 -*-
module Qonfig
  module Views
    class Partial < Base
      attr_accessor :graphs, :default_graphs
      attr_reader :data

      def initialize(ext_params = {})
        params              = default_params_weak.merge(ext_params).merge(default_params_strong)

        @graphs             = {}
        @default_graphs     = {}
        @data               = params.delete(:data)
        add_graphs(params.delete(:graphs))
        add_default_graphs(params.delete(:default_graphs))

        super(params)
      end

      def default_params_weak
        {
          :graphs               => [],
          :default_graphs       => []
        }
      end

      def default_params_strong
        {
          :type       => self.class,
        }
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
        elsif( graph.is_a?(Partial) )
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
          graph   = get_graph_int( graphs, options )
          default = get_default_graph(ext_options)

          # this should normally not happen
          if( graph.nil? && default.nil? )
            graph = Analytics::Graph.new
          elsif graph.nil?
            graph = default
          end
        else
          graph = get_graph_int( graphs, options )
        end

        return graph
      end

      def default_get_graph_options
        {
          :with_defaults        => true
        }
      end

      def get_default_graph(ext_options = {})
        options       = {}.merge(ext_options)
        get_graph_int( default_graphs, options )
      end

      def serializable_graphs(g = graphs)
        g.map{|k,v|v.serializable_hash}
      end

      def serializable_hash
        super.merge({
          :graphs           => serializable_graphs,
          :default_graphs   => serializable_graphs(default_graphs),
          :data             => data
        }).delete_if{|k,v|v.blank?}
      end

      private
        def add_graphs_int( graphs, options )
          graphs = [graphs] unless Array.try_convert(graphs)

          graphs.each do |graph|
            add_graph(graph, options)
          end
        end

        def get_graph_int( data, options )
          if( options[:uuid] )
            graph = data[options[:uuid]]
          elsif( options.key?(:row_key) && options.key?(:row_value) && options.key?(:column_key) && options.key?(:column_value) )
            graph = data.select{|k,g|
              g.row_key.eql?(options[:row_key]) &&
              g.row_value.eql?(options[:row_value]) &&
              g.column_key.eql?(options[:column_key]) &&
              g.column_value.eql?(options[:column_value])}
          elsif( options.key?(:row_key) && options.key?(:row_value) && options.key?(:column_key) )
            graph = data.select{|k,g|
              g.row_key.eql?(options[:row_key]) &&
              g.row_value.eql?(options[:row_value]) &&
              g.column_key.eql?(options[:column_key]) &&
              g.column_value.blank?
            }
          elsif( options.key?(:row_key) && options.key?(:row_value) )
            graph = data.select{|k,g|
              g.row_key.eql?(options[:row_key]) &&
              g.row_value.eql?(options[:row_value]) &&
              g.column_key.blank? &&
              g.column_value.blank?
            }
          elsif( options.key?(:row_key) )
            graph = data.select{|k,g|
              g.row_key.eql?(options[:row_key]) &&
              g.row_value.blank? &&
              g.column_key.blank? &&
              g.column_value.blank?
            }
          else
            graph = data.select{|k,g|
              g.row_key.blank? &&
              g.row_value.blank? &&
              g.column_key.blank? &&
              g.column_value.blank?
            }
          end
          
          return graph.values.first
        end
    end
  end
end