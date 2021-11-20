import 'package:flutter/material.dart';
import 'package:freelance2/API/API.dart';
import 'package:freelance2/API/GloabalVariable.dart';
import 'package:freelance2/BottomNavigation/BottomNav.dart';
import 'package:freelance2/Cart/Purchase.dart';
import 'package:freelance2/Registration/Signup.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  ProgressDialog pr;

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  @override
  void initState() {
    pr = ProgressDialog(context);
    super.initState();

  }

  Widget _backButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          Text("LOGIN",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }

  Widget _entryField(String title,TextEditingController controller) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800,letterSpacing: 2),
          ),
          SizedBox(
            height: 10,
          ),
          title == 'Password'
              ? Container(
                  height: MediaQuery.of(context).size.height/20,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextFormField(
                      obscureText: true,
                      controller: controller,
                      validator: (value){
                        if(value.isEmpty){
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      style: TextStyle(
                          fontSize: 15, fontFamily: 'aveb', letterSpacing: 2.2),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true)
                  ),
                )
              : Container(
            height: MediaQuery.of(context).size.height/20,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextFormField(
                      controller: controller,
                      validator: (value){
                        if(value.isEmpty){
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      style: TextStyle(
                          fontSize: 15, fontFamily: 'aveb', letterSpacing: 2.2),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true)),
                ),
        ],
      ),
    );
  }


  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Signup()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                  fontFamily: 'aveb'),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              child: Text(
                'Register',
                style: TextStyle(
                    color: Color.fromRGBO(60, 111, 102, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'aveb'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Container(
      width: 200,
      height: 200,
      child: Image.asset('assets/image 3.png'),
    );
  }

  Widget _emailPasswordWidget() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _entryField("Email id",_emailController),
          _entryField("Password", _passwordController),
        ],
      ),
    );
  }

  waittologin() async {
    await Future.delayed(const Duration(seconds: 2), (){
      if(API.complete == 'true'){
        pr.hide();
        FocusScope.of(context).unfocus();
        if(success=='error'){
          ScaffoldMessenger
              .of(context)
              .showSnackBar(SnackBar(content: Text('Incorrect Email and Password!')));
        }
        else{
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BottomNav()));
        }

        print('data updated');


      }
      else{
        waittologin();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          height: height,
          child: Stack(
            children: <Widget>[
//              Positioned(
//                  top: -height * .15,
//                  right: -MediaQuery.of(context).size.width * .4,
//                  child: BezierContainer()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20),
                      _title(),
                      SizedBox(height: 1),
                      _emailPasswordWidget(),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {

                          if(_formKey.currentState.validate()){

                            pr.show();
                            print(_emailController.text.toString());
                            print(_passwordController.text.toString());
                            API.login(_emailController.text.toString(), _passwordController.text.toString());
                            waittologin();
                          }


                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => BottomNav()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 140.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 4,
                            height: 45,
                            margin: EdgeInsets.only(bottom: 5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              // boxShadow: BoxShadow(offset: 20,20),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Text(
                              'LOGIN',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'aveh',
                                  letterSpacing: 0.11,
                                  fontSize: 12.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.centerRight,
                        child: Text('Forgot Password ?',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'aveb')),
                      ),

                      SizedBox(height: 2),
                      _createAccountLabel(),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              Positioned(top: 40, left: 0, child: _backButton()),
            ],
          ),
        ),
      )),
    );
  }
}
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.all(18.0),
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   alignment: Alignment.center,
//                   width: MediaQuery.of(context).size.width/3,
//                   height:  MediaQuery.of(context).size.height/10,
//                   child: Image.asset('assets/LogoWhite.png',color: Colors.black,),
//                 ),
//                 Row(
//                   children: [
//                     Text('Login',style: catagory,),
//                   ],
//                 ),
//                 SizedBox(height: 10,),
//                 Container(
//                   height: MediaQuery.of(context).size.height/10,
//                   width: MediaQuery.of(context).size.width/1.07,
//                   child: TextFormField(
//                      // controller: controller,
//                       validator: (value){
//                         if(value.isEmpty){
//                           return 'Please enter some text';
//                         }
//                         return null;
//                       },
//                       style: TextStyle(
//                           fontSize: 15, fontFamily: 'aveb', letterSpacing: 2.2),
//                       decoration: InputDecoration(
//                         hintText: 'Email',
//                           border: InputBorder.none,
//                           fillColor: Colors.grey,
//                           filled: true)),
//                 ),
//                 Container(
//                   height: MediaQuery.of(context).size.height/10,
//                   width: MediaQuery.of(context).size.width/1.07,
//                   child: TextFormField(
//                     // controller: controller,
//                       validator: (value){
//                         if(value.isEmpty){
//                           return 'Please enter some text';
//                         }
//                         return null;
//                       },
//                       style: TextStyle(
//                           fontSize: 15, fontFamily: 'aveb', letterSpacing: 2.2),
//                       decoration: InputDecoration(
//                           hintText: 'Passward',
//                           border: InputBorder.none,
//                           fillColor: Colors.grey,
//                           //fillColor: Color(0xfff3f3f4),
//                           filled: true)),
//                 ),
//                 SizedBox(height: 10,),
//                 Container(
//                   height: 50,
//                   width: 200,
//                   color: Colors.black,
//                   child: Text('Submit'/),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
