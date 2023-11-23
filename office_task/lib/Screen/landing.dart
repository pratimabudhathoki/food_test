import 'package:flutter/material.dart';
import 'package:office_task/Repository/loginApi.dart';
import 'package:office_task/Screen/a.dart';
import 'package:google_fonts/google_fonts.dart';

class landingpage extends StatefulWidget {
  @override
  _FourTabBarAppState createState() => _FourTabBarAppState();
}

class _FourTabBarAppState extends State<landingpage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('LandingPage'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Momo'),
              Tab(text: "See food"),
              Tab(text: 'Appetizer'),
              Tab(text: 'Dim sum'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder(
              future: getdata(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("Error");
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.data.momo.length,
                    itemBuilder: (context, index) {
                      HomeResponse data = snapshot.data!;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width / 1.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 243, 239, 233),
                          ),
                          // child: Text(snapshot.data!.data.momo[index].title
                          //     .toString()),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Image.network(
                                  "http://demo1.kitwosd.com/public/images/photos/${data.data.momo[index].image}",
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        data!.data.momo[index].title.toString(),
                                        style: GoogleFonts.lato(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black45)),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        "RS. " +
                                            data.data.momo[index].currentPrice,
                                        style: GoogleFonts.lato(
                                            fontSize: 14,
                                            color: Colors.deepOrange),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 40),
                                      child: Row(
                                        children: [
                                          Text(data.data.momo[index].id
                                              .toString()),
                                          SizedBox(
                                            width: 40,
                                          ),
                                          Container(
                                            height: 30,
                                            width: 95,
                                            child: ElevatedButton(
                                                onPressed: () async {
                                                  await showDialog<void>(
                                                      context: context,
                                                      builder:
                                                          (context) =>
                                                              AlertDialog(
                                                                content: Stack(
                                                                  clipBehavior:
                                                                      Clip.none,
                                                                  children: <
                                                                      Widget>[
                                                                    Positioned(
                                                                      right:
                                                                          -40,
                                                                      top: -40,
                                                                      child:
                                                                          InkResponse(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                        child:
                                                                            const CircleAvatar(
                                                                          backgroundColor:
                                                                              Colors.red,
                                                                          child:
                                                                              Icon(Icons.close),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Form(
                                                                      key:
                                                                          _formKey,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: <
                                                                            Widget>[
                                                                          Padding(
                                                                              padding: const EdgeInsets.all(8),
                                                                              child: Text("Chicken Momo")),
                                                                          Divider(),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8),
                                                                            child:
                                                                                ElevatedButton(
                                                                              child: const Text('submit'),
                                                                              onPressed: () {
                                                                                if (_formKey.currentState!.validate()) {
                                                                                  _formKey.currentState!.save();
                                                                                }
                                                                              },
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ));
                                                },
                                                child: Text("Add Cart")),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Text(snapshot.data!.data.momo[0].image.toString());
                }
              },
            ),

            FutureBuilder(
              future: getdata(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("Error");
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.data.burger.length,
                    itemBuilder: (context, index) {
                      HomeResponse data = snapshot.data!;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width / 1.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 243, 239, 233),
                          ),
                          // child: Text(snapshot.data!.data.momo[index].title
                          //     .toString()),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Image.network(
                                  "http://demo1.kitwosd.com/public/images/photos/${data.data.burger[index].image}",
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        data!.data.burger[index].title
                                            .toString(),
                                        style: GoogleFonts.lato(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black45)),
                                    Text(data.data.burger[index].currentPrice)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Text(snapshot.data!.data.momo[0].image.toString());
                }
              },
            ),

            // Content for Tab 3
            Center(child: Text('Tab 3 Content')),
            // Content for Tab 4
            Center(child: Text('Tab 4 Content')),
          ],
        ),
      ),
    );
  }
}
