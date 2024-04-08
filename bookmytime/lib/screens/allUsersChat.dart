import 'package:bookmytime/screens/chatPage.dart';
import 'package:bookmytime/tools/pallete.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookmytime/services/theme_provider.dart';

class AllUsersChat extends StatefulWidget {
  final void Function()? onTap;
  const AllUsersChat({Key? key, this.onTap}) : super(key: key);

  @override
  State<AllUsersChat> createState() => _chatLogin();
}

class _chatLogin extends State<AllUsersChat> {
  final phonController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.currentTheme.primaryColor,
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: SafeArea(
        child: _buildUserList(),
      ),
    );
  }

  // build a list of users except for the current logged in user
  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => _buildUserListItem(doc))
              .toList(),
        );
      },
    );
  }

  // build individual user list items
  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    // display all users except the current user
    if (_auth.currentUser!.email != data['email']) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          title: Text(data['username']),
          titleTextStyle: const TextStyle(
            fontFamily: AutofillHints.email,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
          subtitle: data['message'] != null
              ? Text(data['message'])
              : const Text("Start the discussion"),
          subtitleTextStyle: const TextStyle(
            fontStyle: FontStyle.italic
          ),
        leading: CircleAvatar(
          radius: 30,
          // display the porfil image of the user here
          backgroundColor: Pallete.greyColor,
          child: Text(data['username'][0].toUpperCase()),
        ),
          style: ListTileStyle.drawer,
          selectedTileColor: Color.fromRGBO(193, 70, 86, 1),
          onTap: () {
            // pass the clicked user's UID to the chat page
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                    receiverUserEmail: data['username'],
                    receiverUserID: data['uid'],
                  ),
                ));
          },
        
        ),
      );
    }

    return Container();
  }
}
