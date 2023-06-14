import 'package:exam_serch_product/screen/model/pro_model.dart';
import 'package:exam_serch_product/screen/model/serchModel.dart';
import 'package:exam_serch_product/screen/provider/serch_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  SerchProvider? serchProviderF;
  SerchProvider? serchProviderT;
  @override
  Widget build(BuildContext context) {
    serchProviderF = Provider.of<SerchProvider>(context, listen: false);
    serchProviderT = Provider.of<SerchProvider>(context, listen: true);


    return SafeArea(child: Scaffold(
      body:  FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ProModel? proModel = snapshot.data as ProModel?;
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
                        return Container(
                          height: 50,
                          width: 100,
                          child: Text("${proModel!.data![index].price}"),
                        );

                        
                      },
                      itemCount: proModel!.data?.length
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
