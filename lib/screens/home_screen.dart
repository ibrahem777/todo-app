import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/tasks_provider.dart';
import './all_tasks_screen.dart';
import './completed_tasks_screen.dart';
import './incompleted_tasks_screen.dart';
import '../widgets/tab_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String title;
  String description;
  saveTitleField(val){
this.title=val;
  }
   saveDescriptionField(val){
this.description=val;
  }
  confirmForm(){
   
      _formKey.currentState.save();
      Task atask=Task(title: this.title,description: this.description);
      Provider.of<TasksProvider>(context,listen: false).addTask(atask);

    
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TodoApp'),
          centerTitle: true,
          bottom: TabBar(tabs: [
            TabWidget('AllTasks'),
            TabWidget('CompletedTasks'),
            TabWidget('IncompletedTasks'),
          ]),
        ),
        body: TabBarView(children: [
          AllTasksScreen(),
          CompletedTasksScreen(),
          IncompletedTasksScreen(),
        ]),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              _settingModalBottomSheet(context, _formKey,saveTitleField,saveDescriptionField,confirmForm);
            }),
      ),
    );

  }

}

void _settingModalBottomSheet(context, formKey,saveTitleField,saveDescriptionField,confirmForm) {
  showModalBottomSheet(
   isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return Container(
           height: MediaQuery.of(context).size.height / 2 +
                MediaQuery.of(context).viewInsets.bottom,
          child: Form(
              key: formKey,
              child: Column(
                  
                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextFormField(
                        onSaved: (val){saveTitleField(val);},
                        decoration: InputDecoration(
                          labelText: 'enter task title',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10))),
                      ),
                      TextFormField(
                         onSaved: (val){saveDescriptionField(val);},
                        decoration: InputDecoration(
                          labelText: 'enter task description',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10))),
                      ),
                      RaisedButton(child:Text('confirm'),onPressed: (){
                        confirmForm();

                      })
                    ],
                  )),
        );
      });
}
