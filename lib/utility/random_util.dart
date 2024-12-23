import 'dart:math';

String generateRandomId(int length) {
  final random = Random();
  const characters =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

  String id = '';
  for (int i = 0; i < length; i++) {
    final randomIndex = random.nextInt(characters.length);
    id += characters[randomIndex];
  }

  final timestamp = DateTime.now().millisecondsSinceEpoch;
  final uniqueId = '$id-$timestamp';

  return uniqueId;
}
