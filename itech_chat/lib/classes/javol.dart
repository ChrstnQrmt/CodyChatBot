import 'package:cody/classes/homepage.dart';
import 'package:cody/models/JavaMessage.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool sendButton = false;

  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile(
            path: "assets/java_dialog_flow_auth.json",
            projectId: "javacodychatbot-rcip")
        .then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            iconSize: 30,
            color: const Color(0xFF579981),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => const HomePage(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          title: const Text(
            'Java ChatBot',
            style: TextStyle(
              fontSize: 22,
              color: Color(0xFF579981),
              fontWeight: FontWeight.w800,
            ),
          ),
          elevation: 2,
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: JavaMessage(messages: messages)),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.100),
                    blurRadius: 5,
                  ),
                ],
                color: Colors.white,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              width: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.250),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 10, right: 10, bottom: 20),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      color: const Color(0xFF579981),
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        sendMessage(_controller.text);
                        _controller.clear();
                      },
                    ),
                    hintText: "Type a Message...",
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF579981),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(60.0),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF579981),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(60.0),
                      ),
                    ),
                    hintStyle: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF90949C),
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
