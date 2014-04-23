=begin 
	Use object-oriented Ruby to model a public library (w/ three classes: Library, Shelf, & Book). 
	The library should be aware of a number of shelves. Each shelf should know what books it contains. 
	Make the book object have "enshelf" and "unshelf" 
	methods that control what shelf the book is sitting on. 
	The library should have a method to report all books it contains.
=end

class Library
	attr_accessor :shelves

	def initialize shelves
		@shelves = shelves
	end
	
	def display_books
		puts "All available books in the library: "
		@shelves.each do |shelf|
			shelf.list_books
		end
	end
end

class Shelf
	attr_reader :books
	
	def initialize
		@books = []
	end
	
	def add_book(book)
		@books << book
	end
	
	def remove_book(book)
		@books.delete(book)
	end

	def list_books
		@books.each do |book|
			puts book
		end
	end
end

class Book
	attr_accessor :title
	
	def initialize title
		@title = title
	end
	
	def to_s
		"#{@title}"
	end
	
	def enshelf(shelf)
		shelf.add_book(self)
		@shelf = shelf
	end
	
	def unshelf()
		@shelf.remove_book(self)
	end
end


#Testing our code

#Create some shelves
shelf_scifi = Shelf.new
shelf_fantasy = Shelf.new

#Create some books
book1 = Book.new("The Alchemist")
book2 = Book.new("Pillars of the Earth")
book3 = Book.new("War of the Worlds")
book4 = Book.new("Ender's Game")

#Put books on the shelves
book1.enshelf(shelf_fantasy)
book2.enshelf(shelf_fantasy)
book3.enshelf(shelf_scifi)
book4.enshelf(shelf_scifi)

#Let's check our shelves
shelf_fantasy.list_books
puts
shelf_scifi.list_books
puts

#Unshelve some books
book2.unshelf()
book3.unshelf()

#Let's check our shelves again
shelf_fantasy.list_books
puts
shelf_scifi.list_books
puts

#Add shelves to a library and display all books in library (shelved books).
test_library = Library.new([shelf_scifi, shelf_fantasy])
test_library.display_books
