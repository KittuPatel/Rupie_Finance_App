import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/10001.png',
    title: 'A Cool Way to Get Start',
    description: 'Maecenas eu viverra orci. Duis diam leo, porta at justo vitae, euismod aliquam nulla.',
  ),
  Slide(
    imageUrl: 'assets/images/10002.png',
    title: 'Design Interactive App UI',
    description: 'Maecenas eu viverra orci. Duis diam leo, porta at justo vitae, euismod aliquam nulla.',
  ),
  Slide(
    imageUrl: 'assets/images/10003.png',
    title: 'It\'s Just the Beginning',
    description: 'Donec dapibus tincidunt bibendum. Maecenas eu viverra orci. porta at justo vitae, euismod aliquam nulla.',
  ),
];