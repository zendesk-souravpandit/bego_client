import 'package:beui/mulitchild.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeTextMore', path: 'widget/multichild', type: BeTextMore)
Widget useCaseBeTextMore(final BuildContext context) {
  final maxLines = context.knobs.int.slider(label: 'Max Lines', initialValue: 3, min: 1, max: 10);
  final fontSize = context.knobs.double.slider(label: 'Font Size', initialValue: 14, min: 10, max: 24);
  final expandText = context.knobs.string(label: 'Expand Text', initialValue: 'More');
  final collapseText = context.knobs.string(label: 'Collapse Text', initialValue: 'Less');
  final textColor = context.knobs.color(label: 'Text Color', initialValue: Colors.black87);
  final linkColor = context.knobs.color(label: 'Link Color', initialValue: Colors.blue);

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('BeTextMore Examples:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),

          // Main customizable example
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Customizable Example:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  BeTextMore(
                    text: _sampleLongText,
                    maxLines: maxLines,
                    style: TextStyle(fontSize: fontSize, color: textColor),
                    linkStyle: TextStyle(color: linkColor, fontWeight: FontWeight.bold),
                    expandText: expandText,
                    collapseText: collapseText,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Practical examples
          const Text('Practical Use Cases:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          // Product description
          _buildExampleCard(
            'Product Description',
            Icons.shopping_cart,
            Colors.blue,
            const BeTextMore(
              text:
                  'This premium wireless headphone delivers exceptional sound quality with active noise cancellation. '
                  'Perfect for travel, work, or leisure. Features include 30-hour battery life, quick charge capability, '
                  'premium materials, and intuitive touch controls. Compatible with all devices via Bluetooth 5.0. '
                  'Includes carrying case, charging cable, and audio cable for wired use.',
              maxLines: 2,
              style: TextStyle(fontSize: 13),
              expandText: 'Read more',
              collapseText: 'Show less',
            ),
          ),

          // Article preview
          _buildExampleCard(
            'Article Preview',
            Icons.article,
            Colors.green,
            const BeTextMore(
              text:
                  'Climate change continues to be one of the most pressing issues of our time. Scientists worldwide '
                  'are working tirelessly to develop innovative solutions and technologies that can help mitigate '
                  'the effects of global warming. Recent breakthroughs in renewable energy, carbon capture, '
                  'and sustainable agriculture offer hope for a more sustainable future. However, immediate action '
                  'is required from governments, businesses, and individuals to implement these solutions at scale.',
              maxLines: 3,
              style: TextStyle(fontSize: 14, height: 1.4),
              linkStyle: TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
              expandText: 'Continue reading',
              collapseText: 'Collapse',
            ),
          ),

          // User review
          _buildExampleCard(
            'Customer Review',
            Icons.star,
            Colors.amber,
            const BeTextMore(
              text:
                  'Amazing product! I\'ve been using this for over 6 months now and it has exceeded all my expectations. '
                  'The build quality is excellent, the customer service is responsive, and the features work exactly as advertised. '
                  'I would definitely recommend this to anyone looking for a reliable solution. The setup was easy, '
                  'the documentation is clear, and the performance has been consistently excellent. Worth every penny!',
              maxLines: 2,
              style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
              linkStyle: TextStyle(color: Colors.amber, decoration: TextDecoration.underline),
              expandText: 'Show full review',
              collapseText: 'Hide',
            ),
          ),

          // Social media post
          _buildExampleCard(
            'Social Media Post',
            Icons.share,
            Colors.purple,
            const BeTextMore(
              text:
                  'Just completed an amazing hiking trip in the mountains! 🏔️ The views were absolutely breathtaking, '
                  'and the weather was perfect throughout the entire journey. Met some incredible people along the way '
                  'and learned so much about the local flora and fauna. Can\'t wait to plan the next adventure! '
                  'Special thanks to our guide for making this experience unforgettable. #hiking #adventure #nature #mountains',
              maxLines: 2,
              style: TextStyle(fontSize: 14),
              linkStyle: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
              expandText: '... more',
              collapseText: 'less',
            ),
          ),

          // News summary
          _buildExampleCard(
            'News Summary',
            Icons.newspaper,
            Colors.red,
            const BeTextMore(
              text:
                  'BREAKING: Major technological breakthrough announced today in quantum computing research. '
                  'Scientists at leading universities have successfully demonstrated a new quantum algorithm '
                  'that could revolutionize data processing and encryption. This development has significant '
                  'implications for cybersecurity, artificial intelligence, and scientific computing. '
                  'Industry experts predict this could lead to commercial applications within the next decade.',
              maxLines: 3,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              linkStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              expandText: 'Read full story',
              collapseText: 'Minimize',
            ),
          ),

          // FAQ answer
          _buildExampleCard(
            'FAQ Answer',
            Icons.help_outline,
            Colors.teal,
            const BeTextMore(
              text:
                  'To reset your password, please follow these steps: 1) Go to the login page and click "Forgot Password" '
                  '2) Enter your email address associated with your account 3) Check your email for a reset link '
                  '4) Click the link and follow the instructions 5) Create a new strong password using at least 8 characters '
                  'including uppercase, lowercase, numbers, and special characters. If you continue to experience issues, '
                  'please contact our support team for further assistance.',
              maxLines: 3,
              style: TextStyle(fontSize: 13),
              linkStyle: TextStyle(color: Colors.teal, fontWeight: FontWeight.w600),
              expandText: 'Show all steps',
              collapseText: 'Hide details',
            ),
          ),

          // Bio/About section
          _buildExampleCard(
            'User Bio',
            Icons.person,
            Colors.indigo,
            const BeTextMore(
              text:
                  'Senior Software Engineer with 10+ years of experience in full-stack development. '
                  'Passionate about creating scalable solutions and mentoring junior developers. '
                  'Expertise in React, Node.js, Python, and cloud technologies. Currently working on '
                  'machine learning applications and contributing to open-source projects. '
                  'Love hiking, photography, and exploring new technologies in my free time.',
              maxLines: 2,
              style: TextStyle(fontSize: 13),
              linkStyle: TextStyle(color: Colors.indigo, fontWeight: FontWeight.w500),
              expandText: 'View full bio',
              collapseText: 'Collapse bio',
            ),
          ),

          const SizedBox(height: 24),
          const Text('Use Cases:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            '• Product descriptions in e-commerce apps\n'
            '• Article previews in news and blog applications\n'
            '• User reviews and testimonials\n'
            '• Social media posts with long content\n'
            '• FAQ sections and help documentation\n'
            '• User profiles and biographical information\n'
            '• Comments and forum posts\n'
            '• Email previews in messaging apps',
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 16),
          const Text('Benefits:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            '• Improves user experience by showing relevant content first\n'
            '• Saves screen space and reduces clutter\n'
            '• Allows users to control information density\n'
            '• Enhances readability and content organization\n'
            '• Provides smooth expand/collapse interactions\n'
            '• Customizable styling for different contexts',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}

Widget _buildExampleCard(final String title, final IconData icon, final Color color, final Widget content) {
  return Card(
    margin: const EdgeInsets.only(bottom: 16),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 12),
          content,
        ],
      ),
    ),
  );
}

const String _sampleLongText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
    'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
    'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. '
    'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, '
    'eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. '
    'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos '
    'qui ratione voluptatem sequi nesciunt.';
