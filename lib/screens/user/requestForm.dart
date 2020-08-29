import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:email_validator/email_validator.dart';
import 'package:validators/validators.dart';
import 'package:intl/intl.dart';

class AddRequest extends StatefulWidget {
  @override
  _AddRequestState createState() => _AddRequestState();
}

class _AddRequestState extends State<AddRequest> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  String dropDownValue = "Old Airport";
  final locationList = ["Old Airport", "Bin Mahmoud", "Plaza Mall"];
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final buildingController = TextEditingController();
  final descriptionController = TextEditingController();

  final dbRef = FirebaseDatabase.instance.reference().child("requests");

  DateTime now = DateTime.now();
  _validate() {
    if (_formKey.currentState.validate()) {
      dbRef.push().set({
        "name": nameController.text,
        "email": emailController.text,
        "building": buildingController.text,
        "phone": phoneController.text,
        "location": dropDownValue,
        "description": descriptionController.text,
        "modified": now.toString(),
        "status": "In Progress",
      }).then((_) {
        _scaffoldKey.currentState
            .showSnackBar(SnackBar(content: Text('Successfully Added')));

        emailController.clear();
        nameController.clear();
        phoneController.clear();
        buildingController.clear();
        descriptionController.clear();
      }).catchError((onError) {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text(onError)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(153, 5, 5, 1),
          title: Text("Add Request"),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.person),
                  title: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "Name",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Name';
                      }
                      return null;
                    },
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Phone",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (!isNumeric(value)) {
                        return 'Please Enter Your Phone Number';
                      }
                      return null;
                    },
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.email),
                  title: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (!EmailValidator.validate(value)) {
                        return 'Please Enter a Valid Email';
                      }
                      return null;
                    },
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: TextFormField(
                    controller: buildingController,
                    decoration: InputDecoration(
                      labelText: "Building",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter a Building Name';
                      }
                      return null;
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.location_city),
                  title: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    value: dropDownValue,
                    icon: Icon(Icons.arrow_downward),
                    items: locationList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        dropDownValue = newValue;
                      });
                    },
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.description),
                  title: TextFormField(
                    controller: descriptionController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: "Description",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        borderSide: new BorderSide(width: 2),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: _validate,
                        child: Text("Submit"),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

/*  ProgressButton.icon(
                    iconedButtons: {
                      ButtonState.idle: IconedButton(
                          text: "Send",
                          icon: Icon(Icons.send, color: Colors.white),
                          color: Colors.deepPurple.shade500),
                      ButtonState.loading: IconedButton(
                          text: "Loading", color: Colors.deepPurple.shade700),
                      ButtonState.fail: IconedButton(
                          text: "Failed",
                          icon: Icon(Icons.cancel, color: Colors.white),
                          color: Colors.red.shade300),
                      ButtonState.success: IconedButton(
                          text: "Success",
                          icon: Icon(
                            Icons.check_circle,
                            color: Colors.white,
                          ),
                          color: Colors.green.shade400)
                    },
                    onPressed: _validate,
                    state: ButtonState.loading,
                  ),*/