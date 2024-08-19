import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pak_voyage/APIs/firebase_services.dart';
import 'package:pak_voyage/Screens/Profile/Provider/profile_provider.dart';
import 'package:pak_voyage/Screens/Sign%20in/Ui/sign_in_screen.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context, listen: false);
    TextEditingController nameController = TextEditingController();
    TextEditingController passController = TextEditingController();

    nameController.text = FirebaseServices.userDetail.name;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff22c1c3),
        title: const Text('Profile'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 19,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => signOut(context),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.logout_sharp,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xff22c1c3),
              Color.fromARGB(255, 250, 229, 183),
            ])),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture Container
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey[300],
                        image: const DecorationImage(
                          image: AssetImage('assets/images/default dp.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Consumer<ProfileProvider>(
                        builder: (context, profileProvider, child) {
                          final imageFile = profileProvider.image;
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: imageFile != null
                                ? Image.file(File(imageFile.path))
                                : CachedNetworkImage(
                                    imageUrl:
                                        FirebaseServices.userDetail.profilePic,
                                    fit: BoxFit.cover,
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      'assets/images/default dp.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 10,
                      child: InkWell(
                        onTap: () {
                          Provider.of<ProfileProvider>(context, listen: false)
                              .getImage();
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey[300],
                          ),
                          child: const Icon(
                            Icons.camera_enhance_rounded,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Name Field
              Text("Name",
                  style: StyledTheme.styledFonts
                      .copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 5),
              textField(
                  nameController, FirebaseServices.userDetail.name, false),
              const SizedBox(
                height: 15,
              ),
              Text("Password",
                  style: StyledTheme.styledFonts
                      .copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 5),
              textField(
                passController,
                '****',
                true,
              ),

              const SizedBox(
                height: 100,
              ),

              Center(
                child: SizedBox(
                  width: 230,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.support_agent_rounded,
                              color: Colors.black),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Costumer Support",
                            style: StyledTheme.styledFonts.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.call, size: 18, color: Colors.blue),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "03024842293",
                            style: StyledTheme.styledFonts
                                .copyWith(color: Colors.blue),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.mail,
                            size: 18,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "pakvoyageapp@gmail.com",
                            style: StyledTheme.styledFonts
                                .copyWith(color: Colors.blue),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              GestureDetector(
                onTap: () async {
                  log('User ID: ${FirebaseServices.userDetail.id}');
                  String? profilePic = provider.image?.path ?? '';
                  await updateProfile(nameController.text, passController.text,
                      profilePic, context);
                },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blue[300],
                  ),
                  child: Center(
                    child: Text(
                      "Save",
                      style: StyledTheme.styledFonts
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProfile(
      String? name, String? pass, String? imgPath, BuildContext context) async {
    String userId = FirebaseServices.userDetail.id;
    User? user = FirebaseAuth.instance.currentUser;

    // Update name
    if (name != null && name.isNotEmpty) {
      try {
        await FirebaseServices.firestore
            .collection('users')
            .doc(userId)
            .update({'name': name});
        await FirebaseServices.getUserDetail();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to update name')),
        );
      }
    }

    // Update password
    if (pass != null && pass.isNotEmpty) {
      if (user != null) {
        try {
          String currentPassword = await _promptForCurrentPassword(context);
          AuthCredential credential = EmailAuthProvider.credential(
            email: user.email!,
            password: currentPassword,
          );
          await user.reauthenticateWithCredential(credential);
          await user.updatePassword(pass);
          await FirebaseAuth.instance.signOut();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password updated successfully')),
          );
        } catch (e) {
          print('Error updating password: $e');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to update password')),
          );
        }
      }
    }

    // Update image
    if (imgPath != null && imgPath.isNotEmpty) {
      try {
        String? imageUrl = await uploadImageAndGetUrl(imgPath);
        if (imageUrl != null) {
          await FirebaseServices.firestore
              .collection('users')
              .doc(userId)
              .update({'profilePic': imageUrl});
          await FirebaseServices.getUserDetail();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Profile picture updated successfully')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to upload image')),
          );
        }
      } catch (e) {
        print('Error updating image: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to update image')),
        );
      }
    }
  }

  Future<String?> uploadImageAndGetUrl(String imagePath) async {
    try {
      final file = File(imagePath);
      if (!file.existsSync()) {
        print('File does not exist at the specified path: $imagePath');
        return null;
      }

      final storageRef = FirebaseStorage.instance.ref();
      final fileName = path.basename(imagePath);
      final fileRef = storageRef.child('profile_images/$fileName');

      // Upload the file
      final uploadTask = fileRef.putFile(file);
      final snapshot = await uploadTask.whenComplete(() {});

      // Check if the upload was successful
      if (snapshot.state == TaskState.success) {
        final downloadUrl = await snapshot.ref.getDownloadURL();
        return downloadUrl;
      } else {
        print('Failed to upload the file.');
        return null;
      }
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  Future<String> _promptForCurrentPassword(BuildContext context) async {
    String currentPassword = '';
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return await showDialog<String>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Re-authenticate'),
              content: Form(
                key: _formKey,
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Current Password',
                  ),
                  onSaved: (value) {
                    currentPassword = value ?? '';
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your current password';
                    }
                    return null;
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      Navigator.of(context).pop(currentPassword);
                    }
                  },
                  child: const Text('Submit'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
              ],
            );
          },
        ) ??
        '';
  }

  Future<String?> uploadFileAndGetUrl(String imageUrl) async {
    try {
      // Download the file
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        final fileBytes = response.bodyBytes;

        // Create a reference to Firebase Storage
        final storageRef = FirebaseStorage.instance.ref();
        final fileName =
            path.basename(imageUrl); // Extract the file name from URL
        final fileRef = storageRef.child(
            'images/$fileName'); // Create a reference to the file location

        // Upload the file
        final uploadTask = fileRef.putData(fileBytes);
        final snapshot = await uploadTask.whenComplete(() {});

        // Get the download URL
        final downloadUrl = await snapshot.ref.getDownloadURL();

        return downloadUrl;
      } else {
        print('Failed to download the file.');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<void> updatePassword(String newPassword) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        await user.updatePassword(newPassword);
        print('Password updated successfully');
      } on FirebaseAuthException catch (e) {
        print('Failed to update password: ${e.message}');
      } catch (e) {
        print('An unexpected error occurred: $e');
      }
    } else {
      print('No user is signed in');
    }
  }

  void signOut(context) async {
    try {
      // Sign out the user
      await FirebaseAuth.instance.signOut();

      // Clear user details
      FirebaseServices.clearUserDetail();

      // Proceed with navigation or other logic
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInView()),
      );
    } catch (e) {
      // Handle errors
      print('Error signing out: $e');
    }
  }
}

Widget textField(
  TextEditingController controller,
  String hintText,
  bool isPass,
) {
  return Consumer<ProfileProvider>(
    builder: (context, pro, child) => Container(
        height: 40,
        width: double.infinity,
        padding: const EdgeInsets.only(top: 10, left: 10, bottom: 12),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.5),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: StyledTheme.styledFonts.copyWith(color: Colors.black54),
          controller: controller,
          obscureText: isPass == true ? true : false,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            hintStyle: StyledTheme.styledFonts
                .copyWith(color: Colors.black54, fontWeight: FontWeight.w700),
          ),
        )),
  );
}
