import 'package:pubsub/main.dart';
import 'package:test/test.dart';

void main() {
  test('createPubSub should return a pubsub', () {
    expect(createPubSub(), isA<PubSub>());
  });

  test('should publish', () {
    var p = createPubSub();
    expect(() => p.publish('joe'), returnsNormally);
  });

  test('it should subscribe', () {
    var p = createPubSub();
    Subscriber t = (a) => {};
    expect(() => p.subscribe(t), returnsNormally);
  });

  test('it should call the subscriber', () {
    var s = [];
    Subscriber t = (arg) {
      s.add(arg);
    };
    var p = createPubSub();
    p.subscribe(t);
    p.publish('joe');
    expect(s, contains('joe'));
  });

  test('it should unsubscribe', () {
    var s = [];
    Subscriber t = (arg) {
      s.add(arg);
    };
    var p = createPubSub();
    var unsub = p.subscribe(t);
    unsub();
    p.publish('joe');
    expect(s, hasLength(0));
  });
}
