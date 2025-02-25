import 'package:flutter/foundation.dart';
import 'registration.dart';

class RegistrationProvider extends ChangeNotifier { // ใช้ ChangeNotifier ที่นี่
  List<Registration> registrations = [];

  void addRegistration(Registration registration) {
    registrations.add(registration);
    notifyListeners();
  }

  List<Registration> getRegistrations() {
    return registrations;
  }
}
