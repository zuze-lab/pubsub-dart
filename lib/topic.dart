import 'package:meta/meta.dart';
import './pubsub.dart';

typedef TopicMatcher = bool Function(String topicA, String topicB);

var _identityMatcher = (String a, String b) => a == b;

class TopicPubSub<Topics> {
  TopicMatcher _matcher;
  final Map<String, Set<Subscriber>> _subscribers = {};
  final Map<String, dynamic> _cache = {};

  TopicPubSub({TopicMatcher matcher}) {
    _matcher = matcher ?? _identityMatcher;
  }

  void publish({@required String topic, @required dynamic data, bool retain}) {
    if (retain) _cache[topic] = data;
    _subscribers.forEach((t, subscribers) {
      if (_matcher(topic, t)) subscribers.forEach((s) => s(data));
    });
  }

  Unsubscribe subscribe(String topic, Subscriber subscriber) {
    _cache.forEach((t, message) {
      if (_matcher(t, topic)) subscriber(message);
    });

    _subscribers.update(topic, (value) {
      var set = value ?? {};
      set.add(subscriber);
      return set;
    });

    return () {
      _subscribers.update(topic, (value) {
        value?.remove(subscriber);
        return value;
      });
    };
  }
}

TopicPubSub<T> createTopicPubSub<T>({TopicMatcher matcher}) =>
    TopicPubSub<T>(matcher: matcher);
