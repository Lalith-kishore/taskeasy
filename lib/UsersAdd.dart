import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as global;
import 'package:intl/intl.dart';

import 'DetailsPage.dart';
import 'main.dart';

class AddUsers extends StatefulWidget {
  @override
  State<AddUsers> createState() => _AddUsersState();
}

class _AddUsersState extends State<AddUsers> {
  final nameController = TextEditingController();
  final firstController = TextEditingController();
  final lastController = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final addressnumberController = TextEditingController();
  final addressnameController = TextEditingController();
  final addresscityController = TextEditingController();
  final addressstateController = TextEditingController();
  final addresscountryController = TextEditingController();
  final addresspostController = TextEditingController();
  final phoneNoController = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: Text("Add User",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ))),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(36)),
                      child: TextFormField(
                        controller: nameController,
                        cursorColor: Colors.white,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                        decoration: const InputDecoration.collapsed(
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintText: 'Name',
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(36)),
                      child: TextFormField(
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2100));
                          if (pickedDate != null) {
                            print(pickedDate);
                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                            setState(() {
                              dateInput.text =
                                  formattedDate; //set output date to TextField value.
                            });
                            /*  String formattedDate =
      DateFormat('yyyy-MM-dd').format(pickedDate);*/
                          }
                        },
                        controller: dateInput,
                        cursorColor: Colors.white,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration.collapsed(
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                          hintText: 'Date of Birth',
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(36)),
                      child: TextFormField(
                        controller: emailController,
                        cursorColor: Colors.white,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration.collapsed(
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintText: 'Email ID',
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(36)),
                          child: TextFormField(
                            controller: addresscityController,
                            cursorColor: Colors.white,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration.collapsed(
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                              hintText: 'Location',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(36)),
                          child: TextFormField(
                            controller: addresscountryController,
                            cursorColor: Colors.white,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration.collapsed(
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                              hintText: 'Country',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(36)),
                          child: TextFormField(
                            controller: addresspostController,
                            cursorColor: Colors.white,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration.collapsed(
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                              hintText: 'ZipCode',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(36)),
                      child: TextFormField(
                        controller: phoneNoController,
                        cursorColor: Colors.white,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                        decoration: const InputDecoration.collapsed(
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintText: 'Phone Number',
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: RaisedButton(
                      color: Colors.black,
                      onPressed: () {
                        setState(() {
                          global.adduser["email"] = emailController.text;
                          global.adduser["phone"] = phoneNoController.text;
                          global.adduser["dob"] = {"date": dateInput.text};
                          global.adduser["name"] = {
                            "title": nameController.text,
                            "first": firstController.text,
                            "last": lastController.text
                          };
                          global.adduser["location"] = {
                            "street": {
                              "number": addressnumberController.text,
                              "name": addressnameController.text
                            },
                            "city": addresscityController.text,
                            "state": addressstateController.text,
                            "country": addresscountryController.text,
                            "postcode": addresspostController.text
                          };

                          global.email = nameController.text;
                          global.phoneNumber = nameController.text;
                          global.Address = nameController.text;
                          global.firstname = nameController.text;
                          global.dob = nameController.text;
                          print("global.email:" + global.adduser.toString());
                          Navigator.pop(context, true);
                        });
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
