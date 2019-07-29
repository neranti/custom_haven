class AuthService {
  Future<void> logout() async {
    return await new Future<void>.delayed(
      new Duration(
        seconds: 1
      )
    );
  }
}