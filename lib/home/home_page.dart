import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_example/home/add_todo_page.dart';
import 'package:todo_example/home/profil.dart';
import 'package:todo_example/model/model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    readTodos();
  }

  Stream<QuerySnapshot> readTodos() {
    final db = FirebaseFirestore.instance;
    return db.collection('todoo').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor:Colors.green[100],
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: readTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error!.toString()),
            );
          } else if (snapshot.hasData) {
            final List<Todo> todoo = snapshot.data!.docs
                .map(
                  (e) => Todo.fromMap(e.data() as Map<String, dynamic>),
                )
                .toList();
            return ListView.builder(
              itemCount: todoo.length,
              itemBuilder: (BuildContext, int index) {
                final Todo = todoo[index];
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>ProfilPage( title_: Todo.title,discription_: Todo.description??"",is_completed_: Todo.isCompleted,author_: Todo.author,)));
                  
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(Todo.title),
                      trailing:
                          Checkbox(value: Todo.isCompleted, onChanged: (value) {}),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Todo.description ?? ""),
                          Text(Todo.author),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else {return Center(child: Text("Error"),);}
          
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTodoPage(),
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
