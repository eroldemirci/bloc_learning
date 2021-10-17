import 'package:flutter/material.dart';

class HavaDurumuSicaklik extends StatelessWidget {
  HavaDurumuSicaklik({
    Key? key,
    this.minTemp,
    this.maxTemp,
  }) : super(key: key);

  double? minTemp;
  double? maxTemp;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Maksimum : ' + maxTemp.toString() + ' "C"'),
        Text('Minimum : ' + minTemp.toString() + ' "C"')
      ],
    );
  }
}
