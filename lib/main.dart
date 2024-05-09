import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "Home",
    home: MyApp(),
  ));
}

class LoginData{
  String username ="";
  String password="";
}

class SignupData{
  String username ="";
  String password="";
  String confirmPassword="";
}

class UserName{
  String name="";
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Transport App",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Transport App"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              const Text("Welcome to Transport app",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue)
                ,),
                ElevatedButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> LogIn()));
                },
                    child: const Text("Login")),

                const Text("Or",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue
                  ),),

                  ElevatedButton(onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> SignUp()));
                  },
                      child: const Text("Signup"))

            ],
          ),
        ),
      ),
    );
  }

}

class LogIn extends StatelessWidget{
  final LoginData _loginData= LoginData();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Log In"),
          automaticallyImplyLeading: true,
          leading: IconButton(icon: const Icon(Icons.arrow_back),onPressed: ()=>
            Navigator.pop(context),),
        ),
        body: Container(
          padding: const EdgeInsets.all(50.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator :(value){
                    if(value!.isEmpty){
                      return 'Please enter username';
                    }
                    return null;
                  },
                  onSaved: (value){
                    _loginData.username = value!;
                  },
                  decoration: const InputDecoration(
                    hintText: "none@none.com",
                    labelText: 'Username (Email address)',
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  validator: (value){
                    if (value!.length < 10){
                      return "Password must be more than 10 characters";
                    }
                    return null;
                  },
                  onSaved: (value){
                    _loginData.password = value!;
                  },
                  decoration: const InputDecoration(
                      hintText: "Password",
                      labelText: 'Password'
                  ),
                ),
                ElevatedButton(
                    child: const Text("Log In!"),
                    onPressed: (){
                      if (_formkey.currentState!.validate()) {
                        (
                          _formkey.currentState!.save()
                      );

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> const Application()));
                      }
                      print("Username: ${_loginData.username}");
                      print("Password: ${_loginData.password}");
                    }
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }

}

class SignUp extends StatelessWidget{
  final SignupData _SignupData= SignupData();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _pass= TextEditingController();
  final TextEditingController _confirmPass= TextEditingController();

  SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Sign Up"),
          automaticallyImplyLeading: true,
          leading: IconButton(icon: const Icon(Icons.arrow_back),onPressed: ()=>
              Navigator.pop(context),),
        ),
        body: Container(
          padding: const EdgeInsets.all(50.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator :(value){
                    if(value!.isEmpty){
                      return 'Please enter username';
                    }
                    return null;
                  },
                  onSaved: (value){
                    _SignupData.username = value!;
                  },
                  decoration: const InputDecoration(
                    hintText: "none@none.com",
                    labelText: 'Username (Email address)',
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  controller: _pass,
                  validator: (value){
                    if (value!.length < 10){
                      return "Password must be more than 10 characters";
                    }
                    return null;
                  },
                  onSaved: (value){
                    _SignupData.password = value!;
                  },
                  decoration: const InputDecoration(
                      hintText: "Password",
                      labelText: 'Password'
                  ),
                ),
                TextFormField(
                  controller: _confirmPass,
                  obscureText: true,
                  validator: (value){
                    if (value!.isEmpty){
                      return "Password must be more than 10 characters";
                    }
                    if (value != _pass.text){
                      return "Password must be the same as above";
                    }
                    return null;
                  },
                  onSaved: (value){
                    _SignupData.confirmPassword = value!;
                  },
                  decoration: const InputDecoration(
                      hintText: "Password",
                      labelText: 'Confirm Password'
                  ),
                ),
                ElevatedButton(
                    child: const Text("Sign Up!"),
                    onPressed: (){
                      if (_formkey.currentState!.validate()) {
                        (
                          _formkey.currentState!.save()

                      );
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> PersonalInfo()));
                      }
                      print("Username: ${_SignupData.username}");
                      print("Password: ${_SignupData.password}");


                    }
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }

}

// ignore: must_be_immutable
class PersonalInfo extends StatelessWidget{

   // ignore: non_constant_identifier_names
   final UserName _UserName= UserName();
  String dropVal="States";


  PersonalInfo({super.key});
  final TextEditingController _date= TextEditingController();

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: true,
            leading: IconButton(icon: const Icon(Icons.arrow_back),onPressed: ()=>
                Navigator.pop(context),),
            title: const Text("Personal Information"),
          ),
          body: Container(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                const Text("Please enter your personal information",style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center),
                const Divider(),
                const Text("Enter Your Full name",style: TextStyle(fontSize: 16),),
                TextFormField(
                  obscureText: false,
                  validator :(value){
                    if(value!.isEmpty){
                      return 'Please enter Full name';
                    }
                    return null;
                  },
                  onSaved: (value){
                    _UserName.name = value!;
                  },
                  decoration: const InputDecoration(
                    hintText: "E.g Jane doe",
                  ),
                ),
                const Text("Enter Your Gender",style: TextStyle(fontSize: 16),),
                DropdownButtonFormField(
                  hint: const Text("Select an item"),
                      onChanged: (newValue){
                          dropVal= newValue!;
                    },
                      items: ["Male", "Female"].map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(value: value, child:Text(value),);
                      }).toList(),
                    ),
                const Divider(),
                const Text("Select Your Date of birth",style: TextStyle(fontSize: 16),),
                TextFormField(
                  controller: _date,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today_rounded),
                      labelText: " Select Date"
                  ),
                  onTap: () async{
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2024)
                    );
                    if(pickedDate != null){

                      String a=pickedDate.day.toString();
                      String b=pickedDate.month.toString();
                      String c=pickedDate.year.toString();
                      _date.text= '$a-$b-$c';
                    }

                  },
                ),
                ElevatedButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> Application()));
                    },
                    child: const Text("Proceed")
                ),

              ],
            ),
          )
        ),
      );
    }

  }

class Application extends StatelessWidget{
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[

              const Expanded(
                child:
              Align( alignment: Alignment.bottomCenter,
              ),),

              SizedBox(
                height: 50,
                width: 300,
                child:
                  ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyApp()));
                      }, child: const Text("Signout"))
              )
            ],
          )
        ),
        appBar: AppBar(
          title: const Text("Application Page"),
        ),
        body: Column(
          children: const [
            Text('To Be Done'),
          ],
        ),
      ),
    );
  }
}
