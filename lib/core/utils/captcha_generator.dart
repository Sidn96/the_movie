import 'dart:math';

String generateCaptcha() {
  // Letter from which we want to generate the captach
  // We have taken A to Z all small nand caps
  // letters along with numbers
  // You can change this as per your convience
  const letters =
      "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
  const length = 6;

  // Length of Captcha to be generated
  final random = Random();

  // Select random letters from above list
  final randomString = String.fromCharCodes(List.generate(
      length, (index) => letters.codeUnitAt(random.nextInt(letters.length))));

  return randomString;
}
