require 'fast_jsonapi'

class VideoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :description, :video_id, :thumbnail_url
end