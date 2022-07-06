 import 'package:campus_subsystem/faculty/faculty_attendance.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class FacultyAttendanceOption extends StatefulWidget {
  const FacultyAttendanceOption({Key? key}) : super(key: key);

  @override
  State<FacultyAttendanceOption> createState() => _FacultyAttendanceOptionState();
}

class _FacultyAttendanceOptionState extends State<FacultyAttendanceOption> {
  final branch = ["CSE", 'CIVIL', 'MECH', 'ELE'];
  final year = ["SY", 'TY', 'BE'];
  final sem = ['3', '4', '5', '6', '7', '8'];
  String selctedbranch = 'CSE';
  String selectedsem = '6';
  String selectedyear = 'TY';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Attendance",style: TextStyle(fontFamily: 'Narrow', fontSize: 30),textAlign: TextAlign.center,),
        backgroundColor: Colors.indigo[300],
      ),
      body: Form(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsetsDirectional.only(
                  start: 15, top: 70, end: 15),
              alignment: Alignment.center,
              height: 80,
              child: DropdownButtonFormField<String>(
                alignment: AlignmentDirectional.center,
                value: selctedbranch,
                items: branch.map<DropdownMenuItem<String>>((String br) =>
                    DropdownMenuItem<String>(value: br, child: Text(br)))
                    .toList(),
                onChanged: (newvalue) {
                  selctedbranch = newvalue!;
                },
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(
                  start: 15, top: 30, end: 15),
              alignment: Alignment.center,
              height: 80,
              child: DropdownButtonFormField<String>(
                alignment: AlignmentDirectional.center,
                value: selectedyear,
                items: year.map<DropdownMenuItem<String>>((String br) =>
                    DropdownMenuItem<String>(value: br, child: Text(br)))
                    .toList(),
                onChanged: (newvalue) {
                  selectedyear = newvalue!;
                },
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(
                  start: 15, top: 30, end: 15, bottom: 40),
              alignment: Alignment.center,
              height: 80,
              child: DropdownButtonFormField<String>(
                alignment: AlignmentDirectional.center,
                value: selectedsem,
                items: sem.map<DropdownMenuItem<String>>((String br) =>
                    DropdownMenuItem<String>(value: br, child: Text(br)))
                    .toList(),
                onChanged: (newvalue) {
                  selectedsem = newvalue!;
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontFamily: 'MiliBold',
                  fontSize: 18
                ),
                onPrimary: Colors.black,
                primary: Colors.white,
                padding: const EdgeInsets.only(top: 12,bottom: 12,left: 15,right: 15),
              ),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) =>
                      FacultyAttendance(year: selectedyear,
                        branch: selctedbranch,
                        sem: selectedsem,))),
              child: const Text('Next'),)
          ],
        ),
      ),
    );
  }
}

