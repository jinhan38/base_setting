import 'package:logger/logger.dart';

class Logging {
  static final Logger _logger = Logger();

  static d(dynamic log) {
    return _logger.d(log.toString());
  }

  static e(dynamic log) {
    return _logger.e(log);
  }
}
