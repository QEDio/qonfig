module Qonfig
  module Views
    class Partial < Base
      attr_accessor :graphs
      attr_accessor :data

      def initialize(ext_params = {})
        params        = default_params.merge(ext_params)

        @graphs       = {}
        add_graphs(params[:graphs])
      end

      def default_params
        {
          :graphs => []
        }
      end

      def add_graphs(graphs, ext_options = {})
        options     = default_add_graphs_options.merge(ext_options)

        Array(graphs).each do |graph|
          add_graph(graph)
        end
      end

      def default_add_graphs_options
        {

        }
      end

      def add_graph(graph, ext_options = {})
        options     = default_add_graph_options.merge(ext_options)

        if( graph.is_a?(Hash) )
          raise Exception.new("Need an uuid") if graph[:uuid].blank?
          @graphs[graph[:uuid]] = Analytics::Graph.new(graph)
        elsif( graph.is_a?(Partial) )
          @graphs[graph.uuid] = graph
        end
      end

      def default_add_graph_options
        {

        }
      end

      def serializable_graphs
        @graphs.map{|k,v|v.serializable_hash}
      end

      def serializable_hash
        super.merge({
          :graphs           => serializable_graphs,
          :data             => data
        })
      end

      def eql?(other)
        serializable_hash = other.serializable_hash
      end

      def ==(other)
        eql?(other)
      end
    end
  end
end