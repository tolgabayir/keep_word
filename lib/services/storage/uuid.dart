import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:uuid/uuid.dart';

class IdGenerator extends GetxService {
  static final Uuid _uuid = const Uuid();

  String getId() {
    return _uuid.v4();
  }
}
