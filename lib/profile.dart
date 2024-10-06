import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.blueAccent,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: const AssetImage(
                        'assets/logos/Swapnil.jpeg'), // Replace with your actual image path
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Swapnil lodhi',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'estore@gmail.com',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.white),
                    onPressed: () {
                      // Edit Profile Action
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Account Settings Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSettingsHeader('Account Settings'),
                  const SizedBox(height: 16),
                  _buildSettingsTile(
                    icon: Icons.home_outlined,
                    title: 'My Addresses',
                    subtitle: 'Set shopping delivery address',
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    icon: Icons.shopping_cart_outlined,
                    title: 'My Cart',
                    subtitle: 'Add, remove products and move to checkout',
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    icon: Icons.assignment_outlined,
                    title: 'My Orders',
                    subtitle: 'In-progress and Completed Orders',
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    icon: Icons.account_balance_wallet_outlined,
                    title: 'Bank Account',
                    subtitle: 'Withdraw balance to registered bank account',
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    icon: Icons.local_offer_outlined,
                    title: 'My Coupons',
                    subtitle: 'List of all the discounted coupons',
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    icon: Icons.notifications_outlined,
                    title: 'Notifications',
                    subtitle: 'Set any kind of notification message',
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    icon: Icons.privacy_tip_outlined,
                    title: 'Account Privacy',
                    subtitle: 'Manage data usage and connected accounts',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10.0),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent, size: 28),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 14,
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSettingsHeader(String header) {
    return Text(
      header,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}
