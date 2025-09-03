class Author {
  final String name;
  final String yearOfBirth;

  Author({required this.name, required this.yearOfBirth});
}

class Book {
  final String title;
  final int pageNumber;
  final Author author;

  Book({required this.title, required this.pageNumber, required this.author});
}

void main(List<String> args) {
  Author author = Author(name: 'J. K. Rowling', yearOfBirth: '1975');
  Book book = Book(title: 'Harry Potter', pageNumber: 800, author: author);

  print('Titel des Buches: ${book.title}, Seitenanzahl: ${book.pageNumber} und Name des Autors ist ${book.author}');
}