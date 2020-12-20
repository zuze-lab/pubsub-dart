import 'package:pubsub/operators/types.dart';

OperatorReturningFn<T, R> map<T, R>(R Function(T) fn) =>
    (next) => (arg) => next(fn(arg));
