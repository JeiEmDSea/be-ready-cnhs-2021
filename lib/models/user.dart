class User {
  String firstName;
  String lastName;
  String location;

  User(
      {required this.firstName,
      required this.lastName,
      this.location = 'Tuguegarao City'});
}
