namespace :dropboxapi do
  desc "TODO"
  task dropboxtask: :environment do
    DropboxApi::Authenticator.new("G0yujcU9D4AAAAAAAAAAI1KNX7oKNBw58-K97KHEMn7X0t60zCE8JHJfVqNqyvc3")

    result = client.list_folder "/dropbox_folder"




  result.entries
  result.has_more?


  end
end
