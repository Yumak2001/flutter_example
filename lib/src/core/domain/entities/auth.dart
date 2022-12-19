class AuthDomain {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  AuthDomain({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
  });
}
