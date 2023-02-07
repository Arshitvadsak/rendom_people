import 'package:flutter/material.dart';
import '../../helpers/api_helper.dart';
import '../../models/Randam_People.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random People"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: APIHelper.apiHelper.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            RendomData? data = snapshot.data;
            return (data != null)
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage("${data.image}"),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person_outline),
                          Text(
                            " ${data.title} ${data.first} ${data.last} ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Gender",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${data.gender}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Age",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${data.age}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        height: 40,
                        color: Colors.black38,
                        endIndent: 5,
                        indent: 5,
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          Text(
                            " City     :-  ",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " ${data.city}",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 20,
                        color: Colors.black38,
                        endIndent: 5,
                        indent: 5,
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          Text(
                            " Contry :- ",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " ${data.country}",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 20,
                        color: Colors.black38,
                        endIndent: 5,
                        indent: 5,
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          Text(
                            " Email   :- ",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${data.email}",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  )
                : const Center(
                    child: Text("No data found..."),
                  );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
