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
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height-60,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.green,
              child: const Center(
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

            const ListTile(
              title: Text(
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
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            
            ),
            const ListTile(
              title: Text(
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
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            
            
            ),
            const ListTile(
              title: Text(
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
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            
            
            ),
            const ListTile(
              title: Text(
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
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            
            
            ),
            const ListTile(
              title: Text(
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
              trailing: Icon(
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