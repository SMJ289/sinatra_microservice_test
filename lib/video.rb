class Video
  attr_reader :video_id,
              :description,
              :thumbnail_url,
              :title,
              :category

  def initialize(data)
    @video_id = data[:snippet][:resourceId][:videoId]
    @description = data[:snippet][:description]
    @thumbnail_url = data[:snippet][:thumbnails][:default][:url]
    @title = data[:snippet][:title]
    @category = self.find_category
  end

  def find_category
    if yoga_queries.any? { |query| title.downcase.include?(query)}
      'yoga'
    elsif meditation_queries.any? { |query| title.downcase.include?(query)}
      'meditation'
    else
      'motivational'
    end
  end

  def yoga_queries
    ['yoga', 'ashtanga']
  end

  def meditation_queries 
    ['meditation', 'breath', 'breathwork', 'pranayama']
  end
end
