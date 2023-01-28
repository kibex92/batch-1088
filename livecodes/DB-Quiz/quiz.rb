# 1 .What’s the SQL query to get books written before 1985?
# SELECT * FROM books WHERE year < 1985

# 2. What’s the SQL query to get the 3 most recent books written by Jules Verne?
# SELECT * FROM books JOIN authors ON authors.id = books.author_id WHERE authors.name = "Jules Verne" ORDER BY year DESC LIMIT 3

# class CreateAuthors < ActiveRecord::Migration[7.0]
#     def change
#       create_table :authors do |t|
#         t.string :name
#         t.timestamps
#       end
#     end
#   end
  
# class CreateBooks < ActiveRecord::Migration[7.0]
#     def change
#       create_table :books do |t|
#         t.string :title
#         t.integer :year
#         t.references :author, foreign_key: true
#         t.timestamps
#       end
#     end
#    end
   

# class CreateUsers < ActiveRecord::Migration[7.0]
#     def change
#       create_table :users do |t|
#         t.string :email
#         t.timestamps
#       end
#     end
#   end

# class CreateReadings < ActiveRecord::Migration[7.0]
#     def change
#       create_table :readings do |t|
#         t.references :book, foreign_key: true
#         t.references :user, foreign_key: true
#         t.date :date
#         t.timestamps
#         end
#     end
#   end

# class AddCategoryToBooks < ActiveRecord::Migration[7.0]
#     def change
#       add_column :books, :category, :string
#     end
#   end

# ACTIVE RECORD METHODS
#1. Add your favorite author to the DB
Author.create(name: "Emile Zola")
# Alternatively
zola = Author.new(name: "Emile Zola")
zola.save
#2. Get all authors
Author.all
#3. Get author with id=8
Author.find(8)
#4. Get author with name="Jules Verne", store it in a variable: jules
jules = Author.find_by(name: "Jules Verne") # -> Returns ONE Instance of Author
jules = Author.where(name: "Jules Verne") # -> Returns an ARRAY of Author Instances
jules = Author.find_by_name("Jules Verne")

#5. Get Jules Verne's books
jules.books # -> Array of J. Vernes Book Instances
#6. Create a new book "20000 Leagues under the Seas". Store it in a variable: twenty_thousand
twenty_thousand = Book.new(title: "20000 Leagues under the Seas", year: 1878)
#7. Add Jules Verne as this book's author
twenty_thousand.author = jules
#8. Now save this book in the DB!
twenty_thousand.save!


  