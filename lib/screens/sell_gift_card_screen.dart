import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_firebase_auth/widgets/app_bar.dart';
import 'package:flutter_firebase_auth/widgets/drawer_widget.dart';
 import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';


class SellGiftCard extends StatefulWidget {

  @override
  State<SellGiftCard> createState() => _SellGiftCardState();
}

class _SellGiftCardState extends State<SellGiftCard> {
  final picker = ImagePicker();

  String _imageName ='';

  @override
  Widget build(BuildContext context) {


    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Scaffold(
        //appBar: AppBars(),
        drawer: drawer_widget(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 50),
                    child: DropdownButton<String>(

                      //elevation: 16,
                      isExpanded: true,
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                      hint: Text(
                        'Category',
                        style: TextStyle(color: Colors.blue),
                      ),
                      //value: provider.fromUnit,
                      onChanged: (_) {},
                      items: ['EcN', 'TRC'].map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 50),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      //elevation: 16,
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                      hint: Text(
                        'Gift Card',
                        style: TextStyle(color: Colors.blue),
                      ),
                      //value: provider.fromUnit,
                      onChanged: (_) {},
                      items: ['EcN', 'Amazon Gift'].map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 50),
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
                      onChanged: (_) {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 50.0),
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        TextButton(
                          child: Text('Choose File', style: TextStyle(
                            fontSize: 15,
                          ),),
                          onPressed: pickImage,

                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xff000000),
                                  width: 2,
                                )),
                            child: Text('dd', style: TextStyle(
                              fontSize: 20,
                            ),),
                        ),

                        Icon(Icons.height, size: 30, color: Colors.green),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      //_imageFile = File(pickedFile.path);
      _imageName = pickedFile.name;
      print('${pickedFile.name}');
    });
  }
}



// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class SellGiftCard extends StatefulWidget {
//   SellGiftCard({Key key, this.url}) : super(key: key);
//   final String url;
//
//   @override
//   _SellGiftCardState createState() => _SellGiftCardState();
// }
//
// class _SellGiftCardState extends State<SellGiftCard> {
//   final ImagePicker _picker = ImagePicker();
//
//
//   Future<String> uploadImage(filename, url) async {
//     var request = http.MultipartRequest('POST', Uri.parse(url));
//     request.files.add(await http.MultipartFile.fromPath('picture', filename));
//     var res = await request.send();
//     return res.reasonPhrase;
//   }
//   String state = "";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter File Upload Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(state,
//             style: TextStyle(
//               color: Colors.blue,
//               fontSize: 30
//             ),)
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: uploadImage,
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }