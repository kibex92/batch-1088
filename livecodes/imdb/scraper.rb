require 'open-uri'
require 'nokogiri'

def fetch_movie_urls
    url = "https://www.imdb.com/chart/top"
    base_url = "https://www.imdb.com"
    html = URI.open(url, "Accept-Language" => "en-US").read
    doc = Nokogiri::HTML(html)
    urls = []

    doc.search(".titleColumn a").first(5).each do |element|
        urls << "https://www.imdb.com#{element.attributes["href"].value}"
    end
    urls
end

def fetch_movie(url)
    html = URI.open(url, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0", "Accept-Language" => "en-US").read
    doc = Nokogiri::HTML(html)

    title =  doc.search("h1").text.strip
    director = doc.search(".ipc-metadata-list__item:contains('Director') .ipc-inline-list__item").first.text.strip
    # The 1st selector looks for the css class that contains the word Director inside, once found we look for the next css class inside of it to access the data inside
    year = doc.search(".sc-8c396aa2-1").first.text.strip.to_i # => I've tried the most unique selector in this case, there were several matches, but the 1st one seemed to be the year so I applied .first to it
    storyline =  doc.search(".sc-16ede01-7").text.strip # An easy one, chose the most unique selector and it worked
    cast = doc.search(".ipc-metadata-list__item:contains('Stars') .ipc-metadata-list-item__list-content-item").map { |element| element.text.strip }.uniq
    # The cast is located on the same class as the stars so we apply the same trick with :contains. Since we want multiple actors, we store them
    # as an array so we call the .map method that returns us an array of all the actors. The .uniq method makes sure that there are no duplicates in the array
    {
        title: title,
        director: director,
        year: year,
        storyline: storyline,
        cast: cast
    }
end


# {
#     cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
#     director: "Christopher Nolan",
#     storyline: "When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham. The Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
#     title: "The Dark Knight",
#     year: 2008
#   }
# CSS SELECTORS

# Class => ".titleColumn"
# ID => "#logo"
# HTML Tag => "h1"