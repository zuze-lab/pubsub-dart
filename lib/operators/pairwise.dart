import 'package:pubsub/operators/types.dart';
import './stack.dart';

OperatorReturningFn<T, List<T>> pairwise<T>() => stack(min: 2, max: 2);
