import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:theo/dashboard.dart';
import 'package:theo/splash_login/sign_up.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 00, 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                            builder: (_) => Dashboard()
                        ), (route) => false);

                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text('Skip', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blueAccent),),
                      ),
                    ),
                  ],
                ),

                //image container
                Container(
                  height: 250.0,
                  child: Image.asset('images/easyGoLogo.png'),
                ),

                Center(child: Text('Welcome! Sign in or Skip to', style: TextStyle(fontSize: 20),)),

                Center(child: Text('Continue', style: TextStyle(fontSize: 20),)),

                //email address input field
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0, bottom: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(60)
                    ),
                    child: TextFormField(
                      controller: _emailTEC,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'Username',
                          suffixIcon: Icon(Icons.person),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ),

                //password input field
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0, bottom: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(60)
                    ),
                    child: TextFormField(
                      controller: _passwordTEC,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: Icon(Icons.lock),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20,),

                //login button
                Container(
                  width: 200,
                  height: 50,
                  child: MaterialButton(
                    onPressed: () async {
                      //perform user login function

                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                              builder: (_) => Dashboard()
                          ), (route) => false);



                    },
                    child: Text('LOGIN', style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: HexColor('ffffff')),),

                    color:Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60)
                    ),
                  ),
                ),

                SizedBox(height: 0,),

                //sign up message
                Container(
                  alignment: Alignment.center,
                  child: TextButton(onPressed: (){
                    //open sign up screen

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => SignUP()
                    ));


                  },
                    child:Text('Don\'t have an account? Sign up', style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400
                    ),), ),
                ),



              ],
            ),
          )
          //your code goes here
        ],
      ),
    );
  }
}
