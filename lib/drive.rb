require_relative "authenticate_module.rb"

class Drive

  include AuthenticateWithGoogle

  attr_reader :session

  def initialize
    @session = create_session
    list
  end

end