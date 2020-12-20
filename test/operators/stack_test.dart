import 'package:pubsub/operators.dart';
import 'package:test/test.dart';

void main() {
  test('should work', () {
    var f = pipe(distinctUntilChanged(), tap(print));
    f(10);
    f(11);
    f(11);
    f(10);
    f(10);
    f(12);
  });
}
