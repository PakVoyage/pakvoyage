import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TourProvider with ChangeNotifier {
  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;

  String? _formattedDate;
  String? get formattedDate => _formattedDate;

  void selectDate(DateTime newDate) {
    _selectedDate = newDate;
    _formattedDate = DateFormat('dd MMM yyyy').format(_selectedDate!);
    notifyListeners();
  }

  showPicker1(context) {
    // Show the CalendarDatePicker and handle the selected date
    return showDatePicker(
      barrierColor: Colors.transparent,
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark(), // Use the light theme
          child: child!,
        );
      },
    ).then((DateTime? value) {
      // Update the selected date when a date is selected

      if (value != null) {
        selectDate(value);
      }
    });
  }

  // Tour Price
  int? _tourPrice;
  int? get tourPrice => _tourPrice;

  void getTotal(int price, int members) {
    _tourPrice = price * members;

    notifyListeners();
  }
}
