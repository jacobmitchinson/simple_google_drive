require 'authenticate_module'

class TestDriveModule; include AuthenticateWithGoogle; end

describe AuthenticateWithGoogle do 

  let(:drivemodule) { TestDriveModule.new }

  # it 'should authorize and save an access_token' do
  #   expect(drivemodule.authorize_oauth).to eq drivemodule.load_access_token
  # end

  it 'should create a session with google using OAuth' do 
    expect(drivemodule.create_session).to be_an_instance_of GoogleDrive::Session
  end

end