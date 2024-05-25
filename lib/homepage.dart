import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _amiibos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchAmiibos();
  }

  Future<void> _fetchAmiibos() async {
    final response =
        await http.get(Uri.parse('https://www.amiiboapi.com/api/amiibo/'));
    if (response.statusCode == 200) {
      setState(() {
        _amiibos = json.decode(response.body)['amiibo'];
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load amiibos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Amiibo List')),
      backgroundColor: Colors.pink[50], // Background color berwarna soft pink
      body: _isLoading
          ? const Center(child: const CircularProgressIndicator())
          : ListView.builder(
              itemCount: _amiibos.length,
              itemBuilder: (context, index) {
                final amiibo = _amiibos[index];
                final imageUrl = amiibo['image'] != null
                    ? amiibo['image']
                    : 'https://via.placeholder.com/150';

                return ListTile(
                  leading: Image.network(
                    imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(amiibo['name']),
                  subtitle: Text(amiibo['character'] ?? 'Unknown'),
                );
              },
            ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));
