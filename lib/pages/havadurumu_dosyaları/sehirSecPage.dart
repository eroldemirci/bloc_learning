import 'package:bloc_denemesi/controllers/sehiradi_controller.dart';
import 'package:bloc_denemesi/havadurumu_bloc/bloc/weather_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SehirSecPage extends StatefulWidget {
  const SehirSecPage({Key? key}) : super(key: key);

  @override
  _SehirSecPageState createState() => _SehirSecPageState();
}

class _SehirSecPageState extends State<SehirSecPage> {
  TextEditingController _sehir = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final SehirController _controller = Get.put(SehirController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Şehir Seç'),
      ),
      body: Form(
          key: _formKey,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _sehir,
                    decoration: InputDecoration(
                      hintText: 'Şehir',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    _controller.sehirSec(_sehir.text);

                    Navigator.pop(context, _sehir.text);
                  },
                  icon: Icon(CupertinoIcons.search))
            ],
          )),
    );
  }
}
