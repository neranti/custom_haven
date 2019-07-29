import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

Future<void> main() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first; 
  }

class MessageState extends StatefulWidget {


  @override
  Messages createState() => Messages();
}

class Messages extends State<MessageState> {
  File galleryFile;

  

  //  void openGallery() async{
  //   var gallery = await ImagePicker.pickImage(
  //     source: ImageSource.gallery,
  //   );
  //   print("You selected camera image : " + gallery.path);
  //   setState(() {});
  // }

@override
  Widget build(BuildContext context) {
    //display image selected from gallery
    imageSelectorGallery() async {
      galleryFile = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        // maxHeight: 50.0,
        // maxWidth: 50.0,
      );
      print("You selected gallery image : " + galleryFile.path);
      setState(() {});
    }
  
  
    
   // @override 
    //Widget build(BuildContext context) {
      return new Scaffold(
        backgroundColor: Colors.lightBlue,
        floatingActionButton: new FloatingActionButton(
          backgroundColor: Colors.white,
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return RadialGradient(
                center: Alignment.topLeft,
                radius: 0.9,
                colors: <Color>[
                  Colors.cyan[300],
                  Colors.greenAccent,
                ],
                tileMode: TileMode.mirror,
              ).createShader(bounds);
            },
            child: new Icon(Icons.photo_camera,)         
          ),
          onPressed: () {
            // _optionsDialogBox();
            imageSelectorGallery();
            //print("object");
          }
          
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: Colors.grey[400],
            title: Text(
              "Your Messages",
              //style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: new Builder(
          
          //future: _initializeControllerFuture,
          builder: (BuildContext context) {
            return new Container(
              //builder: (BuildContext context) {}
              child: displaySelectedFile(galleryFile),
            );
          }
          
        ),   
      );
      
    }  
     Widget displaySelectedFile(File file) {
    return new SizedBox(
      height: 200.0,
      width: 200.0,
      child: file == null
          ? new Text('No image selected.')
          : new Image.file(file),
    );
                
  }

//   Future<void> _optionsDialogBox() {
//   return showDialog(
//     context: context,
//     barrierDismissible: true,
//     builder: (BuildContext context) {
//         return AlertDialog(
//           content: new SingleChildScrollView(
//             child: new ListBody(
//               children: <Widget>[
                
                  
//                 Padding(
//                   padding: EdgeInsets.all(2.0),
//                 ),
//                 GestureDetector(
//                   child: new Text('Select from gallery'),
//                   onTap: imageSelectorGallery,
//                 ),
//               ],
//             ),
//           ),
//         );
        
//       });
//       displaySelectedFile(galleryFile);
//     }

// }
  // void _displayOptionsDialog() async {
  //   await _optionsDialogBox();
  // }
  }
//}