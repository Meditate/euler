#!/bin/ruby

#The first line contains two space-separated integers  and , the number of nodes and edges in the graph.
#Each line  of the  subsequent lines contains two space-separated integers,  and , describing an edge connecting node  to node .
#The last line contains a single integer, , denoting the index of the starting node.
#Output Format

#For each of the  queries, print a single line of  space-separated integers denoting the shortest distances to each of the  
#other nodes from starting position . These distances should be listed sequentially by node number (i.e., ), 
#but should not include node . If some node is unreachable from , print  as the distance to that node.

require "minitest/autorun"
require "byebug"

class BfsTest < Minitest::Test
  def test_create_matrix
      edges = [ 
                1, 2,
                1, 3,
                2, 4,
                3, 4,
                3, 5
              ]
      bfs = Bfs.new

      result = {
                 1 => [2, 3],
                 2 => [4],
                 3 => [4, 5]
               }
      assert_equal(bfs.create_matrix_from(edges), result)
  end

  def test_call_returns_an_output
      edges = [ 
                1, 2,
                1, 3,
                2, 4,
                3, 4,
                3, 5
              ]
      bfs = Bfs.new

      result = [1, 1, 2, 2]
      assert_equal(bfs.call(5, 5, edges, 1), result)
  end

  def test_call_with_unattached_nodes
      edges = [ 
                1, 2,
                1, 3,
                3, 4,
              ]
      bfs = Bfs.new

      result = [1, 1, 2, -1]
      assert_equal(bfs.call(5, 3, edges, 1), result)
  end
end

class Bfs
  def call(n, m, edges, s)
    matrix = create_matrix_from(edges)
    queue = []
    lengths = []
    used = []

    queue.push(s)
    used[s] = true
    lengths[s] = 0

    while !queue.empty?
      curr_node = queue.shift
      matrix[curr_node].to_a.each do |node|
        unless used[node]
          queue.push(node)
          used[node] = true
          lengths[node] = lengths[curr_node] + 1
        end
      end
    end
    
    # set -1 for unattached nodes
    (1..n).to_a.each do |node_index|
      unless used[node_index]
        lengths[node_index] = -1
      end
    end

    lengths[2..]
  end
  
  def create_matrix_from(edges)
    edges
      .each_slice(2)
      .map{|k, v| Hash[k, v] }
      .inject({}) do |aggregated, h|
        aggregated.merge(h){ |key, old_value, new_value| [old_value, new_value] } 
      end
      .transform_values { |values| ([] << values).flatten }
  end
end

