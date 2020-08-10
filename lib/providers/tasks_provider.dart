import 'package:flutter/cupertino.dart';
import '../helpers/db_helper.dart';
import '../models/task.dart';

class TasksProvider extends ChangeNotifier{

  List<Task> allTasks=[];
void fetchData()async{
  allTasks= await DbHelper.instence.getData();
  notifyListeners();
}
  List<Task> getAllTasks(){
  fetchData();
    return [...allTasks];
  }
  List<Task> getCompletedTasks(){
    fetchData();
    return [...allTasks.where((element) => element.isCompleted)];
  }
  List<Task> getIncompletedTasks(){
    fetchData();
    return [...allTasks.where((element) => !element.isCompleted)];
  }
  void toggleIscompleted(Task task){
   
 DbHelper.instence.updateIscomplete(task);
notifyListeners();
  }

  void addTask(Task task){
    allTasks.add(task);
    DbHelper.instence.insertTask(task.toJson());
    notifyListeners();
  }
}