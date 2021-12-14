import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/UI/add_task.dart';
import 'package:to_do_app/UI/task_list.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  var chosenValue="1";
  bool icon=false;
  TextEditingController inputText=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 60,
            backgroundColor: Color(0xff147ae0),
            leading:const Icon(
              Icons.check_circle,
              color: Colors.white,
              size: 30,
            ),
            title: SizedBox(
              width: 200,
              child: DropdownButton<String>(
                dropdownColor: Colors.blue,
                iconEnabledColor: Colors.white,
                iconSize: 30,
                underline: Container(),
                onChanged: (String? valuee) {
                  setState(() {
                    chosenValue = valuee!;
                    icon?Icon(Icons.camera):Container();
                  });
                },
                value: chosenValue,
                items:  [
                  DropdownMenuItem(
                    value: "1",
                    child:Row(
                      children: const [
                        Icon(Icons.home),
                        SizedBox(width: 10,),
                        Text("All List",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: "2",
                    child: Row(
                      children: const [
                        Icon(Icons.format_list_bulleted),
                        SizedBox(width: 20,),
                        Text("Default",style: TextStyle(
                            fontSize:  20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: "3",
                    child: Row(
                      children: const [
                        Icon(Icons.format_list_bulleted),
                        SizedBox(width: 20,),
                        Text("Personal",style: TextStyle(
                            fontSize:  20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        ),
                      ],
                    ),
                  ), DropdownMenuItem(
                    value: "4",
                    child:  Row(
                      children: const [
                        Icon(Icons.format_list_bulleted),
                        SizedBox(width: 20,),
                        Text("Shopping",style: TextStyle(
                            fontSize:  20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        ),
                      ],
                    ),
                  ), DropdownMenuItem(
                    value: "5",
                    child: Row(
                      children: const [
                        Icon(Icons.format_list_bulleted),
                        SizedBox(width: 20,),
                        Text("Wishlist",style: TextStyle(
                            fontSize:  20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        ),
                      ],
                    ),
                  ), DropdownMenuItem(
                    value: "6",
                    child:Row(
                      children: const [
                        Icon(Icons.format_list_bulleted),
                        SizedBox(width: 20,),
                        Text("Work",style: TextStyle(
                            fontSize:  20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        ),
                      ],
                    ),
                  ), DropdownMenuItem(
                    value: "7",
                    child:  Row(
                      children: const [
                        Icon(Icons.check_box),
                        SizedBox(width: 20,),
                        Text("Finished",style: TextStyle(
                            fontSize:  20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        ),
                      ],
                    ),
                  ), DropdownMenuItem(
                    value: "8",
                    child:Row(
                      children: const [
                        Icon(Icons.playlist_add),
                        SizedBox(width: 20,),
                        Text("New List",style: TextStyle(
                            fontSize:  20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),

            actions: [
              const IconButton(onPressed: null, icon: Icon(Icons.search,color: Colors.white)),
              PopupMenuButton(
                color: Color(0xff147ae0),
                icon: const Icon(Icons.more_vert_rounded,color: Colors.white),
                onSelected: (newValue) { // add this property
                  if (newValue == 0)Navigator.push(context, MaterialPageRoute(builder: (context) => TaskList()),);

                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    child: Text("Task Lists",style: TextStyle(color: Colors.white)),
                    value: 0,
                  ),
                  const PopupMenuItem(
                    child: Text("Add in Batch Mode",style: TextStyle(color: Colors.white)),
                    value: 1,
                  ),
                  const PopupMenuItem(
                    child: Text("Remove Adds",style: TextStyle(color: Colors.white)),
                    value: 2,
                  ),
                  const PopupMenuItem(
                    child: Text("More Apps",style: TextStyle(color: Colors.white)),
                    value: 2,
                  ),
                  const PopupMenuItem(
                    child: Text("Send Feedback",style: TextStyle(color: Colors.white)),
                    value: 2,
                  ),
                  const PopupMenuItem(
                    child: Text("Follow us",style: TextStyle(color: Colors.white)),
                    value: 2,
                  ),
                  const PopupMenuItem(
                    child: Text("Settings",style: TextStyle(color: Colors.white)),
                    value: 2,
                  ),
                ],
              )
            ],
          ),
          body: SafeArea(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xff195b8a),
                child:Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/icon.png',height: 150,width: 100,),
                          const SizedBox(height: 20,),
                          const Text("Nothing to do",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.cyan),),

                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 110,
                      right: 20,
                      child: FloatingActionButton(
                        onPressed:()=>Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => AddNewTask())),
                        backgroundColor: Colors.white,
                        child: const Icon(Icons.add,color: Colors.indigo,size: 30,),),
                    ),

                    Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80,
                          padding: const EdgeInsets.all(10),
                          color:const Color(0xff147ae0),
                          child:
                          Row(
                            children: [
                              const Icon(Icons.mic,size: 30,color: Colors.white,),
                              Expanded(
                                child: TextField(
                                  controller: inputText,
                                  inputFormatters: [LengthLimitingTextInputFormatter(25),],
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      suffixIcon:inputText.text.length>0? IconButton(onPressed: null, icon:Icon(Icons.check,size: 30,color:Colors.white ,)):null,
                                      contentPadding: const EdgeInsets.symmetric(
                                          horizontal: 10.0,vertical: 20),
                                      hintText: 'Enter Quick Task Here',
                                      hintStyle: TextStyle(color: Colors.white54,fontSize: 20)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ))
                  ],
                )
            ),
          ),
        )
    );

  }


}
