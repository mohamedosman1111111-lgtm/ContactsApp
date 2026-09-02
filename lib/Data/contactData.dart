class Contact {
  final String name;
  final String email;
  final String phone;
  final String? imagePath;   // ? يعني ممكن يبقى فاضي دلوقتي

  Contact({
    required this.name,
    required this.email,
    required this.phone,
    this.imagePath,
  });
}