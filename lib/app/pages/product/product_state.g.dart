// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension ProductStateStatusMatch on ProductStateStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error}) {
    final v = this;
    if (v == ProductStateStatus.initial) {
      return initial();
    }

    if (v == ProductStateStatus.loading) {
      return loading();
    }

    if (v == ProductStateStatus.loaded) {
      return loaded();
    }

    if (v == ProductStateStatus.error) {
      return error();
    }

    throw Exception(
        'ProductStateStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error}) {
    final v = this;
    if (v == ProductStateStatus.initial && initial != null) {
      return initial();
    }

    if (v == ProductStateStatus.loading && loading != null) {
      return loading();
    }

    if (v == ProductStateStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == ProductStateStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
