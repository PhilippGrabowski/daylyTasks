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

  void printInfo() {
    print('Titel des Buches: ${this.title}, Seitenanzahl: ${this.pageNumber} und Name des Autors ist ${this.author.name}.');
  }
}

void main(List<String> args) {
  Author author = Author(name: 'J. K. Rowling', yearOfBirth: '1975');
  Book book = Book(title: 'Harry Potter', pageNumber: 800, author: author);

  book.printInfo();
}