class Contact {
  final String name;
  final String photo;
  final String cellphone;
  final String email;
  bool isFavorite;

  Contact({
    required this.name,
    required this.photo,
    required this.cellphone,
    required this.email,
    this.isFavorite = false,
  });
}
