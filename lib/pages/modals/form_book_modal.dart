import 'package:codigo6_books/widgets/common_textfield_widget.dart';
import 'package:flutter/material.dart';

class FormBookModal extends StatelessWidget {
  const FormBookModal({super.key});

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
            ),
            CommonTextFieldWidget(
              hintText: "Ingresa un autor",
              icon: Icons.person,
              label: "Autor",
            ),
            CommonTextFieldWidget(
              hintText: "Ingresa el url de la portada",
              icon: Icons.image,
              label: "Portadaaaa",
            ),
            CommonTextFieldWidget(
              hintText: "Ingresa una descripción",
              icon: Icons.view_headline,
              label: "Descripción",
              maxLines: 4,
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff22223b),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                ),
                child: Text(
                  "Agregar",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
