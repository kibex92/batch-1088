require "json"

# PARSING JSON
# filepath = "data/beatles.json"

# serialized_beatles = File.read(filepath)
# beatles = JSON.parse(serialized_beatles)

# beatles["beatles"][2]["first_name"]
#  # Hash    # Array    # Hash 

# STORING JSON

filepath = "data/musicians.json"

musicians = { musicians: [
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
}

File.open(filepath, "wb") do |file|
    file.write(JSON.pretty_generate(musicians))
end