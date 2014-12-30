require 'drive'

describe Drive do 

  let(:drive) { Drive.new }

  it 'can list files in google drive' do 
    expect(drive.list).to be true
  end

end