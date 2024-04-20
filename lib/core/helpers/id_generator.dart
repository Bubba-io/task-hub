import 'dart:math';

String idGenerator() {
  final random = Random();
  const keys = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final buffer = StringBuffer();

  for (var i = 0; i < 12; i++) {
    buffer.write(keys[random.nextInt(keys.length)]);
  }

  return buffer.toString();
}
