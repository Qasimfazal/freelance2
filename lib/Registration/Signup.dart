import 'package:flutter/material.dart';
import 'package:freelance2/API/API.dart';
import 'package:freelance2/API/GloabalVariable.dart';
import 'package:freelance2/constant.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'Login.dart';

class Signup extends StatefulWidget {

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  ProgressDialog pr;


  @override
  void initState() {
    pr = ProgressDialog(context);
    super.initState();
  }

  waittologin() async {
    await Future.delayed(const Duration(seconds: 2), (){
      if(API.complete == 'true'){
        pr.hide();
        FocusScope.of(context).unfocus();
        if(success=='error'){
          ScaffoldMessenger
              .of(context)
              .showSnackBar(SnackBar(content: Text('Something Went Wrong')));
        }
        else{
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginPage()));
        }

        print('data updated');


      }
      else{
        waittologin();
      }
    });
  }

  // void _submit() {
  //   final isValid = _formKey.currentState.validate();
  //   if (!isValid) {
  //     return;
  //   }else
  //   {
  //
  //     setState(() {
  //       widget.getUserDetails(_first.text,_last.text,_email.text,_phone.text);
  //     });
  //
  //     Future.delayed(
  //         const Duration(
  //             milliseconds: 500), () {
  //
  //       Navigator.pop(context);
  //     });
  //   }
  //   _formKey.currentState.save();
  // }
  TextEditingController _first = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  //  height: MediaQuery.of(context).size.height,
                  //padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Spacer(),
                          // IconButton(
                          //   icon: Icon(Icons.arrow_back),
                          //   // onPressed: () => Navigator.of(context)
                          //   // .push(MaterialPageRoute(builder: (_) => MainPage(0,0,0, "" , "")))
                          // ),
                          Container(
                              width: MediaQuery.of(context).size.width/1.2,
                              child: Center(
                                child: Text(
                                  "SignUp",
                                  style:
                                  TextHeading,
                                ),
                              )),
                          Spacer(),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),

                      Text(
                        "Name",
                        style: TextDilog,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height:MediaQuery.of(context).size.height/13,
                        width: MediaQuery.of(context).size.width / 1.07,
                        child: TextFormField(
                            controller: _first,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter Name';
                              }
                              return null;
                            },
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'aveb',
                                letterSpacing: 2.2),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xfff3f3f4),
                                filled: true)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Email",
                        style: TextDilog,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height:MediaQuery.of(context).size.height/12,
                        width: MediaQuery.of(context).size.width / 1.07,
                        child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter Email';
                              }
                              return null;
                            },
                            controller: _email,
                            style: TextStyle(
                                fontSize: 15, letterSpacing: 2.2),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xfff3f3f4),
                                filled: true)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Password",
                        style: TextDilog,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height:MediaQuery.of(context).size.height/12,
                        width: MediaQuery.of(context).size.width / 1.07,
                        child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter Password';
                              }
                              return null;
                            },
                            controller: _password,
                            obscureText: true,
                            style: TextStyle(
                                fontSize: 15, letterSpacing: 2.2),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xfff3f3f4),
                                filled: true)),
                      ),
                      SizedBox(
                        height:15,
                      ),
                      Text(
                        "Phone number",
                        style: TextDilog,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height:MediaQuery.of(context).size.height/12,
                        width: MediaQuery.of(context).size.width / 1.07,
                        child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter Phone Number';
                              }
                              return null;
                            },
                            controller: _phone,
                            style: TextStyle(
                                fontSize: 15, letterSpacing: 2.2),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xfff3f3f4),
                                filled: true)),
                      ),
                      SizedBox(
                        height:15,
                      ),
                      Text(
                        "Address",
                        style: TextDilog,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height:MediaQuery.of(context).size.height/12,
                        width: MediaQuery.of(context).size.width / 1.07,
                        child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter Address Number';
                              }
                              return null;
                            },
                            controller: _address,
                            style: TextStyle(
                                fontSize: 15, letterSpacing: 2.2),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xfff3f3f4),
                                filled: true)),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar:Padding(
          padding: const EdgeInsets.only(left:18.0,right: 18,bottom: 2),
          child: InkWell(
            onTap: (){
              if(_formKey.currentState.validate()){
                pr.show();
                API.Sigup(_email.text.toString(),_password.text.toString(),_first.text.toString(),_phone.text.toString(),_address.text.toString());
                waittologin();
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 1.07,
              height:MediaQuery.of(context).size.height/12,
              // margin: EdgeInsets.only(bottom: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                'SIGNUP',
                style: TextSearch ,
              ),
            ),
          ),
        ),
      ),
    );
  }
}