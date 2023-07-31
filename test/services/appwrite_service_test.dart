import 'package:flutter_test/flutter_test.dart';
import 'package:gitverse/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AppwriteServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
