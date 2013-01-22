// Copyright (c) 2012, Google Inc
// Author: afshar@google.com (Ali Afshar)

// Simple signals for Dart.

library signals;
import 'dart:async';


/**
 * The type definition of a callback.
 */
typedef dynamic Callback(dynamic arg);


/**
 * A Signal that can be subscribed to and emitted.
 *
 * This functionality is entirely replaced by using dart:async [StreamController],
 *
 * For example:
 *
 *     var s = new Signal();
 *     s.on((arg) => print('Emitted signal with arg: $arg'));
 *     s.emit(1)
 *
 *     > Emitted signal with arg: 1
 *
 *
 */
class Signal<T> {

  StreamController _stream = new StreamController();

  /**
   * Emits the signal by calling all subscribers with the given argument.
   *
   * The return value is a future which will fire with a list of results from
   * all signal handlers.
   */
  emit(dynamic argument) => _stream.add(argument);

  /**
   * Connects a callback to this signal.
   */
  on(Callback callback) => _stream.listen(callback);

  call(arg) => on(arg);

}