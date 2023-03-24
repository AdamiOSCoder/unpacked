import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/configure/configure.dart';
import 'package:flutter_web/constants/styles.dart';
import 'package:flutter_web/pages/login/authentication.dart';
import 'package:flutter_web/widgets/custom_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:get/get.dart';

import '../../controllers/app_info_controller.dart';

class AppDownLoadTable extends StatelessWidget {

  final AppInfoController appInfoController = Get.put(AppInfoController());

  AppDownLoadTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Configure.screenHeight(context) - 265,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.local_fire_department_rounded,
                color: Colors.red,
                size: 18,
              ),
              SizedBox(
                width: 5,
              ),
              CustomText(
                text: "下载排行榜",
                color: Colors.black,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 0.5, color: Colors.black12)),
            ),
            width: 110,
            height: 1,
          ),
          Expanded(
            child: Obx(() {
              if (appInfoController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return DataTable2(
                    columnSpacing: 0,
                    //horizontalMargin: 12,
                    minWidth: 440,
                    columns: const [
                      DataColumn2(
                        label: CustomText(text: "应用名"),
                        //size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: CustomText(text: "版本"),
                      ),
                      DataColumn(
                        label: CustomText(text: "大小"),
                      ),
                      DataColumn(
                        label: CustomText(text: "分区"),
                      ),
                      DataColumn(
                        label: CustomText(text: "人气"),
                      ),
                      DataColumn(
                        label: CustomText(text: "脱壳"),
                      ),
                      DataColumn(
                        label: CustomText(text: "下载"),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        appInfoController.hotInfoList.length,
                        (index) => DataRow(
                              cells: [
                                DataCell(Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomText(
                                        text: appInfoController
                                            .hotInfoList[index].name)
                                  ],
                                )),
                                DataCell(CustomText(
                                    text: appInfoController
                                        .hotInfoList[index].version)),
                                DataCell(CustomText(
                                    text: appInfoController
                                        .hotInfoList[index].size)),
                                DataCell(CustomText(
                                    text: appInfoController
                                        .hotInfoList[index].channel)),
                                DataCell(Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.deepOrange,
                                      size: 18,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    CustomText(
                                      text: appInfoController
                                          .hotInfoList[index].popularity,
                                    )
                                  ],
                                )),
                                DataCell(CustomText(
                                    text: appInfoController
                                        .hotInfoList[index].packed)),
                                DataCell(IconButton(
                                  onPressed: () {
                                    Get.to(() => AuthenticationPage());
                                  },
                                  icon: Icon(Icons.download,
                                      color: Colors.black.withOpacity(.6)),
                                ))
                              ],
                              //color:MaterialStateProperty.all<Color>(Colors.red)
                            )));
              }
            }),
          ) /**/
        ],
      ),
    );
  }
}
