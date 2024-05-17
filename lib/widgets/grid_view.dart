import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget MyGridView({required String imagePath, required String name, required int activities_length}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
   child:
    GridView.builder(
    itemCount: activities_length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Nombre de colonnes dans la grille
          mainAxisSpacing: 20.0, // Espacement vertical entre les éléments
          crossAxisSpacing: 20.0, // Espacement horizontal entre les éléments
          childAspectRatio: 1.0, // Rapport hauteur/largeur des éléments
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){


            },
    child: GridTile(
      child: Expanded(
        child: Container(
          color: Colors.blue[100],
          child: Stack(
            children: [
              Image.network(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: SpinKitDoubleBounce(
                      size: 10,
                      color: Colors.orange,
                    ),
                  );
                },
              ),
              Center(
                child: Text(
                  name,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}));
}


// Widget MyGridView({required String imagePath, required String name}) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: GridView.builder(
//       //itemCount: activities.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3, // Nombre de colonnes dans la grille
//           mainAxisSpacing: 20.0, // Espacement vertical entre les éléments
//           crossAxisSpacing: 20.0, // Espacement horizontal entre les éléments
//           childAspectRatio: 1.0, // Rapport hauteur/largeur des éléments
//         ),
//         itemBuilder: (BuildContext context, int index) {
//           return GestureDetector(
//             onTap: (){
//
//
//             },
//             child: GridTile(
//               child: Container(
//                 color: Colors.blue[100],
//                 child: Stack(
//                     children:[
//                       Image.network(
//                         imagePath,
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                         height: double.infinity,
//                         loadingBuilder: (context, child, loadingProgress) {
//                           if (loadingProgress == null) {
//                             return child;
//                           }
//                           return Center(
//                             child: SpinKitDoubleBounce(
//                               size: 10,
//                               color: Colors.orange,
//                             ),
//                           );
//                         },
//                       ),
//                       Center(
//                         child: Text(
//                           name,
//                           style: TextStyle(fontSize: 20.0),
//                         ),
//                       ),
//                     ]
//                 ),
//               ),
//             ),
//           );}
//     ),);
//
//
//
//
//
//
//
// }
