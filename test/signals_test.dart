// Copyright (c) 2012, Google Inc
// Author: afshar@google.com (Ali Afshar)

// Tests for signals.

import 'package:unittest/unittest.dart';
import 'package:signals/signals.dart';

void main() {


  group('Signal.', () {

    test('Subscribe', () {
      var s = new Signal();
      expect(s.subscriptions.length, equals(0));
      s.on((dynamic argument) => null);
      expect(s.subscriptions.length, equals(1));
    });

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

    test('Results.', () {
      var s = new Signal();
      s.on((argument) => new Future.immediate(2));
      s.on((argument) => new Future.immediate(1));
      s.emit(null).then((results) =>  expect(results, equals([2, 1])));
    });

    test('Non-future results.', () {
      var s = new Signal();
      s.on((argument) => 2);
      s.on((argument) => 1);
      s.emit(null).then((results) =>  expect(results, equals([2, 1])));
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
