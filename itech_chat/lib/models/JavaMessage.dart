import 'package:flutter/material.dart';

class JavaMessage extends StatefulWidget {
  final List messages;
  const JavaMessage({Key? key, required this.messages}) : super(key: key);

  @override
  _JavaMessageState createState() => _JavaMessageState();
}

class _JavaMessageState extends State<JavaMessage> {
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    var w = MediaQuery.of(context).size.width;
    return ListView.separated(
        controller: scrollController,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: widget.messages[index]['isUserMessage']
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: const Radius.circular(
                            20,
                          ),
                          topRight: const Radius.circular(20),
                          bottomRight: Radius.circular(
                              widget.messages[index]['isUserMessage'] ? 0 : 20),
                          topLeft: Radius.circular(
                              widget.messages[index]['isUserMessage'] ? 20 : 0),
                        ),
                        color: widget.messages[index]['isUserMessage']
                            ? const Color(0xFF579981)
                            : const Color(0xFF90949C)),
                    constraints: BoxConstraints(maxWidth: w * 2 / 3),
                    child: Text(
                      widget.messages[index]['message'].text.text[0],
                      style: const TextStyle(color: Colors.white),
                    )),
              ],
            ),
          );
        },
        separatorBuilder: (_, i) =>
            const Padding(padding: EdgeInsets.only(top: 10)),
        itemCount: widget.messages.length);
  }
}
