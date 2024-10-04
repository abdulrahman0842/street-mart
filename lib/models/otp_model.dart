class OTPModel {
  final String email;
  final String otp;
  OTPModel(this.email,this.otp);

  Map<String, dynamic> toJson() {
    return {'email': email, 'otp': otp};
  }
}
