import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/widgets/text_for-normal_display.dart';

class SellDialogPage extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;

  SellDialogPage({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        child: Container(
          height: size.height-10,
          width: size.width-10,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextForNormalDisplay(text:  'Submit Transfer Details',),
                ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              // controller: _questionTextController,
              // initialValue: '${0}',
              style: TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                  fillColor: Colors.blueAccent,
                  hintStyle: TextStyle(fontSize: 12),
                  border: OutlineInputBorder(),
                  //border: InputBorder(),
                  labelText: 'Enter Amount'),
              autofocus: false,
              onChanged:   (_){},
            ),
        ),


        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerLeft,
                child: Text(' Select Your prefeered Channel')),
        ),
        DropdownButton<String>(
            //elevation: 16,
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
            hint:  Text('Choose Channel',
                          style: TextStyle(color: Colors.blue),
            ),
            //value: provider.fromUnit,
            onChanged: (_) { },
            items: ['EcN', 'TRC'].map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
        ),
        //DropDown Box

                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    border: Border.all(
                      color: Colors.black38,
                      width: 2.0,),
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0)),
                ),
        child: TextField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: ' Optioal Comment Here',
              border: InputBorder.none,
            ),
        )

                ),


        SizedBox(height: 20,),
        Text('Total Outcome'),
        Container(

              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white10,
                border: Border.all(
                  color: Colors.red[300],
                  width: 3.0,),
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)),
              ),
                        child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text( 'Payout Method'),
                      Text('Naira'),
                    ],

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text('Rate * Amount'),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text('Total'),
                      Text('#334.0')
                    ],
                  ),
                ),
              ],
    ),
        ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      "Submit  >>",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {}
                  ),
                ),

              ],
        ),
          ),
    )
    );
  }
}