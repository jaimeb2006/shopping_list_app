import 'package:flutter/material.dart';
import 'package:shopping_list/app/data/models/notes_model.dart';

Widget itemListUi({
  required NotesModel note,
}) {
  // if(onClickAction){}
  return Column(
    children: [
      const SizedBox(height: 5),
      SizedBox(
        // height: 150,
        child: Card(
          shape: const RoundedRectangleBorder(
            // side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(0.0),
            ),
          ),
          elevation: 2.0,
          margin: const EdgeInsets.all(10.0),
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: note.title != null
                      ? Text('${note.title}',
                          style: const TextStyle(
                            color: Color(0xFF414040),
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left)
                      : const Text('',
                          style: TextStyle(
                            color: Color(0xFF414040),
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                    color: const Color(0xFFD9D8D8),
                    height: 1,
                    width: double.infinity),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: double.infinity,
                  child: note.description != null
                      ? Text('${note.description}',
                          style: const TextStyle(
                            color: Color(0xFF414040),
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left)
                      : const Text('',
                          style: TextStyle(
                            color: Color(0xFF414040),
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),

      // SizedBox(height: 5),
    ],
  );
}
