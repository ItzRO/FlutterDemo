import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Redirecting Links',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 236, 194),
      appBar: AppBar(
        title: const Text('IISC internship task'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        titleTextStyle: const TextStyle(
          fontSize: 35.0,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage('data:image/png;base64,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'),
                radius: 50.0,
              ),
            ),
            const SizedBox(height: 10.0),
            const Center(child: Text('IISC Bangalore')),
            Divider(
              height: 120.0,
              color: Colors.grey[800],
            ),
            Center(
              child: ElevatedButton.icon(
                onPressed: _openLiveLocation,
                icon: Icon(Icons.location_on),
                label: Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 50.0),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                },
                icon: Icon(Icons.mail),
                label: Text(
                  'Blogs/Articles/Papers',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openLiveLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    String url =
        'https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 236, 194),
      appBar: AppBar(
        title: Text('More Links'),
        titleTextStyle: TextStyle(
          fontSize: 35.0,
          color: Colors.white,
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () => _launchURL('https://www.newyorker.com/magazine/2024/04/15/joe-biden-and-us-policy-toward-israel'),
              icon: Icon(Icons.article),
              label: Text(
                'Article',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () => _launchURL('https://9to5mac.com/'),
              icon: Icon(Icons.web),
              label: Text(
                'Blog',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () => _launchURL('https://timesofindia.indiatimes.com/'),
              icon: Icon(Icons.newspaper),
              label: Text(
                'Paper',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}


