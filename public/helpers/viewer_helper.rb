require 'net/http'
require 'json'

class ViewerHelper
  def self.get_thumbnail(file_uri)
    # this is a truly disgusting way to do this but I'm not sure how else to get a thumbnail from a CONTENTdm IIIF manifest
    if file_uri.include?("manifest.json")
      file_uri.gsub!(/http(s)?:\/\//,'')
      array = file_uri.split('/')
      return "https://#{array[0]}/digital/api/singleitem/collection/#{array[3].gsub!(':','/id/')}/thumbnail"
    else
      return file_uri
    end
  end
end
