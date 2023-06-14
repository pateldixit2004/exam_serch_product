import 'package:exam_serch_product/screen/model/pro_model.dart';
import 'package:exam_serch_product/screen/model/serchModel.dart';
import 'package:exam_serch_product/screen/provider/serch_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SerchProvider? serchProviderF;
  SerchProvider? serchProviderT;

  @override
  Widget build(BuildContext context) {
    serchProviderF = Provider.of<SerchProvider>(context, listen: false);
    serchProviderT = Provider.of<SerchProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Api'),
            centerTitle: true,
            backgroundColor: Colors.grey,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'product');
                    serchProviderT!.GetApi();
                  },
                  icon: Icon(Icons.search_rounded))
            ],
          ),
          body: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                SerchModel? serchModel = snapshot.data;
                return Column(
                  children: [
                    // Expanded(
                    //   child: ListView.builder(
                    //     itemBuilder: (context, index) {
                    //       return ListTile(
                    //         leading:
                    //             Text("${serchModel.data![index].productId}"),
                    //       );
                    //     },
                    //     itemCount: serchModel!.data!.length,
                    //   ),
                    // ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return  InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, 'view',arguments: index);

                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  child: Column(
                                    children: [
                                      Text("${serchModel.data![index].productTitle}"),
                                      SizedBox(height: 10),
                                      Text("id=${serchModel.data![index].productId}"),
                                      // Image.network('${serchModel.data![index].productPhotos![index]}')

                                      SizedBox(height: 10),
                                      Text("rating=${serchModel.data![index].productRating!}"),

                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: serchModel!.data!.length,
                        ),
                      ),
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            },
            future: serchProviderF!.GetApi(),
          )),
    );
  }
}
