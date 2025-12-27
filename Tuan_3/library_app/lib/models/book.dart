class Book {
  final String name;
  bool isBorrowed;

  Book({required this.name, this.isBorrowed = false});

  void toggleBorrow() {
    isBorrowed = !isBorrowed;
  }
}
