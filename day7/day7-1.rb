input = File.read('./input.txt')
total = 0
@circuit = {  }

def process_node(node)
  input_nodes = []

  if node[:data][:input].include?("AND")
    input_nodes = node[:data][:input].split(" AND ").reject{|e| e == ""}
  elsif node[:data][:input].include?("OR")
    input_nodes = node[:data][:input].split(" OR ").reject{|e| e == ""}
  elsif node[:data][:input].include?("LSHIFT")
    input_nodes = node[:data][:input].split(" LSHIFT ").reject{|e| e == ""}
  elsif node[:data][:input].include?("RSHIFT")
    input_nodes = node[:data][:input].split(" RSHIFT ").reject{|e| e == ""}
  elsif node[:data][:input].include?("NOT")
    input_nodes = node[:data][:input].split("NOT ").reject{|e| e == ""}
  else
    input_nodes = [node[:data][:input]]
  end

  input_nodes = input_nodes.map do |input_node|
    if /\d/.match(input_node)
      input_node.to_i
    elsif @circuit[input_node][:value] != nil
      @circuit[input_node][:value]
    else
      @circuit[input_node][:value] = process_node({ id: input_node, data: @circuit[input_node] })
      @circuit[input_node][:value]
    end
  end

  if node[:data][:input].include?("AND")
    input_nodes[0].to_i & input_nodes[1].to_i
  elsif node[:data][:input].include?("OR")
    input_nodes[0].to_i | input_nodes[1].to_i
  elsif node[:data][:input].include?("LSHIFT")
    input_nodes[0].to_i << input_nodes[1].to_i
  elsif node[:data][:input].include?("RSHIFT")
    input_nodes[0].to_i >> input_nodes[1].to_i
  elsif node[:data][:input].include?("NOT")
    ~input_nodes[0].to_i
  else
    input_nodes[0].to_i
  end
end

def traverse_circuit
  @circuit.each do |id, data|
    @circuit[id][:value] = process_node({ id: id, data: data}) unless @circuit[id][:value].is_a?(Integer)
    puts "Value of #{id} - #{@circuit[id][:value]}"
  end
end

input.each_line do |line|
  source = line.slice(/[^->]*/).rstrip
  destination = line.slice(/->(.*)/)[3..-1].rstrip
  @circuit[destination] = { input: source, value: nil }
end

traverse_circuit
puts @circuit["a"]

# puts @circuit
# puts total