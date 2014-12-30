module AuthenticateWithGoogle

  require "google/api_client"
  require "google_drive"
  require 'yaml'

  def authorize_oauth
    client = Google::APIClient.new
    auth = client.authorization
    auth.client_id = ""
    auth.client_secret = ""
    auth.scope =
      "https://www.googleapis.com/auth/drive" 
    auth.redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
    print("1. Open this page:\n%s\n\n" % auth.authorization_uri)
    print("2. Enter the authorization code shown in the page: ")
    auth.code = $stdin.gets.chomp
    auth.fetch_access_token!
    access_token = auth.access_token
    save_access_token(access_token)
    return access_token
  end

  def save_access_token(access_token)
    yaml = YAML::dump(access_token)
    mode = "w+"
    file = File.open("./lib/access_token.yml", mode)
    file.write("#{yaml}")
  end

  def load_access_token
    file = File.read("./lib/access_token.yml")
    access_token = YAML::load(file)
    return access_token
  end

  def create_session
    return GoogleDrive.login_with_oauth(load_access_token)
  end

end