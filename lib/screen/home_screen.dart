import 'package:aej_workshop_flutter_networking_part_1/core/service/api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService apiService;

  @override
  void initState() {
    // TODO: implement initState

    apiService = ApiService();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel'),
      ),
      body: FutureBuilder(
          future: apiService.getTravelData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.data.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data.data[index];
                      return ListTile(
                        leading: Image.network(
                          data.gambarPariwisata,
                          width: 80,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(data.namaPariwisata),
                        subtitle: Text(data.alamatPariwisata),
                      );
                    });
              } else {
                return Text('Something Went Wrong');
              }
            }
          }),
    );
  }
}
