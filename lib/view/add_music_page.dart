import 'package:flutter/material.dart';
import 'package:music/view/common/common_text_field.dart';
import 'package:music/view_model/add_music_view_model.dart';
import 'package:provider/provider.dart';

class AddmusicPage extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _artistController = TextEditingController();

  AddmusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Müzik Ekle",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                _buildNameTextField(),
                SizedBox(height: 16),
                _buildTypeTextField(),
                SizedBox(height: 16),
                _buildartistTextField(),
              ],
            ),
            _buildAddmusicButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildNameTextField() {
    return CommonTextField(
      controller: _nameController,
      label: "Name",
    );
  }

  Widget _buildTypeTextField() {
    return CommonTextField(
      controller: _typeController,
      label: "Type",
    );
  }

  Widget _buildartistTextField() {
    return CommonTextField(
      controller: _artistController,
      label: "artist",
    );
  }

  Widget _buildAddmusicButton(BuildContext context) {
    AddmusicViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
      child: Text(
        "Müzik Ekle",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        viewModel.addmusic(
          context,
          _nameController.text.trim(),
          _typeController.text.trim(),
          _artistController.text.trim(),
        );
      },
    );
  }
}
