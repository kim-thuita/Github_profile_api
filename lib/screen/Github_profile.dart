import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial_api/services/api_github.dart';
import 'package:trial_api/services/remote_services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Github_profile>? profile;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    profile = await RemoteData().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Github_profile",
          style: GoogleFonts.adventPro(
            fontSize: 20,
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search a profile',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FutureBuilder(
              future: getData(),
              builder: (context, data) {
                if (data.connectionState != ConnectionState.done) {
                  return CircularProgressIndicator();
                } else {
                  return Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: ListTile(
                        leading: Card(
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  profile![0].avatarUrl.toString(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              })
        ],
      ),
    );
  }
}
