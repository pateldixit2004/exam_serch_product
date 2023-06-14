import 'package:exam_serch_product/screen/model/pro_model.dart';
import 'package:exam_serch_product/screen/model/serchModel.dart';
import 'package:exam_serch_product/utils/api_helper.dart';
import 'package:flutter/foundation.dart';

class SerchProvider extends ChangeNotifier
{

  // List<SerchModel> proLsit=[];
  Future<SerchModel> GetApi()
  async {
    SerchModel serchModel=await Api_Helper.api_helper.getApi();
    return serchModel;
  }
  Future<ProModel> Api()
  async {
    ProModel proModel =await Api_Helper.api_helper.api();
    return proModel;
  }

  // List<SerchModel> list=[];
  // List<SerchModel> ferterList=[];
  // void productSerch(String serch)
  // {
  //   if(serch.isEmpty)
  //     {
  //       list=proLsit;
  //     }
  //   else
  //     {
  //       ferterList.clear();
  //       for(var c in proLsit)
  //         {
  //           if(c.data!.contains(serch.toLowerCase()))
  //           {
  //             ferterList.add(c);
  //           }
  //         }
  //     }
  // }
}