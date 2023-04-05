import 'package:uuid/uuid.dart';

class UUIDGenerator {
  static const _uuid = Uuid();

  static String generateUUID() {
    return _uuid.v4();
  }
}
