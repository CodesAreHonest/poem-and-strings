import "package:flutter/material.dart";
import "package:redux/redux.dart";
import "package:poem_and_strings/store.dart";
import "package:poem_and_strings/reducers/app_state_reducer.dart";
import "package:poem_and_strings/models/app_state.dart";

main() {
  runApp(ReduxStore(store: Store<AppState>(appReducer, initialState: AppState())));
}
