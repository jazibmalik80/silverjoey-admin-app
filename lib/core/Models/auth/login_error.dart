class LoginError {
  late final String message;
  late final String exc;

  LoginError({required this.message, required this.exc});

  LoginError.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    exc = json['exc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['exc'] = this.exc;
    return data;
  }
}
