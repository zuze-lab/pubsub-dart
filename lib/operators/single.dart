import 'package:pubsub/operators/types.dart';
import './take.dart';

OperatorReturningFn<T, T> single<T>() => take(1);
