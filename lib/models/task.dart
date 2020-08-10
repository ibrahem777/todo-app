import '../helpers/db_helper.dart';

class Task{
  int id;
  String title;
  String description;
  bool isCompleted;
  Task({this.title,this.description,this.isCompleted=false});

  void toggleIsCompleted(){
    isCompleted = !isCompleted;
  }

  Task.fromJson(Map<String,dynamic>map){
    this.id=map[DbHelper.idColumnName];
this.title=map[DbHelper.titleColumnName];
this.description=map[DbHelper.descriptionColumnName];
this.isCompleted=map[DbHelper.isCompleteColumnName]==1?true:false;


  }
  Map<String,dynamic>toJson(){
    Map<String,dynamic> map=Map<String,dynamic>();
    map[DbHelper.titleColumnName]=this.title;
    map[DbHelper.descriptionColumnName]=this.description;
    map[DbHelper.isCompleteColumnName]=this.isCompleted?1:0;
    return map;
    
  }
}