import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({
    Key? key,
    required this.title_,
    required this.discription_,
    required this.is_completed_,
    required this.author_,
  }) : super(key: key);
  final String title_;
  final String discription_;
  final bool is_completed_;
  final String author_;

  @override
  Widget build(BuildContext context) {
  const  TextStyle stil = TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(title: const Text("подробно",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),backgroundColor: Colors.green[100],centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("текст:", style: stil),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('$title_'),
                  ),
                  color: Colors.blue[100],
                  height: 100,
                  width: 200,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("описание:", style: stil),
                Container(
                  
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(discription_),
                  ),
                  color: Colors.blue[100],
                  height: 220,
                  width: 240,
                ),
              ],
            ),
            Row(
              children: [
                Text("завершено:", style: stil),
                Checkbox(value: is_completed_, onChanged: (value) {}),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("автор:", style: stil),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(author_),
                  ),
                  color: Colors.blue[100],
                  height: 60,
                  width: 140,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
