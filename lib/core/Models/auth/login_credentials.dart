class LoginCredentials {
  final String identifier;
  final String password;

  LoginCredentials(this.identifier, this.password);

  Map<String, String> toJson() {
    return {'usr': this.identifier, 'pwd': this.password};
  }
}
