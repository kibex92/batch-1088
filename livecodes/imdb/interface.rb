require 'yaml' # => We need access to the yaml library to use its methods
require_relative './scraper'

# Get all the urls for the first 5 top movies
urls = fetch_movie_urls # => Array of URLS

# Iterate over urls and pass each URL to the fetch_movie method to scrape data for each movie
movies = urls.map do |url|
    fetch_movie(url) # => Returns the movie hash
end

# movies is now an array of Hashes for each movie

# Open the 'movies.yml' file, set the 'wb' flag to write to it, convert movies to a yaml and write to the file
File.open("movies.yml", "wb") do |file|
    file.write(movies.to_yaml)
end