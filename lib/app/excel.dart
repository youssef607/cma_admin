import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:excel/excel.dart';


exportCategoriesToExcel(List<Category> categories) {
  var excel = Excel.createExcel();
  var sheetObject = excel[excel.getDefaultSheet() ?? EMPTY];
  List<String> columns = [
    "Id",
    "Label",
    "CreatedAt",
    "Active",
  ];
  sheetObject.appendRow(columns);
  for (var category in categories) {
    sheetObject.appendRow([category.id,category.label,category.createdAt,category.active,]);
  }
  excel.save(fileName: "Categories.xlsx");
}

exportProductsToExcel(List<Product> products) {
  var excel = Excel.createExcel();
  var sheetObject = excel[excel.getDefaultSheet() ?? EMPTY];
  List<String> columns = [
    "Id",
    "Title",
    "Price (DH)",
    "CreatedAt",
    "Active",
    "Category Id",
  ];
  sheetObject.appendRow(columns);
  for (var product in products) {
    sheetObject.appendRow([product.id,product.title,product.price,product.createdAt,product.active,product.category?.id]);
  }
  excel.save(fileName: "Products.xlsx");
}

exportSupplementsToExcel(List<Supplement> supplements) {
  var excel = Excel.createExcel();
  var sheetObject = excel[excel.getDefaultSheet() ?? EMPTY];
  List<String> columns = [
    "Id",
    "Title",
    "Price (DH)",
    "CreatedAt",
    "Active",
  ];
  sheetObject.appendRow(columns);
  for (var supplement in supplements) {
    sheetObject.appendRow([supplement.id,supplement.title,supplement.price,supplement.createdAt,supplement.active]);
  }
  excel.save(fileName: "Supplements.xlsx");
}
