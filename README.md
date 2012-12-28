Signals
=======

Simple signals for Dart.

[![](https://drone.io/aliafshar/Signals/status.png)](https://drone.io/aliafshar/Signals/latest)

For example:

    var s = new Signal();
 	s.on((arg) => print('Emitted signal with arg: $arg'));
 	s.emit(1)

	> Emitted signal with arg: 1
 	