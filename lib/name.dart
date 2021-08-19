import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Name extends StatefulWidget {
  @override
  _NameState createState() => _NameState();
}

class _NameState extends State<Name> {
  String answer = '';
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HNG Task Two')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 16.0,
              ),
              Text(
                'Welcome',
                style: TextStyle(fontSize: 40.0, color: Colors.deepOrange),
              ),
              SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Text(
                  'Tell us about yourself',
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.justify,
                ),
              ),
              TextField(
                  textInputAction: TextInputAction.send,
                  maxLines: null,
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    //labelText: 'Password',
                  )),
              SizedBox(height: 16.0),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        if (controller.text != '') {
                          setState(() {
                            answer = controller.text;
                          });
                        }
                        print('Chukwudi Okani');
                        controller.clear();
                      },
                      child: Text('Send'))),
              Text(answer),
              //Spacer(),
              SizedBox(height: 32.0),
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  //color: Colors.red,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text('Sponsors',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500))),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                                child: GestureDetector(
                              onTap: () => _launchURL('https://hng.tech/'),
                              child: Image(
                                image: AssetImage('assets/images/hng_logo.png'),
                                height: 80,
                              ),
                            )),
                            SizedBox(
                              width: 16.0,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () =>
                                    _launchURL('https://ingressive.org/'),
                                child: Image(
                                  image:
                                      AssetImage('assets/images/i4g_logo.png'),
                                  height: 80,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => _launchURL('https://zuri.team/'),
                                child: Image(
                                  image:
                                      AssetImage('assets/images/zuri_logo.png'),
                                  height: 80,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL(url) async {
    //const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
