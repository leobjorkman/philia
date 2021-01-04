import 'package:flutter/cupertino.dart';

class DB {
  Map<String, List> questions = new Map();
  Map<String, List> summaries = new Map();
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

    summaries["Ethics"] = [
      "Humanity’s goal is to realize what’s known as the principle of universality."
          " It requires connecting with this goal. It requires waking up to the "
          "realization that happiness is not external but internal. "
          "It is to stop worrying since we all realize that humans – jus"
          "t as is the case with other living things – will eventually vanish.Humanity’s goal is to realize what’s known as the principle of universality."
          " It requires connecting with this goal. It requires waking up to the "
          "realization that happiness is not external but internal. "
          "It is to stop worrying since we all realize that humans – jus"
          "t as is the case with other living things – will eventually vanish.Humanity’s goal is to realize what’s known as the principle of universality."
          " It requires connecting with this goal. It requires waking up to the "
          "realization that happiness is not external but internal. "
          "It is to stop worrying since we all realize that humans – jus"
          "t as is the case with other living things – will eventually vanish.",
      "What is effective altruism?",
      "Is free will real or just an illusion?",
      "Where is the line between art and not art?",
      "What does it mean to live a good life?",
      "Another question to test something",
      "The third one's going here"
    ];
    summaries["Morals"] = [
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