import 'package:flutter/material.dart';

void main() {
  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PhotoGalleryScreen(),
    );
  }
}

class PhotoGalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.all(16.0),
              child: Text(
                'Welcome to My Photo Gallery!',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for specific photos',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8.0),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  for (int i = 1; i < 6; i++)
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Clicked on photo!')),
                        );
                      },
                      child: Column(
                        children: [
                          Image.network(
                            'https://googleflutter.com/sample_image.jpg',
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 8.0),
                          Text('Photo $i'),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  leading: Image.network(
                    'https://googleflutter.com/sample_image.jpg',
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                  title: Text('Photo 1'),
                  subtitle: Text('HI'),
                ),
                ListTile(
                  leading: Image.network(
                    'https://googleflutter.com/sample_image.jpg',
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                  title: Text('Photo 2'),
                  subtitle: Text('This is an Gallery Application'),
                ),
                ListTile(
                  leading: Image.network(
                    'https://googleflutter.com/sample_image.jpg',
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                  title: Text('Photo 3'),
                  subtitle: Text('Build Your Own Gallery With This'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Photos Uploaded Successfully!')),
          );
        },
        child: Icon(Icons.cloud_upload),
      ),
    );
  }
}
