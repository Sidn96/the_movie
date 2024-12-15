import 'dart:convert';

import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:universal_html/html.dart' as html;

Future<void> exportExcel({
  required List<String> columnNames,
  required List<List<String>> rowData,
  required String fileName,
}) async {
  var excel = Excel.createExcel();
  var sheet = excel['Sheet1'];

  // Add column headers in the first row
  for (int col = 0; col < columnNames.length; col++) {
    sheet
        .cell(CellIndex.indexByString("${String.fromCharCode(65 + col)}1"))
        .value = columnNames[col]; // Setting column names as headers
  }

  // Populate the sheet with row data
  for (int row = 0; row < rowData.length; row++) {
    List<String> rowAsStrings = _convertRowToStrings(rowData[row]);

    for (int col = 0; col < rowAsStrings.length; col++) {
      sheet
          .cell(CellIndex.indexByString(
              "${String.fromCharCode(65 + col)}${row + 2}"))
          .value = rowAsStrings[col]; // Insert converted row data
    }
  }

  // Export the Excel file as a binary stream
  var bytes = excel.encode();

  if (kIsWeb) {
    if (bytes != null) {
      // Convert the binary data to a base64 string
      String base64String = base64Encode(Uint8List.fromList(bytes));

      // Create a download link for the file
      final blob = html.Blob([base64Decode(base64String)]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..target = 'blank'
        ..download = '$fileName.xlsx';

      // Trigger a click event to download the file
      anchor.click();

      // Clean up the URL object
      html.Url.revokeObjectUrl(url);
    }
  } else {
    // Request storage permissions if needed
    PermissionStatus permission = await Permission.storage.request();
    if (permission.isGranted) {
      // Get the app's directory to store the file
      String path = "storage/emulated/0/Download";

      // Save the Excel file
      String filePath = '$path/$fileName.xlsx';
      File(filePath)
        ..createSync(recursive: true)
        ..writeAsBytesSync(excel.encode()!);

      // Optionally, open the file
      // await OpenFilex.open(filePath);
      print('Excel file saved at: $filePath');
    } else {
      print('Storage permission is required to save the file.');
    }
  }
}

/// Converts a row of type T to a List<String>
/// You can extend this function to handle more complex objects.
List<String> _convertRowToStrings<T>(T row) {
  // Handle if the row is a Map
  if (row is Map) {
    // Return the values of the Map as a List<String>
    return row.values.map((e) => e.toString()).toList();
  }
  // Handle if the row is a List (e.g., for lists of basic types)
  else if (row is List) {
    return row.map((e) => e.toString()).toList();
  }
  // Handle single types, convert them to List<String> containing the single value
  else {
    return [row.toString()];
  }
}
