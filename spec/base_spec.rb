require 'spec_helper'

describe DogShoe::Table do

  it 'hydrates an object' do
    #stub
    results = EgTable.find(
      url: 'http://example.com',
      css: '.example'
    )

    expect( results.first[0] ).to eq('1st')
    expect( results.first[1] ).to eq('2nd')
    expect( results.first[2] ).to eq('3rd')
    
    expect( results[1][0] ).to eq('2-1st')

    expect( results[2][0] ).to eq('3-1st')
  end

  it 'parses a table' do
  end  

  it 'uses headers as attributes' do
    eg = EgTable.new('http://example.com')
    results = eg.css('.example')
    results.first.first = '1st'
  end

end
