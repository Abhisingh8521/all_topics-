import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/provider.dart';
import '../model/data_model.dart';

class UserDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: Text(
          'User Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<UserProviderModel>>(
        future: userProvider.getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final users = snapshot.data!;
            if (users.isEmpty) {
              return Center(
                child: Text('No data found',style: TextStyle(fontWeight: FontWeight.w900),),
              );
            }
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(

                  child: ListTile(
                    title: Text('Name: ${user.name}',style: TextStyle(fontSize: 17),),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email: ${user.email}',style: TextStyle(fontSize: 17),),
                        Text('Address: ${user.address}',style: TextStyle(fontSize: 17),),
                        Text('Gender: ${user.gender}',style: TextStyle(fontSize: 17),),
                      ],
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: IconButton(
                        icon: const Icon(Icons.delete,color: Colors.red,),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Delete User"),
                                content: const Text(
                                    "Are you sure you want to delete this user?"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      userProvider.deleteUser(user.id!);

                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Delete"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
