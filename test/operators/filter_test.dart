import 'package:pubsub/operators.dart';
import 'package:test/test.dart';

void main() {
  test('should work', () {
    var f = pipe(filter((int a) => a > 10), map((a) => a * 10), tap(print));
    print(f(11));
  });
}
