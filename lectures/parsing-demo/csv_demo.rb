require "csv"

# TODO - let's read/write data from beatles.csv
filepath = "data/musicians.csv"

# PARSING CSV

# CSV.foreach(filepath, headers: :first_row, header_converters: :symbol) do |row|
#     f_name = row[:first_name]
#     l_name = row[:last_name]
#     instrument = row[:instrument]
#     musician = "#{f_name} #{l_name}"

#     puts "#{musician} played #{instrument}"
# end

# STORING CSV

musicians = [
    {
        first_name: "Boris", last_name: "Knezevic", instrument: "Piano"
    },
    {
        first_name: "James", last_name: "Brown", instrument: "Voice"
    },
    {
        first_name: "Omar", last_name: "Khairat", instrument: "Piano"
    }
]

CSV.open(filepath, "wb") do |csv|
    csv << ["First Name", "Last Name", "Instrument"]
    musicians.each do |musician|
        csv << [musician[:first_name], musician[:last_name], musician[:instrument]]
    end
end
