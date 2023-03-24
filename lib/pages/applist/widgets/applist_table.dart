import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/constants/styles.dart';
import 'package:flutter_web/controllers/app_info_controller.dart';
import 'package:flutter_web/widgets/custom_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:get/get.dart';
import '../../../helpers/responsiveness.dart';
import '../../login/authentication.dart';

class AppListTable extends StatelessWidget {
  final AppInfoController appInfoController = Get.put(AppInfoController());
  AppListTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
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
      padding: const EdgeInsets.all(16),
      // margin: const EdgeInsets.only(bottom: 30),
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
                  appInfoController.appInfoList.length,
                  (index) => DataRow(
                        cells: [
                          DataCell(Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                text: appInfoController.appInfoList[index].name,
                                size: ResponsiveWidget.isSmallScreen(context)
                                    ? 14
                                    : 16,
                              )
                            ],
                          )),
                          DataCell(CustomText(
                            text: appInfoController.appInfoList[index].version,
                            size: ResponsiveWidget.isSmallScreen(context)
                                ? 14
                                : 16,
                          )),
                          DataCell(CustomText(
                              text: appInfoController.appInfoList[index].size,
                              size: ResponsiveWidget.isSmallScreen(context)
                                  ? 14
                                  : 16)),
                          DataCell(CustomText(
                              text:
                                  appInfoController.appInfoList[index].channel,
                              size: ResponsiveWidget.isSmallScreen(context)
                                  ? 14
                                  : 16)),
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
                                    .appInfoList[index].popularity,
                                size: ResponsiveWidget.isSmallScreen(context)
                                    ? 14
                                    : 16,
                              )
                            ],
                          )),
                          DataCell(CustomText(
                              text: appInfoController.appInfoList[index].packed,
                              size: ResponsiveWidget.isSmallScreen(context)
                                  ? 14
                                  : 16)),
                          DataCell(
                            IconButton(
                              onPressed: () {
                                Get.to(() => AuthenticationPage());
                              },
                              icon: Icon(
                                Icons.download,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          )
                        ],
                        //color:MaterialStateProperty.all<Color>(Colors.red)
                      )));
        }
      }),
    );
  }
}
