class User {
  final String name;
  final String email;
  final String password;
  final String teamName;
  final List<String> members;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.teamName,
    required this.members,
  });

  // Factory method to create a User from a Map (for signup)
  factory User.fromSignup({
    required String name,
    required String email,
    required String password,
    required String teamName,
    required List<String> members,
  }) {
    return User(
      name: name,
      email: email,
      password: password,
      teamName: teamName,
      members: members,
    );
  }

  // Factory method to create a User from a Map (for login)
  factory User.fromLogin({
    required String email,
    required String password,
  }) {
    // In a real application, you might want to validate the email and password here
    return User(
      name: '',
      email: email,
      password: password,
      teamName: '',
      members: [],
    );
  }

  // Method to convert a User to a Map (for signup)
  Map<String, dynamic> toSignupMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'teamName': teamName,
      'members': members,
    };
  }

  // Method to convert a User to a Map (for login)
  Map<String, dynamic> toLoginMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}
