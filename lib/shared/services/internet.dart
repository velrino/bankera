import 'dart:io';

class InternetService {
  Future<bool> check() async {
    bool have = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        have = true;
      }
    } on SocketException catch (_) {
      have = false;
    }
    return have;
  }
}
