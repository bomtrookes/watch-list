require 'net/http'

# Net::HTTP.start(uri.host, uri.port) do |http|
#   request = Net::HTTP::Get.new uri

#   response = http.request request # Net::HTTPResponse object
# end

uri = URI('https://tmdb.lewagon.com/movie/top_rated')
request = Net::HTTP.get(uri) # => String

movies.each do |movie|
  poster = 'https://image.tmdb.org/t/p/original'

Movie.create!(
  title: movie["original_title"],
  overview: movie["overview"] ,
  poster_ur: "#{poster}#{movie["poster_path"]}" ,
  rating: movie["vote_average"]
)
end

