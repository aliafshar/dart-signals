// Copyright (c) 2012, Google Inc
// Author: afshar@google.com (Ali Afshar)

// Simple signals for Dart.

library signals;

/**
 * The type of a callback.
 */
typedef void Callback(dynamic arg);


/**
 * A Signal that can be subscribed to and emitted.
 *
 * For example:
 *
 *     var s = new Signal();
 *     s.on((arg) => print('Emitted signal with arg: $arg'));
 */
class Signal {

  final List<Callback> subscriptions = <Callback>[];

  /**
   * Emits the signal by calling all subscribers with the given argument.
   */
  emit(dynamic argument) => subscriptions.forEach((s) => s(argument));

  /**
   * Connects a callback to this signal.
   */
  on(Callback callback) => subscriptions.add(callback);

}