import 'package:flutter/material.dart';

class DropdownButtonProvider extends ChangeNotifier{
  String selectedOption = '';
  List<String> options = [];

  void setSelectedOption(String option) {
    selectedOption = option;
    notifyListeners();
  }

  void updateDropdown() {
    notifyListeners();
  }
}