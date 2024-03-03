import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
        child: const Text('Fetch'),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final thumbnail = user['picture']['thumbnail'];
              final fName = user['name']['first'];
              final lName = user['name']['last'];
              final email = user['email'];

              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: ListTile(
                  title: Row(
                    children: [
                      Text(fName),
                      const SizedBox(width: 6),
                      Text(lName),
                    ],
                  ),
                  subtitle: Text(email),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(thumbnail),
                  ),
                  trailing: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          )),
                      child: const Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  void fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=20';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      users = json['results'];
    });
    print('fetch user completed');
  }
}
