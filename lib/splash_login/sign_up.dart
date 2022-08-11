import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:theo/dashboard.dart';
import 'package:theo/otherScreens/payment_method.dart';


class SignUP extends StatefulWidget {
  const SignUP({Key? key}) : super(key: key);

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  TextEditingController usernameTec = TextEditingController();
  TextEditingController passwordTec = TextEditingController();
  TextEditingController lastNameTEC = TextEditingController();
  TextEditingController emailTEC = TextEditingController();
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.white,)),
      ),

      body: ListView(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                buildTextField(Icons.add, 'Username', 'Username', false, false, false, usernameTec),
                buildTextField(Icons.add, 'Password', 'Password', false, false, false, passwordTec),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                          builder: (_) => Dashboard()
                      ), (route) => false);                    },
                    child: Container(
                      width: width,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueAccent
                      ),
                      child: const Center(
                        child: Text('Sign up', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 16 ),),

                      ),
                    ),
                  ),
                )


              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildTextField(IconData icon, String hintText, String topic,bool isPassword, bool isEmail, bool isPhoneNumber, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 8),
              child: Text(topic, style: TextStyle(color: Theme.of(context).textTheme.bodyText2?.color,fontWeight: FontWeight.w600,fontSize: 14 ),),

            ),
            // SizedBox(height: 5,),
            // Container(
            //   height: 45,
            //   decoration: BoxDecoration(
            //       color: HexColor('#F7F8FB'),
            //       borderRadius: BorderRadius.circular(10)
            //   ),
            //   child: TextField(
            //     cursorHeight: 25,
            //     obscureText: isPassword,
            //     keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
            //     decoration: InputDecoration(
            //       border: InputBorder.none,
            //       contentPadding: EdgeInsets.all(10),
            //       hintText: hintText,
            //       hintStyle: TextStyle(fontSize: 14, ),
            //     ),
            //   ),
            // ),

            SizedBox(height: 5,),
            Container(
              height: 48,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: HexColor('e0e0e0')
                  ),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: isPhoneNumber?20:10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if(isPhoneNumber)
                      Text('(+233)', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Theme.of(context).textTheme.bodyText2?.color,letterSpacing: -0.1),),



                    SizedBox(width: 10,),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Container(
                        width: 200,
                        child: TextFormField(
                            controller: controller,
                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Theme.of(context).textTheme.bodyText2?.color,letterSpacing: -0.1),
                            cursorHeight: 20,
                            autofocus: false,
                            decoration: InputDecoration(
                                border: InputBorder.none
                            )
                        ),
                      ),
                    )


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
