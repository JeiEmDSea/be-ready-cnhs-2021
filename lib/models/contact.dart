class Contact {
  late String title;
  late String number;
  late String name;
  final String iconPath;
  late bool removable;

  Contact({
    required this.title,
    required this.number,
    required this.name,
    this.iconPath = 'assets/images/default_logo.png',
    this.removable = false,
  });
}
