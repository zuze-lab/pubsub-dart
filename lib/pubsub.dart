typedef Unsubscribe = void Function();
typedef Subscriber<T> = void Function(T arg);

class PubSub<T> {
  final _subscribers = <Subscriber<T>>{};

  void publish(T arg) => _subscribers.forEach((s) => s(arg));

  Unsubscribe subscribe(Subscriber<T> subscriber) {
    _subscribers.add(subscriber);
    return () => _subscribers.remove(subscriber);
  }
}

PubSub<T> createPubSub<T>() => PubSub();
