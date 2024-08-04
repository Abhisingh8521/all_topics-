
import 'package:all_topics/views/auth_screens/splash_screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'controller/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// // Define a class for the data items
// class ListItem {
//   final String title;
//   final String subtitle;
//   bool isFavorite;
//
//   ListItem({required this.title, required this.subtitle, this.isFavorite = false});
// }
//
// // Define a provider to manage the list and favorites
// class ListProvider extends ChangeNotifier {
//   List<ListItem> _list = [
//     ListItem(title: "Item 1", subtitle: "Subtitle 1"),
//     ListItem(title: "Item 2", subtitle: "Subtitle 2"),
//     ListItem(title: "Item 3", subtitle: "Subtitle 3"),
//   ];
//
//   List<ListItem> get list => _list;
//
//   void toggleFavorite(int index) {
//     _list[index].isFavorite = !_list[index].isFavorite;
//     notifyListeners();
//   }
//
//   List<ListItem> get favorites => _list.where((item) => item.isFavorite).toList();
// }
//
// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => ListProvider(),
//       child: MaterialApp(
//         home: HomePage(),
//       ),
//     ),
//   );
// }
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ListView with Favorites'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.favorite),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => FavoritePage()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: ListViewBuilderWidget(),
//     );
//   }
// }
//
// class ListViewBuilderWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ListProvider>(
//       builder: (context, listProvider, child) {
//         return ListView.builder(
//           itemCount: listProvider.list.length,
//           itemBuilder: (context, index) {
//             final item = listProvider.list[index];
//             return ListTile(
//               title: Text(item.title),
//               subtitle: Text(item.subtitle),
//               leading: Text(index.toString()), // Display index number
//               trailing: IconButton(
//                 icon: Icon(item.isFavorite ? Icons.favorite : Icons.favorite_border),
//                 onPressed: () {
//                   listProvider.toggleFavorite(index);
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
//
// class FavoritePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorites'),
//       ),
//       body: Consumer<ListProvider>(
//         builder: (context, listProvider, child) {
//           return ListView.builder(
//             itemCount: listProvider.favorites.length,
//             itemBuilder: (context, index) {
//               final item = listProvider.favorites[index];
//               return ListTile(
//                 title: Text(item.title),
//                 subtitle: Text(item.subtitle),
//                 leading: Text(index.toString()), // Display index number
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
