import 'package:codigo6_books/widgets/common_textfield_widget.dart';
import 'package:flutter/material.dart';

class FormBookModal extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final _myFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36.0),
          topRight: Radius.circular(36.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _myFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Agregar libro",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              CommonTextFieldWidget(
                hintText: "Ingresa un título",
                icon: Icons.rocket,
                label: "Título",
                controller: _titleController,
              ),
              CommonTextFieldWidget(
                hintText: "Ingresa un autor",
                icon: Icons.person,
                label: "Autor",
                controller: _authorController,
              ),
              CommonTextFieldWidget(
                hintText: "Ingresa el url de la portada",
                icon: Icons.image,
                label: "Portadaaaa",
                controller: _imageController,
              ),
              CommonTextFieldWidget(
                hintText: "Ingresa una descripción",
                icon: Icons.view_headline,
                label: "Descripción",
                maxLines: 4,
                controller: _descriptionController,
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    _myFormKey.currentState!.validate();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff22223b),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                  ),
                  child: const Text(
                    "Agregar",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
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
