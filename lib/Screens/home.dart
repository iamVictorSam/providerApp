import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/Model/model.dart';
import 'package:provider_app/Provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    //load the data
    final todoModel = Provider.of<HomeProvider>(context, listen: false);
    todoModel.getPostData();
  }

  @override
  Widget build(BuildContext context) {
    //Create an instance of the data
    final todos = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Provider')),
      body: SingleChildScrollView(
          child: Column(
        children: List.generate(
            4,
            (index) => ListTile(
                  title: Text(todos.todo?.title ?? ''),
                )),
      )),
    );
  }
}
