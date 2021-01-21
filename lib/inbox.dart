import 'package:flutter/material.dart';
import 'package:sms/sms.dart';
import 'package:Login_project/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyInbox extends StatefulWidget {
  @override
  State createState() {
    //  implement createState
    return MyInboxState();
  }
}

class MyInboxState extends State {
  SmsQuery query = new SmsQuery();
  List messages = new List();
  @override
  initState() {
    //  implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("SMS Inbox"),
          backgroundColor: Colors.pink,
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false);
              },
            )
          ],
        ),
        body: FutureBuilder(
          future: fetchSMS(),
          builder: (context, snapshot) {
            return ListView.separated(
                separatorBuilder: (context, index) => Divider(
                      color: Colors.black,
                    ),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.markunread,
                        color: Colors.blue,
                      ),
                      title: Text(messages[index].address),
                      subtitle: Text(
                        messages[index].body,
                        maxLines: 2,
                        style: TextStyle(),
                      ),
                    ),
                  );
                });
          },
        ));
  }

  fetchSMS() async {
    //messages = await query.querySms(kinds: [SmsQueryKind.Sent]); /*getAllSms*/
    messages = await query.getAllSms;
  }
}
/*static const String income = 'income';
  static const String expense = 'expense';
  static const String totalIncome = 'Total Income';
  static const String totalExpense = 'Total Expense';
  //More strings can be added after | for identifying credit or debit sms
  static const String credited = r' credited | cr ';
  static const String debited = r' debited | dr ';
  static const String doublePattern = r'\b[,0-9]+\.[0-9]+\b';*/
