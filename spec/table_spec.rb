require 'spec_helper'

describe DogShoe::Table do

  it 'finds a model' do
    #stub
    results = DogShoe::Table.find(
      url: 'http://www.calottery.com/play/scratchers-games/$30-scratchers/30th-anniversary-1183',
      css: '.draw_games'
    )

    results.first
  end

  it 'parses a table' do
  end  

  it 'uses headers as attributes' do
    eg = EgTable.new('http://example.com')
    results = eg.css('.example')
    results.first.first = '1st'
  end

end
