import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PageRegister extends StatefulWidget {
  const PageRegister({super.key});

  @override
  State<PageRegister> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PageRegister> {
  TextEditingController fullname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController tglLahir = TextEditingController();
  TextEditingController password = TextEditingController();
  String? valAgama, valJk, inputForm;
  final _formKey = GlobalKey<FormState>();

  Future selectData() async {
    DateTime? picDate = await showDatePicker(
      initialDate: DateTime.now(),
      context: context,
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );
    if (picDate != null) {
      tglLahir.text = DateFormat("dd-MM-yyyy").format(picDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text('Form Register', style: TextStyle(fontSize: 20)),
                ),
                SizedBox(height: 13),
                CostumeInput(
                  labelInput: 'Fullname',
                  controller: fullname,
                  hintText: 'John Doe',
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 13),
                CostumeInput(
                  labelInput: 'Username',
                  controller: username,
                  hintText: 'John',
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 13),
                CostumeInput(
                  labelInput: 'Email',
                  controller: email,
                  hintText: 'example@gmail.com',
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 13),
                CostumeInput(
                  labelInput: 'Tanggal Lahir',
                  controller: tglLahir,
                  hintText: '00-00-0000',
                  textInputType: TextInputType.text,
                  onTap: () {
                    selectData();
                  },
                ),
                SizedBox(height: 13),
                CostumeInput(
                  labelInput: 'Password',
                  controller: password,
                  hintText: '',
                  textInputType: TextInputType.text,
                  obscureText: true,
                ),
                SizedBox(height: 15),
                Text("Pilih Agama", style: TextStyle(fontSize: 18)),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    value: valAgama,
                    underline: Container(),
                    isExpanded: true,
                    items:
                        [
                          'Islam',
                          "Kristen Protestan",
                          "Budha",
                          "Konghucu",
                          "Kristen katolik",
                          "Hindu",
                        ].map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(e),
                            ),
                          );
                        }).toList(),
                    onChanged: (val) {
                      setState(() {
                        valAgama = val;
                      });
                    },
                  ),
                ),
                SizedBox(height: 18),
                Text('Jenis Kelamin', style: TextStyle(fontSize: 18)),
                SizedBox(height: 15),
                Row(
                  children: [
                    Flexible(
                      child: CostumeRadio(
                        groupValue: valJk.toString(),
                        value: 'pria',
                        onChanged: (val) {
                          setState(() {
                            valJk = val;
                          });
                        },
                      ),
                    ),
                    Flexible(
                      child: CostumeRadio(
                        groupValue: valJk.toString(),
                        value: 'Perempuan',
                        onChanged: (val) {
                          setState(() {
                            valJk = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18),
                CostumButton(
                  bgColor: Colors.blue,
                  labelColor: Colors.white,
                  labelButton: "Save",
                  onPressed: () {
                    setState(() {
                      // cek validasi input
                      if (_formKey.currentState!.validate()) {
                        // cek input agama dan jenis kelamin
                        if (valJk != null && valAgama != null) {
                          inputForm =
                              'Fullname: ${fullname.text}\n'
                              'Username: ${username.text}\n'
                              'Email: ${email.text}\n'
                              'Tanggal Lahir: ${tglLahir.text}\n'
                              'Agama: ${valAgama.toString()}\n'
                              'Jenis Kelamin: ${valJk.toString()}';
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                inputForm.toString(),
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Silahkan Pilih Agama dan Jenis Kelamin',
                              ),
                            ),
                          );
                        }
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CostumeInput extends StatelessWidget {
  final String labelInput;
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final VoidCallback? onTap;

  const CostumeInput({
    super.key,
    required this.labelInput,
    required this.controller,
    required this.hintText,
    required this.textInputType,
    this.obscureText = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelInput, style: TextStyle(fontSize: 18)),
        TextFormField(
          controller: controller,
          validator: (val) {
            return val!.isEmpty ? 'Input tidak boleh kosong' : null;
          }, // berfungsi untuk memproses input -> mengambil data dari input
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          keyboardType: textInputType,
          obscureText: obscureText,
          onTap: () {
            onTap?.call();
          },
        ),
      ],
    );
  }
}

class CostumeRadio extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String> onChanged;

  const CostumeRadio({
    super.key,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: RadioListTile(
        value: value,
        groupValue: groupValue,
        onChanged: (val) {
          if (val != null) {
            onChanged(val);
          }
        },
        title: Text(value),
      ),
    );
  }
}

class CostumButton extends StatelessWidget {
  final Color bgColor;
  final String labelButton;
  final VoidCallback onPressed;
  final Color labelColor;

  const CostumButton({
    super.key,
    required this.bgColor,
    required this.labelColor,
    required this.labelButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          backgroundColor: bgColor,
        ),
        onPressed: () {
          onPressed.call();
        },
        child: Text(labelButton, style: TextStyle(color: labelColor)),
      ),
    );
  }
}
