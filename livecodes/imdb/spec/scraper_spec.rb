require_relative "../scraper"

describe "#fetch_movie_urls" do
    it "should return an array of urls" do
        urls =  [
            "https://www.imdb.com/title/tt0111161/",
            "https://www.imdb.com/title/tt0068646/",
            "https://www.imdb.com/title/tt0468569/",
            "https://www.imdb.com/title/tt0071562/",
            "https://www.imdb.com/title/tt0050083/"
          ]
        actual = fetch_movie_urls
        expect(actual).to eq(urls)
    end
end

describe "#fetch_movie" do
    it "should return a hash with movie infos" do
        url = "https://www.imdb.com/title/tt0468569/?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=1a264172-ae11-42e4-8ef7-7fed1973bb8f&pf_rd_r=X61KV70D0F3Z25Q781AP&pf_rd_s=center-1&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_tt_3"
        actual = fetch_movie(url)

        movie = {
            cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
            director: "Christopher Nolan",
            storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
            title: "The Dark Knight",
            year: 2008
          }
         expect(actual).to eq(movie)
    end
end