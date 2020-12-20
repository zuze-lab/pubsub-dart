import 'package:pubsub/main.dart';
import 'package:test/test.dart';

void main() {
  test('createState should return state', () {
    expect(createState(), isA<State>());
  });

  test(
      'createState with an initial argument should return state with initial state',
      () {
    var s = createState(state: 'bill');
    expect(s, isA<State>());
    expect(s.getState(), equals('bill'));
  });

  test('it should change state', () {
    var s = createState();
    expect(s.getState(), isNull);
    s.setState((arg) => 'joe');
    expect(s.getState(), equals('joe'));
  });

  test('it should call the subscriber with the current state', () {
    var results = [];
    var s = createState(state: 'joe');
    var subscriber = (a) => results.add(a);
    s.subscribe(subscriber);

    expect(results, contains('joe'));
  });

  test('it should call the subscriber with the updated state', () {
    var results = [];
    var s = createState(state: 'joe');
    var subscriber = (a) => results.add(a);
    s.subscribe(subscriber);
    s.setState((arg) => 'bill');

    expect(results, contains('bill'));
  });

  test('it should unsubscribe', () {
    var results = [];
    var s = createState(state: 'joe');
    var subscriber = (a) => results.add(a);
    var unsub = s.subscribe(subscriber);
    unsub();
    s.setState((arg) => 'bill');

    expect(results, isNot(contains('bill')));
  });
}
