import 'package:flutter/material.dart';

class PageMahasiswa extends StatefulWidget {
  const PageMahasiswa({super.key});

  @override
  State<PageMahasiswa> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PageMahasiswa> {
  TextEditingController nim = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController tlp = TextEditingController();
  TextEditingController alamat = TextEditingController();
  String? jurusan, prodi, inputForm;
  final _formKey = GlobalKey<FormState>();

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
                  child: Text('Form Mahasiswa', style: TextStyle(fontSize: 20)),
                ),
                SizedBox(height: 13),
                CostumeInput(
                  labelInput: 'nim',
                  controller: nim,
                  hintText: '0000000000',
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 13),
                CostumeInput(
                  labelInput: 'nama',
                  controller: nama,
                  hintText: 'John Doe',
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 13),
                CostumeInput(
                  labelInput: 'tlp',
                  controller: tlp,
                  hintText: '081234567890 ',
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 15),
                Text("Jurusan", style: TextStyle(fontSize: 18)),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    value: jurusan,
                    underline: Container(),
                    isExpanded: true,
                    items:
                        ['TI', "Mesi", "Elektro"].map((e) {
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
                        jurusan = val;
                      });
                    },
                  ),
                ),
                SizedBox(height: 18),
                Text('Prodi', style: TextStyle(fontSize: 18)),
                SizedBox(height: 15),
                Row(
                  children: [
                    Flexible(
                      child: CostumeRadio(
                        groupValue: prodi.toString(),
                        value: 'TEKOM',
                        onChanged: (val) {
                          setState(() {
                            prodi = val;
                          });
                        },
                      ),
                    ),
                    Flexible(
                      child: CostumeRadio(
                        groupValue: prodi.toString(),
                        value: 'MI',
                        onChanged: (val) {
                          setState(() {
                            prodi = val;
                          });
                        },
                      ),
                    ),
                    Flexible(
                      child: CostumeRadio(
                        groupValue: prodi.toString(),
                        value: 'TRPL',
                        onChanged: (val) {
                          setState(() {
                            prodi = val;
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
                        if (prodi != null && jurusan != null) {
                          inputForm =
                              'nim: ${nim.text}\n'
                              'nama: ${nama.text}\n'
                              'tlp: ${tlp.text}\n'
                              'jurusan: ${jurusan.toString()}\n'
                              'prodi: ${prodi.toString()}';
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(inputForm.toString())),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Silahkan Pilih Jurusan dan Prodi'),
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
