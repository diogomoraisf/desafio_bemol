// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension FavoritesStateStatusMatch on FavoritesStateStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error}) {
    final v = this;
    if (v == FavoritesStateStatus.initial) {
      return initial();
    }

    if (v == FavoritesStateStatus.loading) {
      return loading();
    }

    if (v == FavoritesStateStatus.loaded) {
      return loaded();
    }

    if (v == FavoritesStateStatus.error) {
      return error();
    }

    throw Exception(
        'FavoritesStateStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error}) {
    final v = this;
    if (v == FavoritesStateStatus.initial && initial != null) {
      return initial();
    }

    if (v == FavoritesStateStatus.loading && loading != null) {
      return loading();
    }

    if (v == FavoritesStateStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == FavoritesStateStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
