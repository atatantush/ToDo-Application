import 'package:flutter/material.dart';
import 'package:to_do_application/data/FireStoreUtils.dart';

class AddToDoWidget extends StatefulWidget {
  @override
  State<AddToDoWidget> createState() => _AddToDoWidgetState();
}

class _AddToDoWidgetState extends State<AddToDoWidget> {

  var formKey = GlobalKey<FormState>();
  var Chosen_Date = DateTime.now();

  String title = '';
  String description = '';

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

          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: Theme
                        .of(context)
                        .textTheme
                        .subtitle1,
                  ),
                  validator: (TextValue) {
                    if (TextValue == null || TextValue.isEmpty) {
                      return 'Please Enter The Tilte';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    title = value;
                  },
                ), // for Tilte
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: Theme
                        .of(context)
                        .textTheme
                        .subtitle1,
                  ),
                  validator: (NewTextValue) {
                    if (NewTextValue == null || NewTextValue.isEmpty) {
                      return 'Please Enter The Description';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    description = value;
                  },
                  minLines: 3,
                  maxLines: 3,
                ), // for description
              ],
            ),
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
                '${Chosen_Date.day} / ${Chosen_Date.month} / ${Chosen_Date
                    .year}',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => AddToDo(),
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  void ShowDataDialoge() async {
    var New_Chosen_Date = await showDatePicker(
      context: context,
      initialDate: Chosen_Date,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365),),
    );
    if (New_Chosen_Date != null) {
      Chosen_Date = New_Chosen_Date;
      setState(() {});
    }
  }

  void AddToDo() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    AddToFireStore(title, description, Chosen_Date).then((
        value) { // added successfully
      Navigator.pop(context); // close the bottom sheet
      Show_Dialog_after_Adding('Task Added Successfully');
    }).onError((error, stackTrace) { // error in adding the item
      Show_Dialog_after_Adding(error.toString());
    }).timeout(Duration(seconds: 10,), onTimeout: () {
      Show_Dialog_after_Adding('Time Out');
    },); // can not connect to the sefrver

  }

  void Show_Dialog_after_Adding(String message) {
    showDialog(context: context, builder: (buildContext) {
      return AlertDialog(
        content: Text(message),
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(buildContext);
          },
            child: Text('Ok'),
          ),
        ],
      );
    },
    );
  }
}
