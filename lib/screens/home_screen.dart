import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo.dart';

class HomeScreen extends StatelessWidget {
  final df = new DateFormat('HH:mm a');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Todo App",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white70,
          ),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                df.format(DateTime.now()),
                //DateFormat.Hm().format(DateTime.now()),
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "current time",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              child: Consumer<Todo>(
                builder: (context, value, child) => ListView.builder(
                  itemCount: value.taskList.length,
                  itemBuilder: (context, index) => Container(
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 8,
                      ),
                      title: Text(
                        value.taskList[index].title,
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        value.taskList[index].detail,
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Icon(
                        Icons.check_circle,
                        color: Colors.green[100],
                      ),
                    ),
                    margin: const EdgeInsets.only(
                      bottom: 8,
                      right: 16,
                      left: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () {
          Provider.of<Todo>(context, listen: false).addTask();
        },
      ),
    );
  }
}
