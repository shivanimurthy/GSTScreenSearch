import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

Future<List<GstData>> getGST(String? gst) async {
  Dio dio = Dio();
  List<GstData> g = [];
  Response response =
      await dio.get("https://dummy.digiblade.in/api/gstapi.json");
  if (response.statusCode == 200) {
    List data = response.data;
    for (dynamic i in data) {
      if (gst != i['gstno']) {
        continue;
      }
      GstData gd = GstData(
        gstno: i['gstno'],
        cname: i['cname'],
        status: i['status'],
        pplace: i['PPlace'],
        aplace: i['APlace'],
        statej: i['StateJ'],
        centrej: i['CentreJ'],
        tpt: i['TaxpayerType'],
        business: i['Business'],
        dater: i['DateR'],
        datec: i['DateC'],
      );
      g.add(gd);
    }
  }
  print(g.length);
  return g;
}

class GstData {
  final String? gstno;
  final String? cname;
  final bool? status;
  final String? pplace;
  final String? aplace;
  final String? statej;
  final String? centrej;
  final String? tpt;
  final String? business;
  final String? dater;
  final String? datec;

  GstData({
    this.gstno,
    this.cname,
    this.status,
    this.pplace,
    this.aplace,
    this.statej,
    this.centrej,
    this.tpt,
    this.business,
    this.dater,
    this.datec,
  });
}
