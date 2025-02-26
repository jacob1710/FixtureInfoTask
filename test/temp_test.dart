import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Counter value should be incremented', () {

    var x = 1;
    x++;

    expect(x, 2);
  });
}