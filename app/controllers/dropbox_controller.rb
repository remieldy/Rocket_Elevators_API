class DropboxController < ApplicationController
    # Example call:
    # GET /dropbox/auth
    def auth
      url = authenticator.authorize_url :redirect_uri => redirect_uri
  
      redirect_to url
    end
  
    # Example call:
    # GET /dropbox/auth_callback?code=VofXAX8DO1sAAAAAAAACUKBwkDZyMg1zKT0f_FNONeA
    def auth_callback
      auth_bearer = authenticator.get_token(params[:code],
                                            :redirect_uri => redirect_uri)
      token = auth_bearer.token # This line is step 5 in the diagram.
  
      folders = DropboxApi::Client.new(token).list_folder ""
      render html: 'connection established', status:200
    end

  #  def index

  #    folders = DropboxApi::Client.new(File.read('/mnt/c/tmp/token.txt')).list_folder ""
     
  #    render json: folders
  #  end

  
    private
  
    def authenticator
      client_id = "e00vrtbikk94gqn"
      client_secret = "j7qrg9wvfhfiyvz"
  
      DropboxApi::Authenticator.new(client_id, client_secret)
    end
  
    def redirect_uri
      dropbox_auth_callback_url # => https://marcantoinetanguay.com/dropbox/auth_callback
    end
  end