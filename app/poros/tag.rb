class Tag 
  attr_reader :tag

  def initialize(data)
    @tag = data[:attributes][:name]
  end
end