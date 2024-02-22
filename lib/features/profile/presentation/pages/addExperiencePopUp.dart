import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddExperiencePopup extends StatefulWidget {
  @override
  _AddExperiencePopupState createState() => _AddExperiencePopupState();
}

class _AddExperiencePopupState extends State<AddExperiencePopup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  void handleSave() {
    String name = nameController.text;
    String position = positionController.text;
    String jobTitle = jobTitleController.text;
    String date = dateController.text;

    // TODO: Perform the action or save the entered values
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(

        decoration: BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Experience',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: positionController,
              decoration: InputDecoration(
                labelText: 'Position',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: jobTitleController,
              decoration: InputDecoration(
                labelText: 'Job Title',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                labelText: 'Date',

              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}