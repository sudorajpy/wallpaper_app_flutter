import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height-60,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.green,
              child: Center(
                child: Text(
                  'Subsctiption and login will be added soon',
                  style: TextStyle(
                    fontSize: 30,
                    
                    color: Colors.white,
                  
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            ListTile(
              title: const Text(
                'Support',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: Icon(
                Icons.help_outline,
                size: 24,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            
            ),
            ListTile(
              title: const Text(
                'Rate App',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: Icon(
                Icons.star_border,
                size: 24,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            
            
            ),
            ListTile(
              title: const Text(
                'Share App',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: Icon(
                Icons.share,
                size: 24,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            
            
            ),
            ListTile(
              title: const Text(
                'Terms and Conditions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: Icon(
                Icons.description_outlined,
                size: 24,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            
            
            ),
            ListTile(
              title: const Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: Icon(
                Icons.privacy_tip_outlined,
                size: 24,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            
            
            ),
          ],
        )
      ),
    );
  }
}