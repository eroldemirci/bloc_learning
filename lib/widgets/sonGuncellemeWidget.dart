import 'package:flutter/material.dart';

class SonGuncellemeWidget extends StatelessWidget {
  SonGuncellemeWidget({Key? key, this.created}) : super(key: key);
  String? created;
  @override
  Widget build(BuildContext context) {
    return Text('Son Güncelleme : ' + created!);
  }
}
