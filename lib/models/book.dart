// ignore_for_file: public_member_api_docs, sort_constructors_first
class Book {
  final String title;
  final String description;
  final String category;
  Book({
    required this.title,
    required this.description,
    required this.category,
  });
}

var allBooks = [
  Book(
      title: "Ayam Goreng",
      description: "Ayam Goreng Sedap",
      category: "Goreng"),
  Book(
      title: "Ayam Goreng A",
      description: "Ayam Goreng Sedap",
      category: "Goreng"),
  Book(
      title: "Ayam Sambal",
      description: "Ayam Sambal Sedap",
      category: "Sambal"),
  Book(
      title: "Ayam Sambal Pedas",
      description: "Ayam Sambal Sedap",
      category: "Goreng"),
  Book(
      title: "Ayam Blackpepper",
      description: "Ayam Blackpepper Sedap",
      category: "Blackpepper"),
];
