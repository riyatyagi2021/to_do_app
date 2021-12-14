import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({Key? key}) : super(key: key);

  @override
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  var chosenValue="1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Color(0xff05bfed),
        automaticallyImplyLeading: true,
        title:const Text("New Task",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 30),
        color: Color(0xff195b8a),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("What is to be done?",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff05bfed))),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: TextField(
                      inputFormatters: [LengthLimitingTextInputFormatter(25),],
                      keyboardType: TextInputType.text,
                      decoration:const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide:BorderSide(color: Colors.blue, width: 2)  ,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 2,color: Colors.blue),
                          ),
                          hintText: 'Enter Task Here',
                          hintStyle: TextStyle(color: Colors.white54,fontSize: 20)
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                      child: const Icon(Icons.mic,size: 30,color: Colors.white,)),
                ],
              ),
              SizedBox(height: 50,),
              const Text("Due Date",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff05bfed))),
              SizedBox(height: 0,),
              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: TextField(
                      inputFormatters: [LengthLimitingTextInputFormatter(25),],
                      keyboardType: TextInputType.text,
                      decoration:const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide:BorderSide(color: Colors.blue, width: 2)  ,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 2,color: Colors.blue),
                          ),
                          hintText: 'Date not set',
                          hintStyle: TextStyle(color: Colors.white54,fontSize: 20)
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                      child: const Icon(Icons.calendar_today,size: 30,color: Colors.white,)),
                ],
              ),
              SizedBox(height: 100,),
              const Text("Add to List",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff05bfed))),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
                    margin: EdgeInsets.only(left: 10),
                    child: DropdownButton<String>(
                      dropdownColor: Colors.blue,
                      iconEnabledColor: Colors.white,
                      isExpanded: true,
                      iconSize: 30,

                      //icon: Icon(Icons.expand_more, color: Colors.white,size: 30,),
                      underline: Container(),
                      onChanged: (String? valuee) {
                        setState(() {
                          chosenValue = valuee!;
                        });
                      },
                      value: chosenValue,
                      items: const [
                        DropdownMenuItem(
                          value: "1",
                          child: Text("Default",style: TextStyle(
                              fontSize:  20,
                             // fontWeight: FontWeight.bold,
                              color: Colors.white),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "3",
                          child: Text("Personal",style: TextStyle(
                              fontSize:  20,
                             // fontWeight: FontWeight.bold,
                              color: Colors.white),
                          ),
                        ), DropdownMenuItem(
                          value: "4",
                          child:  Text("Shopping",style: TextStyle(
                              fontSize:  20,
                              //fontWeight: FontWeight.bold,
                              color: Colors.white),
                          ),
                        ), DropdownMenuItem(
                          value: "5",
                          child: Text("Wishlist",style: TextStyle(
                              fontSize:  20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          ),
                        ), DropdownMenuItem(
                          value: "6",
                          child:Text("Work",style: TextStyle(
                              fontSize:  20,
                              //fontWeight: FontWeight.bold,
                              color: Colors.white),
                          ),
                        )


                      ],
                    ),
                  ),
                  IconButton(onPressed: null, icon: Icon(Icons.playlist_add,color: Colors.white,size: 30,))
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=>Navigator.of(context).pop(),
        backgroundColor: Colors.white,
        child: Icon(Icons.check,color: Colors.indigo,size: 30,),),
    );
  }
}
