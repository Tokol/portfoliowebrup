import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rupa Lama - Banking Professional Portfolio',
      theme: ThemeData(

        primaryColor: Color(0xFF001F3F),
        scaffoldBackgroundColor: Color(0xFFEDEDED),
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
          headlineMedium: TextStyle(fontSize: 24, color: Color(0xFF007B7F)),
          bodyMedium: TextStyle(fontSize: 16, color: Color(0xFF333333), height: 1.6),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: Text('Coming soon, stay tuned!', style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),),))
    );
  }
}

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _experienceKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(key.currentContext!, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  void _showPdfViewer(String assetPath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          width: 600,
          height: 800,
          child: SfPdfViewer.asset(assetPath),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF001F3F), Color(0xFFEDEDED)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Rupa Lama', style: Theme.of(context).textTheme.headlineLarge),
                    Text('Experienced Banking Professional | 6+ Years in Finance',
                        style: Theme.of(context).textTheme.headlineMedium),
                    SizedBox(height: 16),
                    Text(
                        'Experienced banker with a proven track record of six years in the financial industry. Adept at handling various banking operations, providing exceptional customer service, and ensuring regulatory compliance...',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.phone, color: Colors.white70),
                        SizedBox(width: 8),
                        Text('+977 9862248184', style: TextStyle(color: Colors.white70)),
                        SizedBox(width: 16),
                        Icon(Icons.email, color: Colors.white70),
                        SizedBox(width: 8),
                        Text('lamarupa90@gmail.com', style: TextStyle(color: Colors.white70)),
                        SizedBox(width: 16),
                        Icon(Icons.location_on, color: Colors.white70),
                        SizedBox(width: 8),
                        Text('Bouddha, Kathmandu', style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => _scrollToSection(_experienceKey),
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF007B7F)),
                      child: Text('View Experience'),
                    ),
                  ],
                ),
              ),
            ),
            // About Section
            Padding(
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [Icon(Icons.person), Text(' About Me', style: Theme.of(context).textTheme.headlineMedium)]),
                  SizedBox(height: 16),
                  Text(
                      'Experienced banker with a proven track record of six years in the financial industry. Adept at handling various banking operations, providing exceptional customer service, and ensuring regulatory compliance. Skilled in document management, customer query handling, cheque clearing, reconciliation, and other essential banking tasks. Committed to delivering accurate results, maintaining high standards of professionalism, and contributing to the growth of the organization.',
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
            // Experience Section
            Container(
              key: _experienceKey,
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Professional Experience', style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(height: 16),
                  _buildExperienceCard(
                    'Cheque Clearing and Reconciliation Officer',
                    'Global IME Bank Limited',
                    'Kathmandu',
                    'Jan 2018 - Present',
                    [
                      'Conducted timely and accurate processing of cheques, ensuring compliance with banking policies and procedures.',
                      'Verified signatures, endorsements, and other required information for cheque clearance, reducing errors and fraud risks.',
                      'Collaborated with other banks and financial institutions to ensure the smooth and efficient clearing of cheques.',
                      'Reconciled accounts and resolved discrepancies, investigating and resolving any issues related to cheque transactions.',
                      'Maintained updated knowledge of banking regulations and procedures related to cheque clearing, ensuring compliance at all times.',
                      'Strong understanding of banking operations, regulations, and compliance requirements.',
                      'Excellent customer service and communication skills, with the ability to handle customer queries and complaints effectively.',
                      'Proficient in document management, ensuring accuracy, confidentiality, and timely completion.',
                      'Skilled in cheque processing, verification, and reconciliation, reducing errors and ensuring smooth operations.',
                      'Detail-oriented with exceptional organizational and time management abilities.',
                      'Proficient in Microsoft Office Suite and banking software.',
                    ],
                    'assets/experience_letters/cheque_clearing.pdf',
                  ),
                  _buildExperienceCard(
                    'Document Handler/Customer Service Representative',
                    'Global IME Capital Limited',
                    'Kathmandu',
                    'Mar 2017 - Jan 2018',
                    [
                      'Efficiently handled and managed a wide range of documents, ensuring accuracy, confidentiality, and timely completion.',
                      'Responded to customer queries, concerns, and requests promptly, providing excellent customer service.',
                      'Addressed customer complaints and issues, working towards satisfactory resolutions and maintaining customer satisfaction.',
                      'Collaborated with internal teams to facilitate smooth document workflow and ensure compliance with regulatory guidelines.',
                      'Assisted in maintaining updated records, organizing files, and implementing document management systems for improved efficiency.',
                    ],
                    'assets/experience_letters/document_handler.pdf',
                  ),
                  _buildExperienceCard(
                    'Business Developer',
                    'Alternative Furniture',
                    'Kathmandu',
                    'Mar 2014 - Dec 2016',
                    [
                      'Spearheaded cashiering operations, ensuring accurate and efficient handling of transactions while providing exceptional customer service.',
                      'Directed daily operations, including inventory management, staff scheduling, and facility maintenance, optimizing productivity.',
                      'Developed and maintained relationships with key clients and vendors, negotiating favorable terms and resolving issues promptly.',
                      'Analyzed market trends and customer feedback to identify opportunities for growth and improvement, leading to the successful launch of new products/services and enhancements to existing offerings.',
                    ],
                    'assets/experience_letters/business_developer.pdf',
                  ),
                ],
              ),
            ),
            // Education Section
            Padding(
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Education', style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(height: 16),
                  _buildEducationCard('Master of Business Studies, Finance',
                      'Golden Gate International College (Tribhuwan University)', 'Kathmandu', 'Jan 2018 - Jan 2020'),
                  _buildEducationCard('Bachelor of Business Studies',
                      'Reliance College (Tribhuwan University)', 'Kathmandu', 'Aug 2012 - Sep 2015'),
                  _buildEducationCard('Higher Secondary Education Board Nepal',
                      'Kathmandu Valley Higher Secondary School', 'Kathmandu', 'Jul 2010 - Sep 2012'),
                  _buildEducationCard('School Leaving Certificate Examination',
                      'Shanti Adarsha Secondary School', 'Kathmandu', 'May 1999 - May 2009'),
                ],
              ),
            ),
            // Skills Section
            Padding(
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Skills', style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildSkillTag('Banking Operations Management'),
                      _buildSkillTag('Customer Service Excellence'),
                      _buildSkillTag('Regulatory Compliance'),
                      _buildSkillTag('Document Management'),
                      _buildSkillTag('Cheque Processing and Reconciliation'),
                      _buildSkillTag('Communication'),
                      _buildSkillTag('Problem-solving'),
                      _buildSkillTag('Relationship Building'),
                      _buildSkillTag('Inventory Management'),
                      _buildSkillTag('Market Analysis'),
                      _buildSkillTag('Negotiation Skills'),
                      _buildSkillTag('Time Management'),
                    ],
                  ),
                ],
              ),
            ),
            // Languages Section
            Padding(
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Languages', style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    children: [
                      Text('Nepali (Native)', style: Theme.of(context).textTheme.bodyMedium),
                      Text('English (Fluent)', style: Theme.of(context).textTheme.bodyMedium),
                      Text('Hindi', style: Theme.of(context).textTheme.bodyMedium),
                      Text('Tamang', style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ],
              ),
            ),
            // References Section
            Padding(
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('References', style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildReferenceCard('Balram Rai', 'Program Coordinator of BBS', 'Reliance College', '+977-9851110411'),
                      _buildReferenceCard('Bivam Neupane', 'Program Coordinator of MBS', 'Golden Gate College', '+977-9851042927'),
                    ],
                  ),
                ],
              ),
            ),
            // Contact Section
            Container(
              color: Color(0xFF001F3F),
              padding: EdgeInsets.all(32),
              child: Column(
                children: [
                  Text('Contact Me', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white)),
                  SizedBox(height: 16),
                  Text('Email: lamarupa90@gmail.com', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
                  Text('Phone: +977 9862248184', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
                  Text('Location: Bouddha, Kathmandu', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
                  SizedBox(height: 16),
                  Text('© ${DateTime.now().year} Rupa Lama | Built with Flutter Web',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70)),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('AI Chat Assistant', style: Theme.of(context).textTheme.headlineMedium),
                  TextField(decoration: InputDecoration(hintText: 'Ask about Rupa...')),
                  // Placeholder for AI integration
                ],
              ),
            ),
          );
        },
        backgroundColor: Color(0xFF007B7F),
        child: Icon(Icons.chat, color: Colors.white),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFF001F3F).withOpacity(0.8),
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: () => _scrollToSection(_experienceKey), child: Text('Experience', style: TextStyle(color: Colors.white))),
            // Add other section links as needed
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceCard(String title, String company, String location, String dates, List<String> details, String letterPath) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$title | $company | $location | $dates', style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            ...details.map((detail) => Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Row(
                children: [Icon(Icons.check, size: 16), SizedBox(width: 8), Expanded(child: Text(detail))],
              ),
            )),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _showPdfViewer(letterPath),
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF007B7F)),
              child: Text('View Letter'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEducationCard(String degree, String institution, String location, String dates) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.school, size: 24),
            SizedBox(width: 8),
            Expanded(child: Text('$degree | $institution | $location | $dates', style: Theme.of(context).textTheme.bodyMedium)),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillTag(String skill) {
    return Chip(
      label: Text(skill, style: TextStyle(color: Colors.white)),
      backgroundColor: Color(0xFF007B7F),
    );
  }

  Widget _buildReferenceCard(String name, String title, String institution, String phone) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
            Text(title, style: Theme.of(context).textTheme.bodyMedium),
            Text(institution, style: Theme.of(context).textTheme.bodyMedium),
            Text(phone, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}