class PhotosController < ApplicationController
  def index
    person = Flickr.people.find("78855345@N00")
    @photos = person.public_photos(sizes: true).map(&:medium500!)
  end
end
