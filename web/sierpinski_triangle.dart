library sierpinski_triangle;

import 'dart:html';

part 'sierpinski_algo.dart';

void main() {
  CanvasElement canvas = query("#sierpinski");
  
  query('#btnGo').onClick.listen((e){
    InputElement inputEl = document.query('#txtIterations');
    int intIter = int.parse(inputEl.value);
    if (validateIterations()) {
      Sierpinski triangle = new Sierpinski(canvas, intIter);
    }
  });
}

bool validateIterations() {
  InputElement nbrIter = document.query('#txtIterations');
  int intIter = int.parse(nbrIter.value);
  if (intIter > 0 && intIter < 11) {
    return true;
  } else {
    window.alert("You must enter a number between 1 and 10.");
    return false;
  }
}
