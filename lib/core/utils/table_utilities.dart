import 'package:flutter/widgets.dart';

void deleteTableRow<T>(int index, ValueNotifier<List<T>> listState) {
  final newList = List<T>.from(listState.value);
  newList.removeAt(index);
  listState.value = newList;
}
