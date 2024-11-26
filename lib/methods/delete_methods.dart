import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api_client/api_req.dart';
import '../providers/task_provider.dart';

deleteMethod(context,taskId,WidgetRef ref){
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Task"),
          content: const Text("Do you want to delete?"),
          actions: [
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.blue),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("No ", style: TextStyle(color: Colors.white))),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.red),
                    onPressed: () async {
                      await deleteTask(taskId);
                      ref.invalidate(searchTaskProvider);
                      ref.invalidate(taskProvider);
                      if (!context.mounted) return;
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Yes",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            )
          ],
        );
      });
}