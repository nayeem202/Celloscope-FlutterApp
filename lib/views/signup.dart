
import 'dart:developer';

import 'package:celloscope_flutterapp/helper/constant.dart';
import 'package:celloscope_flutterapp/helper/http_helper.dart';
import 'package:celloscope_flutterapp/model/UserModel.dart';
import 'package:celloscope_flutterapp/views/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _http = HttpHelper();

  final _userId = TextEditingController();
  final _mobile = TextEditingController();
  final _password = TextEditingController();

  save() async{
    String userId = _userId.value.text;
    String mobile = _mobile.value.text;
    String password = _password.value.text;

    var model = UserModel(userId: int.parse(userId), mobile: mobile, password: password);


    String _body = model.toJson();
    try{


        final response = await _http.postData(registerApi, _body);
        if (response.statusCode == 200) {
          Fluttertoast.showToast(
              msg: "Registration Successful",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }


      else{
        Fluttertoast.showToast(
            msg: "Registration Failed",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }



    }catch(e){
      log(e.toString());
      Fluttertoast.showToast(
          msg: "$e",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }




  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width,
                  height: height*0.45,
                  child: Image.asset('assets/image/signup.png',fit: BoxFit.fill,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Signup',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                SizedBox(height: 30.0,),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter User ID';
                      }
                      return null;
                    },
                    controller: _userId,
                    decoration: InputDecoration(
                      hintText: 'User ID',
                      suffixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0,),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Mobile Number';
                      }
                      return null;
                    },
                    controller: _mobile,
                    decoration: InputDecoration(
                      hintText: 'Mobile',
                      suffixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),


                SizedBox(height: 20.0,),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: Icon(Icons.visibility_off),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),



                SizedBox(height: 30.0,),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RaisedButton(
                        child: Text('Signup'),
                        color: Color(0xffEE7B23),
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                            save();
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(30.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                    },
                    child: Text.rich(
                      TextSpan(
                          text: 'Already member ?',
                          children: [
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                  color: Color(0xffEE7B23)
                              ),
                            ),
                          ]
                      ),
                    ),
                  ),

                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}