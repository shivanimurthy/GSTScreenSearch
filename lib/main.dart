import 'package:flutter/material.dart';
import './GSTDisplay.dart';
import 'package:toggle_switch/toggle_switch.dart';

Future<void> main() async {
  runApp(GSTScreenApp());
}

class GSTScreenApp extends StatelessWidget {
  const GSTScreenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GSTScreen(),
    );
  }
}

class GSTScreen extends StatefulWidget {
  GSTScreen({Key? key}) : super(key: key);

  @override
  _GSTScreenState createState() => _GSTScreenState();
}

class _GSTScreenState extends State<GSTScreen>
    with SingleTickerProviderStateMixin {
  final gst = TextEditingController();
  bool flag = false;

  @override
  void initState() {}

  @override
  void dispose() {
    super.dispose();
  }

  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    double toggleWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green[700],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36.0),
                    bottomRight: Radius.circular(36.0),
                  ),
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Text(
                        "Select the type for",
                        style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "GST Number Search Tool",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 10),
                        child: ToggleSwitch(
                          minHeight: 50,
                          minWidth: double.infinity,
                          cornerRadius: 20.0,
                          activeBgColors: [
                            [Colors.white],
                            [Colors.white]
                          ],
                          activeFgColor: Colors.green[700],
                          inactiveBgColor: Colors.black12,
                          inactiveFgColor: Colors.white,
                          initialLabelIndex: 1,
                          totalSwitches: 2,
                          labels: ['Search GST Number', 'GST Return Status'],
                          fontSize: 16,
                          radiusStyle: true,
                          onToggle: (index) {
                            print('switched to: $index');
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 46,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26),
              child: Text(
                "Enter GST number",
                style: TextStyle(fontSize: 15.0, color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26),
              child: TextField(
                controller: gst,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Ex: 07AACCM9910C1ZP",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                ),
              ),
            ),
            SizedBox(
              height: 36,
            ),
            SizedBox(
              width: 500,
              height: 46,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 26),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            GSTDisplayPage(gst: gst.text),
                      ),
                    );
                  },
                  child: Text(
                    "Search",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.green[700]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
