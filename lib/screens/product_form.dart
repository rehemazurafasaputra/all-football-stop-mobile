import 'package:flutter/material.dart';
import 'package:all_football_stop/widgets/left_drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:all_football_stop/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _stock = 0;
  int _price = 0;
  String _description = "";
  String _category = "other"; // default
  String _thumbnail = "";
  bool _isFeatured = false; // default

  final List<String> _categories = [
    'bola',
    'shoes',
    'other',
  ];


  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Product',
          ),
        ),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      drawer: LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Name ===
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Nama Produk",
                        labelText: "Nama Produk",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _name = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Nama Produk tidak boleh Kosong!";
                      }
                      return null;
                    },
                  )
              ),
              // === Stock ===
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Stock",
                        labelText: "Stock",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _stock = int.parse(value);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Stok tidak boleh kosong.';
                      }
                      final n = num.tryParse(value);
                      if (n == null) {
                        return 'Please enter a valid number.';
                      }
                      // Check if the parsed number is actually an integer (no decimal part).
                      if (n != n.toInt()) {
                        return 'Please enter a whole number.';
                      }
                      if (n.toInt() < 0) {
                        return 'Stok tidak boleh negatif.';
                      }
                      return null; // Input is a valid integer.
                    },
                  )
              ),
              // === Price ===
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Price",
                        labelText: "Price",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _price = int.parse(value);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Price tidak boleh kosong.';
                      }
                      final n = num.tryParse(value);
                      if (n == null) {
                        return 'Please enter a valid number.';
                      }
                      // Check if the parsed number is actually an integer (no decimal part).
                      if (n != n.toInt()) {
                        return 'Please enter a whole number.';
                      }
                      if (n.toInt() < 0) {
                        return 'Price tidak boleh negatif.';
                      }
                      return null; // Input is a valid integer.
                    },
                  )
              ),
              // === Description ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Deskripsi Produk",
                    labelText: "Deskripsi Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi Produk tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              // === Category ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Kategori",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  value: _category,
                  items: _categories
                      .map((cat) => DropdownMenuItem(
                    value: cat,
                    child: Text(
                        cat[0].toUpperCase() + cat.substring(1)),
                  ))
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _category = newValue!;
                    });
                  },
                ),
              ),
              // === Thumbnail URL ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "URL Thumbnail",
                    labelText: "URL Thumbnail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _thumbnail = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a URL';
                    }
                    try {
                      if (!Uri.parse(value).isAbsolute) {
                        return 'Please enter a valid absolute URL (e.g., http://example.com)';
                      }
                    } on FormatException {
                      return 'Please enter a valid URL';
                    }
                    return null; // Return null if the URL is valid
                  },
                ),
              ),
              // === Is Featured ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwitchListTile(
                  title: const Text("Tandai sebagai Produk Unggulan"),
                  value: _isFeatured,
                  onChanged: (bool value) {
                    setState(() {
                      _isFeatured = value;
                    });
                  },
                ),
              ),
              // === Tombol Simpan ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.orange),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // TODO: Replace the URL with your app's URL
                        // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
                        // If you using chrome,  use URL http://localhost:8000

                        final response = await request.postJson(
                          "http://localhost:8000/add-flutter/",
                          jsonEncode({
                            "name": _name,
                            "stock": _stock,
                            "price": _price,
                            "description": _description,
                            "thumbnail": _thumbnail,
                            "category": _category,
                            "is_featured": _isFeatured,
                          }),
                        );
                        if (context.mounted) {
                          if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Product successfully saved!"),
                            ));
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()),
                            );
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Something went wrong, please try again."),
                            ));
                          }
                        }
                      }
                    },
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}