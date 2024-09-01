import 'package:flutter/material.dart';
//styles
import 'package:simple_games/styles/app_colors.dart';

//----------------------------------------------------

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.buttonColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Shadow color
            spreadRadius: 2, // How much the shadow spreads
            blurRadius: 5, // How blurry the shadow is
            offset: const Offset(0, 3), // Offset of the shadow
          ),
        ],
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          maxLength: 1, // Limit input to 1 character
          keyboardType: TextInputType.number, // Show numeric keyboard
          textAlign: TextAlign.center, // Center the text
          style: const TextStyle(
            fontSize: 24, // Set font size to be larger
            fontWeight: FontWeight.bold, // Make the font bold (optional)
          ),
          decoration: const InputDecoration(
            counterText: '', // Hide the counter text for maxLength
            border: InputBorder.none, // Remove the default underline
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return ''; // Return empty string to indicate an error
            }
            return null; // Return null if the input is valid
          },
        ),
      ),
    );
  }
}
