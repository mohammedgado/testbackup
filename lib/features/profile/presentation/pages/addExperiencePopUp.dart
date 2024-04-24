import 'package:bottom_picker/widgets/date_picker.dart';
import 'package:dubai_recruitment/core/enums/experienceTypeEnum.dart';
import 'package:dubai_recruitment/features/profile/data/data_sources/profileDataSource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddExperiencePopup extends StatefulWidget {
  AddExperiencePopup(
      {super.key, required this.type, required this.refresh, this.idEdit});
  final ExperienceType type;
  final Function refresh;
  final String? idEdit;
  @override
  _AddExperiencePopupState createState() => _AddExperiencePopupState();
}

class _AddExperiencePopupState extends State<AddExperiencePopup> {
  TextEditingController controller1 = TextEditingController(); // Main
  TextEditingController controller2 = TextEditingController(); // Secondary
  TextEditingController controller3 = TextEditingController(); // Extra

  addOrEditSkill() async {
    if (widget.idEdit == null) {
      var res = await ProfileDataSource().addSkill(controller1.text);
      print(res);
    } else {
      var res =
          await ProfileDataSource().editSkill(widget.idEdit!, controller1.text);
      print(res);
    }
  }

  addOrEditEducation() async {
    if (widget.idEdit == null) {
      var res = await ProfileDataSource().addUserEducation(
        controller1.text,
        controller2.text,
        controller3.text,
        fromDate.toLocal().toString().split(' ')[0],
        toDate.toLocal().toString().split(' ')[0],
      );
      print(res);
    } else {
      var res = await ProfileDataSource().editUserEducation(
        widget.idEdit!,
        controller1.text,
        controller2.text,
        controller3.text,
        fromDate.toLocal().toString().split(' ')[0],
        toDate.toLocal().toString().split(' ')[0],
      );
      print(res);
    }
  }

  addOrEditExperience() async {
    if (widget.idEdit == null) {
      var res = await ProfileDataSource().addUserExperience(
        controller1.text,
        controller2.text,
        controller3.text,
        fromDate.toLocal().toString().split(' ')[0],
        toDate.toLocal().toString().split(' ')[0],
      );
      print(res);
    } else {
      var res = await ProfileDataSource().editUserExperience(
        widget.idEdit!,
        controller1.text,
        controller2.text,
        controller3.text,
        fromDate.toLocal().toString().split(' ')[0],
        toDate.toLocal().toString().split(' ')[0],
      );
      print(res);
    }
  }

  addOrEditCourse() async {
    if (widget.idEdit == null) {
      var res = await ProfileDataSource().addUserCourse(
        controller1.text,
        controller2.text,
        controller3.text,
        fromDate.toLocal().toString().split(' ')[0],
        toDate.toLocal().toString().split(' ')[0],
      );
      print(res);
    } else {
      var res = await ProfileDataSource().editUserCourse(
        widget.idEdit!,
        controller1.text,
        controller2.text,
        controller3.text,
        fromDate.toLocal().toString().split(' ')[0],
        toDate.toLocal().toString().split(' ')[0],
      );
      print(res);
    }
  }

  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

  Future<void> _selectDateFrom(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: fromDate,
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));
    if (picked != null && picked != fromDate) {
      setState(() {
        fromDate = picked;
      });
    }
  }

  Future<void> _selectDateTo(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: fromDate,
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));
    if (picked != null && picked != fromDate) {
      setState(() {
        toDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.type == ExperienceType.skill
        ? Dialog(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Skill name',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: controller1,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () async {
                          await addOrEditSkill();
                          widget.refresh();
                          Navigator.of(context).pop();
                        },
                        child: Text(widget.idEdit != null ? 'Edit' : 'Add'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : Dialog(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.idEdit == null
                          ? 'Add Experience'
                          : 'Edit Experience',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: controller1,
                      decoration: InputDecoration(
                        labelText: widget.type == ExperienceType.education
                            ? "University/College/School"
                            : widget.type == ExperienceType.work
                                ? "Company"
                                : widget.type == ExperienceType.course
                                    ? "Course name"
                                    : '',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: controller2,
                      decoration: InputDecoration(
                        labelText: widget.type == ExperienceType.education
                            ? "Degree"
                            : widget.type == ExperienceType.work
                                ? "Job title"
                                : widget.type == ExperienceType.course
                                    ? "Place"
                                    : '',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: controller3,
                      decoration: InputDecoration(
                        labelText: widget.type == ExperienceType.education
                            ? "Grade"
                            : widget.type == ExperienceType.work
                                ? "Comment"
                                : widget.type == ExperienceType.course
                                    ? "Grade"
                                    : '',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                            'From:   ${fromDate.toLocal().toString().split(' ')[0]}'),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () => _selectDateFrom(context),
                          child: const Text('Edit'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                            'To:        ${toDate.toLocal().toString().split(' ')[0]}'),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () => _selectDateTo(context),
                          child: const Text('Edit'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () async {
                            widget.type == ExperienceType.skill
                                ? await addOrEditSkill()
                                : widget.type == ExperienceType.education
                                    ? await addOrEditEducation()
                                    : widget.type == ExperienceType.work
                                        ? await addOrEditExperience()
                                        : widget.type == ExperienceType.course
                                            ? await addOrEditCourse()
                                            : () {};
                            widget.refresh();
                            Navigator.of(context).pop();
                          },
                          child: Text(widget.idEdit != null ? 'Edit' : 'Add'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
