// import 'package:flutter/material.dart';
//
// class DrawerTest extends StatelessWidget {
//   const DrawerTest({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//         child: Column(
//           children: [
//             UserAccountsDrawerHeader(
//               currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
//               accountName: Text("sedra"),
//               accountEmail: Text("sedra0@gmail.com"),
//             ),
//             ListTile(
//               onTap: () {},
//               leading: Icon(Icons.settings),
//               title: Text("Setting"),
//             ),
//           ],
//         ),
//       ),
//         floatingActionButton: Builder(
//             builder: (context) {
//               return FloatingActionButton(
//                 onPressed: () {
//                   Scaffold.of(context).openDrawer();
//                 },
//               );
//             }
//         ),
//         body: Center(child: FlutterLogo())
//
//     );
//   }
// }
import 'package:flutter/material.dart';

class DrawerTest extends StatelessWidget {
  DrawerTest({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
              accountName: Text("sedra"),
              accountEmail: Text("sedra0@gmail.com"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.settings),
              title: Text("Setting"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
        child: Icon(Icons.menu),
      ),
      body: Center(child: FlutterLogo()),
    );
  }
}