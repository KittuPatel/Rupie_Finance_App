import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text('Profile'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Account',
            tiles: [
              SettingsTile(
                title: 'Edit Profile',
                //subtitle: 'English',
                leading: Icon(Icons.edit),
                onTap: () {},
              ),
              SettingsTile(
                title: 'Registered Phone Number',
                subtitle: '+91 9640897033',
                leading: Icon(Icons.account_circle),
                onTap: () {},
              ),
            ],
          ),
          SettingsSection(
            title: 'App Settings',
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language),
                onTap: () {},
              ),
              SettingsTile.switchTile(
                title: 'Use fingerprint',
                leading: Icon(Icons.fingerprint),
                switchValue: true,
                onToggle: (bool value) {},
              ),
              SettingsTile.switchTile(
                title: 'Notifications',
                subtitle: 'English',
                switchValue: true,
                leading: Icon(Icons.notifications),
                onToggle: (bool value) {},
              ),
              
            ],
          ),
          SettingsSection(
            title: 'Share',
            tiles: [
              SettingsTile(
                title: 'Tell a Friend',
                //subtitle: 'English',
                leading: Icon(Icons.favorite),
                onTap: () {},
              ),
              
            ],
          ),
          SettingsSection(
            title: 'Others',
            tiles: [
              SettingsTile(
                title: 'FAQ\'s',
                //subtitle: 'English',
                leading: Icon(Icons.help),
                onTap: () {},
              ),
              SettingsTile(
                title: 'Terms and Conditions',
                //subtitle: 'English',
                leading: Icon(Icons.description),
                onTap: () {},
              ),
              SettingsTile(
                title: 'Privacy Policies',
                //subtitle: 'English',
                leading: Icon(Icons.lock),
                onTap: () {},
              ),
            ],
          ),   
        ],  
      )
    );
  }
}