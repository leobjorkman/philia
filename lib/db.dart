import 'package:flutter/cupertino.dart';

class DB {
  Map<String, List> questions = new Map();
  DB(){
    questions["Ethics"] = [
      "What should be the goal of humanity?",
      "What is effective altruism?",
      "Is free will real or just an illusion?",
      "Where is the line between art and not art?",
      "What does it mean to live a good life?",
      "Another question to test something",
      "The third one's going here"
    ];
    questions["Morals"] = [
      "2 What should be the goal of humanity?",
      "2 What is effective altruism?",
      "2 Is free will real or just an illusion?",
      "2 Where is the line between art and not art?",
      "2 What does it mean to live a good life?",
      "2 Another question to test something",
      "2 The third one's going here"
    ];
  }
}