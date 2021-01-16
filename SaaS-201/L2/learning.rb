# # Problem 1. Fill-in the following code

# def salute(name, salutation)
#     return "#{salutation.capitalize} Mr. #{name.split(" ")[-1]}"
# end

# puts salute("Nelson Rolihlahla Mandela", "hello")
# puts salute("Sir Alan Turing", "welcome")

# # Problem 2. Given this list of todos, create a Hash keyed by category, whose value is an array containing all the todos in that category. The keys of the Hash must be a symbol.
# todos = [
#   ["Send invoice", "money"],
#   ["Clean room", "organize"],
#   ["Pay rent", "money"],
#   ["Arrange books", "organize"],
#   ["Pay taxes", "money"],
#   ["Buy groceries", "food"]
# ]

# todos_hash = {}
# todos.each {|todo|
#     if todos_hash.keys.find {|key| key == todo[1]} == nil
#         todos_hash[todo[1]]= [todo[0]]
#     else
#         todos_hash[todo[1]].push(todo[0])
#     end
# }

# puts todos_hash

# # Problem 1. Given two arrays books and authors, merge them into a single Hash. The keys of the Hash must be the lower-cased firstname of the authors, and must be symbols.
# books = ["Design as Art", "Anathem", "Shogun"]
# authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]

# auth_books = {}
# authors.each.with_index {|author, i| auth_books[author.split(" ")[0].downcase.to_sym] = books[i]}

# puts auth_books

# # Problem 3. Print the given list of todos by category. (You haven't learned Hashes yet, so use only arrays.)
# todos = [
#   ["Send invoice", "money"],
#   ["Clean room", "organize"],
#   ["Pay rent", "money"],
#   ["Arrange books", "organize"],
#   ["Pay taxes", "money"],
#   ["Buy groceries", "food"]
# ]

# todos_catagories = []
# todos.each { |todo|

#     if todos_catagories.find {|category| category[0] == todo[1]} == nil
#         todos_catagories.push([todo[1], [todo[0]]])
#     else
#         todos_catagories.each {|category|
#             if category[0] == todo[1]
#                 category[1].push(todo[0])
#             end
#         }
#     end
# }

# todos_catagories.each { |category|
#     puts category[0]
#     category[1].each {|todo| puts "  #{todo}"}
# }

# # Problem 2. Given two arrays books and authors, merge them and print who wrote which book.
# books = ["Design as Art", "Anathem", "Shogun"]
# authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]

# books.map.with_index {
#     |book, i| puts("#{book} was written by #{authors[i]}")
# }

# # Problem 1. Given a nested array of first names and last names, return a new array with the full names.
# names = [["Jhumpa", "Lahiri"], ["J. K", "Rowling"], ["Devdutt", "Pattanaik"]];

# new_names = names.map {
#     |name| name.join(" ")
# }

# puts new_names
