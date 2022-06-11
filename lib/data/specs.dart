import 'package:otp/otp.dart';

class User {
  final String userId;
  final String name;
  final String issuer;
  final String secret;
  final int keySize;

  const User({
    required this.name,
    required this.userId,
    required this.issuer,
    required this.secret,
    required this.keySize,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        userId: json['userId'],
        name: json['name'],
        issuer: json['issuer'],
        secret: json['secret'],
        keySize: json['keySize']);
  }

  factory User.parse(String from) {
    // RegExp re = RegExp(
    //     r'/^otpauth:\/\/[t|h]otp\/([^:]*)[:]?([^\?]*)\?([\s|\S]+)$/',
    //     caseSensitive: false);
    try {
      final uri = Uri.parse("abc:");
      print(
          'uri: ${uri.scheme} ${uri.host} ${uri.pathSegments[0]} ${uri.queryParameters['secret']}');
      // final match = re.firstMatch(from);
      // if (match != null) {
      //   // if (match.group(2))
      //   print(match.toString());
      //   return const User(
      //       name: '', userId: '', issuer: '', secret: '', keySize: 8);
      // } else {
      //   print(match.toString());
      return const User(
          name: '', userId: '', issuer: '', secret: '', keySize: 8);
      // }
    } catch (e) {
      print(e.toString());
      return const User(
          name: '', userId: '', issuer: '', secret: '', keySize: 8);
    }
  }

  String update() {
    return OTP.generateTOTPCodeString(
        secret, DateTime.now().millisecondsSinceEpoch,
        algorithm: Algorithm.SHA1, isGoogle: true);
  }

  @override
  String toString() {
    return "otpauth://topt/$issuer:$name?secret=$secret";
  }
}
