import 'package:flutter/material.dart';

class AddToDoWidget extends StatefulWidget {
  @override
  State<AddToDoWidget> createState() => _AddToDoWidgetState();
}

class _AddToDoWidgetState extends State<AddToDoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add New Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Title',
              labelStyle: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Description',
              labelStyle: Theme.of(context).textTheme.subtitle1,
            ),
            minLines: 4,
            maxLines: 4,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Data'),
          ),
          InkWell(
            onTap: () => ShowDataDialoge(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '1/12/2021',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  void ShowDataDialoge() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 365),
      ),
    );
  }
}
