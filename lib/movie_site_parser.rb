require 'nokogiri'
require 'net/http'
require 'open-uri'

require_relative 'movie'
require_relative 'movie_collection'

module MoviesSiteParser
  KINOAFISHA_URL = 'https://www.kinoafisha.info/rating/movies/'.freeze

  def self.load_from_kinoafisha
    html = URI.open(KINOAFISHA_URL, &:read)
    doc = Nokogiri::HTML(html)

    url_list = doc.css('.movieItem_ref').map { |n| n['href'] }

    movies = url_list.sample(7).map do |url|
      html = URI.open(url, &:read)
      doc = Nokogiri::HTML(html)
      title = doc.css('.trailer_breadcrumbs .breadcrumbs_item[3]').text
      director = doc.css('.badgeList_content .badgeList_name').first.text
      date = doc.css('.filmInfo_info div[2] span[2]').text

      Movie.new(
        title,
        director,
        date
      )
    end
    MovieCollection.new(movies)
  end
end
