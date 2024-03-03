import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:play_gemini/services/gemini.dart';

class QnA extends StatefulWidget {
  const QnA({Key? key}) : super(key: key);

  @override
  State<QnA> createState() => _QnAState();
}

class _QnAState extends State<QnA> {
  List<String> response = [];
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ask AI'),
      ),
      body: ListView(
        children: [
          TextField(
            enabled: !loading,
            decoration: InputDecoration(
                icon: loading
                    ? CircularProgressIndicator()
                    : Icon(Icons.message)),
            onSubmitted: (value) {
              setState(() {
                loading = true;
              });
              Gemini().getUpworkProposal(value).then((value) {
                setState(() {
                  loading = false;
                  response.add(value ?? 'No response from Ai');
                });
              });
            },
          ),
          SizedBox(height: 10),
          ListView.builder(
              itemCount: response.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              reverse: true,
              itemBuilder: (_c, i) {
                return ListTile(
                  title: MarkdownBody(data: response[i]),
                );
              }),
        ],
      ),
    );
  }
}
