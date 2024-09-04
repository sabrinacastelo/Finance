// import 'package:flutter/material.dart';
// import 'home_state.dart';

// class HomeController extends ChangeNotifier {
//   HomeController()  

 

//   HomeState _state = HomeStateInitial();

//   HomeState get state => _state;


//   late PageController _pageController;
//   PageController get pageController => _pageController;

  

//   set setPageController(PageController newPageController) {
//     _pageController = newPageController;
//   }

//   void _changeState(HomeState newState) {
//     _state = newState;
//     notifyListeners();
//   }


//   Future<void> getUserData() async {
//     _changeState(HomeStateLoading());
//     final result = await _userDataService.getUserData();

//     result.fold(
//       (error) => _changeState(HomeStateError(message: error.message)),
//       (data) => _changeState(HomeStateSuccess()),
//     );
//   }
// }