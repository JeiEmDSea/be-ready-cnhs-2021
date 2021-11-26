class Contact {
  final String title;
  final int number;
  final String name;
  final String iconPath;

  Contact({
    required this.title,
    required this.number,
    required this.name,
    this.iconPath = 'assets/images/default_logo.png',
  });
}
