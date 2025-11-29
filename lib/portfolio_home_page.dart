import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A192F), // Navy blue background
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A192F),
        elevation: 0,
        title: Text(
          'Rupa Lama',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => _scrollToSection(_experienceKey),
            child: Text('Experience', style: GoogleFonts.poppins(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => _scrollToSection(_skillsKey),
            child: Text('Skills', style: GoogleFonts.poppins(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => _scrollToSection(_educationKey),
            child: Text('Education', style: GoogleFonts.poppins(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => _scrollToSection(_contactKey),
            child: Text('Contact', style: GoogleFonts.poppins(color: Colors.white)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Hero Section
            _buildHeroSection(),

            // About Section
            _buildAboutSection(),

            // Experience Section
            _buildExperienceSection(),

            // Skills Section
            _buildSkillsSection(),

            // Education Section
            _buildEducationSection(),

            // Contact Section
            _buildContactSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundColor: const Color(0xFF64FFDA), // Teal accent
            child: CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Replace with your photo
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Rupa Lama',
            style: GoogleFonts.poppins(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'Banking Operations Assistant',
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: const Color(0xFF64FFDA),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Dynamic banking professional with extensive experience at Global IME Bank Limited, '
                'excelling in transaction processing and regulatory compliance.',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white70,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Add CV download functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF64FFDA),
                  foregroundColor: const Color(0xFF0A192F),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text('Download CV', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 20),
              OutlinedButton(
                onPressed: () => _scrollToSection(_contactKey),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF64FFDA)),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text('Contact Me',
                    style: GoogleFonts.poppins(color: const Color(0xFF64FFDA), fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      color: const Color(0xFF112240), // Darker blue section
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'With over 8 years of experience in banking and financial services, I specialize in '
                'transaction processing, regulatory compliance, and customer relationship management. '
                'I have a proven track record of enhancing operational efficiency and ensuring adherence '
                'to banking policies while maintaining excellent customer satisfaction.',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white70,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 20,
            runSpacing: 10,
            children: [
              _buildInfoItem('Location', 'Vaasa, Finland'),
              _buildInfoItem('Email', 'lamarupa90@gmail.com'),
              _buildInfoItem('Phone', '+358 46 802 5472'),
              _buildInfoItem('Experience', '8+ Years'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String title, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.circle, size: 8, color: const Color(0xFF64FFDA)),
        const SizedBox(width: 8),
        Text('$title: ', style: GoogleFonts.poppins(color: Colors.white70)),
        Text(value, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildExperienceSection() {
    return Container(
      key: _experienceKey,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience',
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 40),
          _buildExperienceItem(
            'Banking Operations Assistant',
            'Global IME Bank Limited',
            'Mar 2018 - Aug 2025',
            [
              'Processed routine banking transactions including deposits, withdrawals, fund transfers, and check clearing',
              'Reconciled daily cash reports and transactions while assisting with report preparation',
              'Ensured compliance with banking regulations and internal policies consistently',
              'Addressed customer inquiries and resolved service-related issues in a timely manner',
            ],
          ),
          _buildExperienceItem(
            'Customer Service Representative',
            'Global IME Capital Limited',
            'May 2017 - Mar 2018',
            [
              'Served as primary contact for investors, brokers, and institutional clients',
              'Coordinated with trading desks and custodians for seamless trade execution',
              'Educated clients on KYC, AML, and compliance requirements',
              'Resolved grievances regarding delayed settlements and access issues',
            ],
          ),
          _buildExperienceItem(
            'Account Assistant',
            'Alternative Furniture Industry',
            'May 2014 - May 2017',
            [
              'Recorded financial transactions and maintained ledgers',
              'Prepared and issued customer invoices, followed up on outstanding payments',
              'Maintained accurate accounting records and filing systems',
              'Ensured compliance with company policies and regulations',
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(String title, String company, String period, List<String> points) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 5, right: 15),
            decoration: BoxDecoration(
              color: const Color(0xFF64FFDA),
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
                Text(company, style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xFF64FFDA),
                )),
                Text(period, style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.white70,
                )),
                const SizedBox(height: 10),
                ...points.map((point) => Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('• ', style: GoogleFonts.poppins(color: const Color(0xFF64FFDA))),
                      Expanded(child: Text(point, style: GoogleFonts.poppins(color: Colors.white70))),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection() {
    return Container(
      key: _skillsKey,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      color: const Color(0xFF112240),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills & Certifications',
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: [
              _buildSkillChip('Customer Service'),
              _buildSkillChip('Core Banking'),
              _buildSkillChip('Team Collaboration'),
              _buildSkillChip('Financial Reporting'),
              _buildSkillChip('AML/CFT Compliance'),
              _buildSkillChip('Transaction Processing'),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            'Certifications',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          _buildCertificationItem('Anti-Money Laundering (AML) & Combating Financing of Terrorism (CFT)', '2020', 'Fintelekt'),
          _buildCertificationItem('Junior Associate of National Banking Institute (JANBI)', '2024', 'National Banking Institute'),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF64FFDA).withOpacity(0.1),
        border: Border.all(color: const Color(0xFF64FFDA)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(skill, style: GoogleFonts.poppins(color: const Color(0xFF64FFDA))),
    );
  }

  Widget _buildCertificationItem(String title, String year, String issuer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Icon(Icons.verified, color: const Color(0xFF64FFDA), size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold)),
                Text('$issuer • $year', style: GoogleFonts.poppins(color: Colors.white70)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationSection() {
    return Container(
      key: _educationKey,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Education',
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          _buildEducationItem('Master in Business Studies', 'Tribhuvan University', '2017 - 2019'),
          _buildEducationItem('Bachelor in Business Studies', 'Tribhuvan University', '2012 - 2015'),
          _buildEducationItem('High School', 'Kathmandu Valley Higher Secondary School', '2010 - 2012'),
          const SizedBox(height: 40),
          Text(
            'Achievements',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          _buildAchievementItem('Branch Deposit Target of FY 2074/75'),
          _buildAchievementItem('Decentralization of Online Payment System'),
          _buildAchievementItem('Automation of Inward Cheque Clearing System'),
        ],
      ),
    );
  }

  Widget _buildEducationItem(String degree, String institution, String period) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Icon(Icons.school, color: const Color(0xFF64FFDA), size: 24),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(degree, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold)),
                Text('$institution • $period', style: GoogleFonts.poppins(color: Colors.white70)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementItem(String achievement) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(Icons.star, color: const Color(0xFF64FFDA), size: 16),
          const SizedBox(width: 10),
          Text(achievement, style: GoogleFonts.poppins(color: Colors.white70)),
        ],
      ),
    );
  }



  Widget _buildContactSection() {
    return Container(
      key: _contactKey,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      color: const Color(0xFF112240),
      child: Column(
        children: [
          Text(
            'Get In Touch',
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'I\'m always open to discussing new opportunities and connections.',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white70,
             // textStyle: TextStyle(textAlign: TextAlign.center)
              //textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildContactButton(Icons.email, 'Email', () {
                _launchURL('mailto:lamarupa90@gmail.com');
              }),
              const SizedBox(width: 20),
              _buildContactButton(Icons.phone, 'Call', () {
                _launchURL('tel:+358468025472');
              }),
              const SizedBox(width: 20),
              _buildContactButton(Icons.link, 'LinkedIn', () {
                _launchURL('https://www.linkedin.com/in/rupa-lama-r6/');
              }),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            'Languages: \nNepali (Native) \nEnglish (Fluent) \nHindi (Fluent) \nFinnish (Beginner)',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white70,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton(IconData icon, String label, VoidCallback onPressed) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon, size: 30, color: const Color(0xFF64FFDA)),
          style: IconButton.styleFrom(
            backgroundColor: const Color(0xFF64FFDA).withOpacity(0.1),
            padding: const EdgeInsets.all(20),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: GoogleFonts.poppins(color: Colors.white70)),
      ],
    );
  }
}