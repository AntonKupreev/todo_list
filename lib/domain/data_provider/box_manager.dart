
import 'package:hive/hive.dart';
import 'package:todo_list/domain/entity/group.dart';
class  BoxManager {
 Future<Box<Group>> openGroupBox() async{
   return _openBox('group_box', 1, GroupAdapter());
 }
 Future<Box<Task>> openTaskBox() async{
   return _openBox('tasks_box', 2, TaskAdapter());
 }

 Future<Box<T>>_openBox<T>(String name,
  int typeID,
  TypeAdapter<T>adapter,
  ) async {
   if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(adapter);
    }

    return Hive.openBox<T>('group_box');
 }
}