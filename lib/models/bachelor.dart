enum Gender {
  Male,
  Female,
}

class Bachelor {
  final String firstname;
  final String lastname;
  final Gender gender;
  final String avatar;
  final List<Gender> searchFor;
  final String job;
  final String description;

  Bachelor({
    required this.firstname,
    required this.lastname,
    required this.gender,
    required this.avatar,
    required this.searchFor,
    required this.job,
    required this.description,
  });
}
