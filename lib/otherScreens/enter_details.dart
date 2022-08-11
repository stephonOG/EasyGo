import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:theo/otherScreens/payment_method.dart';


class EnterDetails extends StatefulWidget {
  final bool flight;
  const EnterDetails({Key? key, required this.flight}) : super(key: key);

  @override
  State<EnterDetails> createState() => _EnterDetailsState();
}

class _EnterDetailsState extends State<EnterDetails> {
  TextEditingController firstNameTEC = TextEditingController();
  TextEditingController middleNameTEC = TextEditingController();
  TextEditingController lastNameTEC = TextEditingController();
  TextEditingController emailTEC = TextEditingController();
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter details'),
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
              buildTextField(Icons.add, 'First name', 'First name', false, false, false, firstNameTEC),
              buildTextField(Icons.add, 'Middle name', 'Middle name', false, false, false, middleNameTEC),
              buildTextField(Icons.add, 'Last name', 'Last name', false, false, false, lastNameTEC),
              SizedBox(height: 8.0,),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Journey Date", style: TextStyle(color: Theme.of(context).textTheme.bodyText2?.color,fontWeight: FontWeight.w600,fontSize: 14 )),
                  // DateTimeField(
                  //   format: formats,
                  //   onShowPicker: (context, currentValue) {
                  //     return showDatePicker(
                  //         context: context,
                  //         initialDate: currentValue ?? DateTime.now(),
                  //         firstDate: DateTime(1970), lastDate: DateTime(2119));
                  //   },
                  //   onChanged: (dates) {
                  //     setState(() {
                  //       journeys = dates;
                  //     });
                  //   },
                  //   decoration: InputDecoration(
                  //       border: InputBorder.none,
                  //       prefixIcon: Icon(Icons.date_range),
                  //       suffixIcon: FlatButton(onPressed: (){
                  //         setState(() {
                  //           journeys = DateTime.now();
                  //         });
                  //       }, child: Text("Today"))
                  //   ),
                  // ),
                  //date time picker
                  SizedBox(height: 8,),
                  InkWell(
                    onTap:()async{
                      final initialDate = DateTime.now();
                      final newDate = await showDatePicker(
                          context: context,
                          initialDate: initialDate,
                          firstDate: DateTime(DateTime.now().year - 30),
                          lastDate: DateTime(DateTime.now().year + 30));
                      if (newDate == null) return;
                      setState(() {
                        date = newDate;
                      });
                      print(date);


                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: HexColor('e0e0e0')
                          ),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      height: 48,

                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Text(
                              date == null
                                  ? 'dd/mm/yy'
                                  : '${date?.day}/${date?.month}/${date?.year}',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily:
                                  'Gilroy-Medium',
                                  fontWeight:
                                  FontWeight.w400,
                                  color: Theme.of(context)
                                      .textTheme
                                      .caption
                                      ?.color,
                                  letterSpacing: -0.1),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10,),
              buildTextField(Icons.add, 'E-Mail', 'E-Mail', false, false, false,emailTEC),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder:(_)=>PaymentMethod(flight: widget.flight,)));
                  },
                  child: Container(
                    width: width,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueAccent
                    ),
                    child: Center(
                      child: Text('Continue', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 16 ),),

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
