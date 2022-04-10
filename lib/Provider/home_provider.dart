import 'package:flutter/cupertino.dart';
import 'package:provider_app/Services/api.dart';

import '../Model/model.dart';

class HomeProvider extends ChangeNotifier {
  Todo? todo;
  bool loading = false;

  getPostData() async {
    loading = true;
    todo = (await RemoteServices().fetchTodos());
    loading = false;

    notifyListeners();
  }
}
