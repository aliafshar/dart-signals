// Copyright (c) 2012, Google Inc
// Author: afshar@google.com (Ali Afshar)

// Tests for signals.

import 'dart:async';
import 'package:unittest/unittest.dart';
import 'package:signals/signals.dart';

void main() {


  group('Signal.', () {



    test('Emit.', () {
      var args = <int>[];
      var s = new Signal();
      s.on((argument) => args.add(argument));
      expect(args.length, equals(0));
      s.emit(100);
      expect(args[0], equals(100));
    });

    test('Emit order.', () {
      var args = <int>[];
      var s = new Signal();
      s.on((argument) => args.add(1));
      s.on((argument) => args.add(2));
      s.on((argument) => args.add(3));
      s.on((argument) => args.add(4));
      s.emit(null);
      expect(args, equals([1, 2, 3, 4]));
    });

    test('Call interface.', () {
      var args = <int>[];
      var s = new Signal();
      s((argument) => args.add(1));
      s.emit(null);
      expect(args, equals([1]));
    });

  });
}
