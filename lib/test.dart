import 'package:flutter/material.dart';
import 'package:foodapp_new/model/mark.dart';
// import 'package:foodapp_new/service/database.dart';
import 'package:foodapp_new/view_model/database.dart';

class MyFetchingWidget extends StatefulWidget {
  @override
  _MyFetchingWidgetState createState() => _MyFetchingWidgetState();
}

class _MyFetchingWidgetState extends State<MyFetchingWidget> {
  final Nyarap _nyarap = Nyarap();

  List<MyMeals> _myMeals = [];

  @override
  void initState() {
    super.initState();
    _fetchMyMeals();
  }

  Future<void> _fetchMyMeals() async {
    List<MyMeals> myMeals = await _nyarap.list();
    setState(() {
      _myMeals = myMeals;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Meals'),
      ),
      body: _myMeals.isEmpty
          ? Center(
              child: Text('No meals found'),
            )
          : ListView.builder(
              itemCount: _myMeals.length,
              itemBuilder: (context, index) {
                final meal = _myMeals[index];
                return ListTile(
                  title: Text(meal.strMeal),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(meal.strMealThumb),
                  ),
                  // You can add more details or actions here
                );
              },
            ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyFetchingWidget(),
  ));
}
