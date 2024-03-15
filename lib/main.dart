import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myName = TextEditingController();
  final myPassword = TextEditingController();
  final myEmail = TextEditingController();
  final myContact = TextEditingController();
  final myAddress = TextEditingController();
  @override
  void dispose() {
    myName.dispose();
    super.dispose();
  }

  List<String> checkboxvalue = [];
  void _onCheckedboxChanged(String value, bool isChecked) {
    setState(() {
      if (isChecked) {
        checkboxvalue.add(value);
      } else {
        checkboxvalue.remove(value);
      }
    });
  }

  String dropdownvalue = '--SelectGroup--';
  var items = [
    '--SelectGroup--',
    'Bca',
    'Mca',
    'Msc cs',
  ];
  String dropdownvaluebutton = '--SelectGroup--';
  var item = [
    '--SelectGroup--',
    'Mechanical',
    'Civil',
    'Electronics',
  ];

  String _selectedValue = '';
  void type(String? value) {
    setState(() {
      _selectedValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  color: Colors.lightGreen,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Personal Details',
                      style: TextStyle(fontSize: 30, color: Colors.red),
                    ),
                    Row(
                      children: <Widget>[
                        Text('Name:              '),
                        Expanded(
                          child: TextField(
                            controller: myName,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('Password:       '),
                            Expanded(
                              child: TextField(
                                controller: myPassword,
                                obscureText: true,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text('Email-id:          '),
                                Expanded(
                                  child: TextField(
                                    controller: myEmail,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text('Gender:        '),
                                    Expanded(
                                      child: RadioListTile(
                                        title: Text('male'),
                                        value: 'male',
                                        groupValue: _selectedValue,
                                        onChanged: type,
                                      ),
                                    ),
                                    Expanded(
                                      child: RadioListTile(
                                        title: Text('Female'),
                                        value: 'Female',
                                        groupValue: _selectedValue,
                                        onChanged: type,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text('Contact#:        '),
                                        Expanded(
                                          child: TextField(
                                            controller: myContact,
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('Educational Qualification',
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.red)),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                                'Degree:                          '),
                                            DropdownButton(
                                              value: dropdownvalue,
                                              icon: Icon(
                                                  Icons.keyboard_arrow_down),
                                              items: items.map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  dropdownvalue = newValue!;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                    'Engineering:                 '),
                                                DropdownButton(
                                                  value: dropdownvaluebutton,
                                                  icon: Icon(Icons
                                                      .keyboard_arrow_down),
                                                  items:
                                                      item.map((String items) {
                                                    return DropdownMenuItem(
                                                      value: items,
                                                      child: Text(items),
                                                    );
                                                  }).toList(),
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      dropdownvaluebutton =
                                                          newValue!;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                        'Hobbies:                  '),
                                                    Expanded(
                                                      child: CheckboxListTile(
                                                        title: const Text(
                                                            'Driving'),
                                                        value: checkboxvalue
                                                            .contains(
                                                                'Driving'),
                                                        onChanged: (isChecked) {
                                                          _onCheckedboxChanged(
                                                              'Driving',
                                                              isChecked!);
                                                        },
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .leading,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: CheckboxListTile(
                                                        title: const Text(
                                                            'Playing Cricket'),
                                                        value: checkboxvalue
                                                            .contains(
                                                                'Playing Cricket'),
                                                        onChanged: (isChecked) {
                                                          _onCheckedboxChanged(
                                                              'Playing Cricket',
                                                              isChecked!);
                                                        },
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .leading,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      'Address',
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color: Colors.red),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    TextField(
                                                      controller: myAddress,
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                      ),
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text('Attach Resume:'),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) => DetailScreen(
                                                                    name: myName
                                                                        .text,
                                                                    password:
                                                                        myPassword
                                                                            .text,
                                                                    email: myEmail
                                                                        .text,
                                                                    selectedValue:
                                                                        _selectedValue,
                                                                    contact:
                                                                        myContact
                                                                            .text,
                                                                    dropdownValue:
                                                                        dropdownvalue,
                                                                    dropdownvaluebutton:
                                                                        dropdownvaluebutton,
                                                                    checkboxvalue:
                                                                        checkboxvalue,
                                                                    address:
                                                                        myAddress
                                                                            .text),
                                                              ),
                                                            );
                                                          },
                                                          child: const Text(
                                                            'SUBMIT',
                                                            style: TextStyle(color: Colors.red),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    Key? key,
    required this.name,
    required this.password,
    required this.email,
    required this.selectedValue,
    required this.contact,
    required this.dropdownValue,
    required this.dropdownvaluebutton,
    required this.checkboxvalue,
    required this.address,
  }) : super(key: key);
  final String name;
  final String password;
  final String email;
  final String selectedValue;
  final String contact;
  final String dropdownValue;
  final String dropdownvaluebutton;
  final String address;
  final List<String> checkboxvalue;
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(
            'Name:${widget.name}',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Password:${widget.password}',
                style: TextStyle(fontSize: 30),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Email-id:${widget.email}',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Gender: ${widget.selectedValue}',
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Contact:${widget.contact}',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Degree: ${widget.dropdownValue}',
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Engineering: ${widget.dropdownvaluebutton}',
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Hobbies: ${widget.checkboxvalue}',
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Address:${widget.address}',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 180,
                  ),
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
