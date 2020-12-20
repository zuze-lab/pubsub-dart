import 'package:pubsub/main.dart';

typedef StateSetterFunction<T> = T Function(T arg);

class State<T> extends PubSub<T> {
  T _state;

  State({T state}) {
    _state = state;
  }

  T getState() => _state;

  void setState(StateSetterFunction<T> setter) {
    _state = setter(_state);

    publish(_state);
  }

  @override
  Unsubscribe subscribe(subscriber) {
    subscriber(_state);
    return super.subscribe(subscriber);
  }
}

State<T> createState<T>({T state}) => State(state: state);
