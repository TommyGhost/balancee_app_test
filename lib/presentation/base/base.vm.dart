import 'package:flutter/cupertino.dart';

import '../../data/core/view_state.dart';
import '../../data/repository/user_repository.dart';
import '../../data/services/navigation_service.dart';
import '../../locator.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _viewState = ViewState.Idle;
  String? errorMessage;
  NavigationService navigationService = getIt<NavigationService>();
  UserRepository userRepository = getIt<UserRepository>();

  ViewState get viewState => _viewState;

  set viewState(ViewState newState) {
    _viewState = newState;
    notifyListeners();
  }

  void setError(String? error) {
    errorMessage = error;
    notifyListeners();
  }

  bool isLoading = false;
  bool isScreenLoading = false;

  void startLoader() {
    if (!isLoading) {
      isLoading = true;
      viewState = ViewState.Loading;
      notifyListeners();
    }
  }

  void stopLoader() {
    if (isLoading) {
      isLoading = false;
      viewState = ViewState.Loading;
      notifyListeners();
    }
  }

  void startScreenLoader() {
    if (!isScreenLoading) {
      isScreenLoading = true;
      viewState = ViewState.Loading;
      notifyListeners();
    }
  }

  void stopScreenLoader() {
    if (isScreenLoading) {
      isScreenLoading = false;
      viewState = ViewState.Loading;
      notifyListeners();
    }
  }
}

class LoadBaseViewModel extends ChangeNotifier {
  ViewState _viewState = ViewState.Idle;
  String? errorMessage;
  NavigationService navigationService = getIt<NavigationService>();
  UserRepository userRepository = getIt<UserRepository>();

  ViewState get viewState => _viewState;

  set viewState(ViewState newState) {
    _viewState = newState;
    notifyListeners();
  }

  void setError(String? error) {
    errorMessage = error;
    notifyListeners();
  }

  bool isLoading = false;
  bool isScreenLoading = false;

  void startLoader() {
    if (!isLoading) {
      isLoading = true;
      viewState = ViewState.Loading;
      notifyListeners();
    }
  }

  void stopLoader() {
    if (isLoading) {
      isLoading = false;
      viewState = ViewState.Loading;
      notifyListeners();
    }
  }

  void startScreenLoader() {
    if (!isScreenLoading) {
      isScreenLoading = true;
      viewState = ViewState.Loading;
      notifyListeners();
    }
  }

  void stopScreenLoader() {
    if (isScreenLoading) {
      isScreenLoading = false;
      viewState = ViewState.Loading;
      notifyListeners();
    }
  }

}
