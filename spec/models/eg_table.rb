class EgTable < DogShoe::Table

  def self.fetch(_)
    File.read('./spec/html/table.html')
  end

end
