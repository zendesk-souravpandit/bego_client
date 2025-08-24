import 'package:beui/mulitchild.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeTextMore', path: 'widget/multichild', type: BeTextMore)
Widget useCaseBeTextMore(final BuildContext context) {
  final trimLines = context.knobs.int.slider(label: 'Trim Lines', initialValue: 3, min: 1, max: 10);
  final trimLength = context.knobs.int.slider(label: 'Trim Length', initialValue: 240, min: 50, max: 500);
  final fontSize = context.knobs.double.slider(label: 'Font Size', initialValue: 14, min: 10, max: 24);
  final trimCollapsedText = context.knobs.string(label: 'Collapsed Text', initialValue: 'read more');
  final trimExpandedText = context.knobs.string(label: 'Expanded Text', initialValue: 'show less');
  final textColor = context.knobs.color(label: 'Text Color', initialValue: Theme.of(context).colorScheme.onSurface);
  final linkColor = context.knobs.color(label: 'Link Color', initialValue: Theme.of(context).colorScheme.primary);
  final trimMode = context.knobs.object.dropdown<TrimMode>(
    label: 'Trim Mode',
    options: [TrimMode.length, TrimMode.line],
    labelBuilder: (final TrimMode mode) => mode == TrimMode.length ? 'Length' : 'Line',
    initialOption: TrimMode.length,
  );

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BeTextMore Examples:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(height: 24),

          // Main customizable example
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Customizable Example:',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface),
                  ),
                  const SizedBox(height: 8),
                  BeTextMore(
                    text: _sampleLongText,
                    trimLines: trimLines,
                    trimLength: trimLength,
                    trimMode: trimMode,
                    style: TextStyle(fontSize: fontSize, color: textColor),
                    moreStyle: TextStyle(color: linkColor, fontWeight: FontWeight.bold),
                    lessStyle: TextStyle(color: linkColor, fontWeight: FontWeight.bold),
                    trimCollapsedText: trimCollapsedText,
                    trimExpandedText: trimExpandedText,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Practical examples
          Text(
            'Practical Use Cases:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(height: 16),

          // Product description
          _buildExampleCard(
            'Product Description',
            Icons.shopping_cart,
            Colors.blue,
            BeTextMore(
              text:
                  'This premium wireless headphone delivers exceptional sound quality with active noise cancellation. '
                  'Perfect for travel, work, or leisure. Features include 30-hour battery life, quick charge capability, '
                  'premium materials, and intuitive touch controls. Compatible with all devices via Bluetooth 5.0. '
                  'Includes carrying case, charging cable, and audio cable for wired use.',
              trimMode: TrimMode.line,
              trimLines: 2,
              style: TextStyle(fontSize: 13, color: Theme.of(context).colorScheme.onSurface),
              trimCollapsedText: 'Read more',
              trimExpandedText: 'Show less',
            ),
          ),

          // Article preview
          _buildExampleCard(
            'Article Preview',
            Icons.article,
            Colors.green,
            BeTextMore(
              text:
                  'Climate change continues to be one of the most pressing issues of our time. Scientists worldwide '
                  'are working tirelessly to develop innovative solutions and technologies that can help mitigate '
                  'the effects of global warming. Recent breakthroughs in renewable energy, carbon capture, '
                  'and sustainable agriculture offer hope for a more sustainable future. However, immediate action '
                  'is required from governments, businesses, and individuals to implement these solutions at scale.',
              trimMode: TrimMode.line,
              trimLines: 3,
              style: TextStyle(fontSize: 14, height: 1.4, color: Theme.of(context).colorScheme.onSurface),
              moreStyle: const TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
              lessStyle: const TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
              trimCollapsedText: 'Continue reading',
              trimExpandedText: 'Collapse',
            ),
          ),

          // User review
          _buildExampleCard(
            'Customer Review',
            Icons.star,
            Colors.amber,
            BeTextMore(
              text:
                  'Amazing product! I\'ve been using this for over 6 months now and it has exceeded all my expectations. '
                  'The build quality is excellent, the customer service is responsive, and the features work exactly as advertised. '
                  'I would definitely recommend this to anyone looking for a reliable solution. The setup was easy, '
                  'the documentation is clear, and the performance has been consistently excellent. Worth every penny!',
              trimMode: TrimMode.line,
              trimLines: 2,
              style: TextStyle(
                fontSize: 13,
                fontStyle: FontStyle.italic,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              moreStyle: const TextStyle(color: Colors.amber, decoration: TextDecoration.underline),
              lessStyle: const TextStyle(color: Colors.amber, decoration: TextDecoration.underline),
              trimCollapsedText: 'Show full review',
              trimExpandedText: 'Hide',
            ),
          ),

          // Social media post
          _buildExampleCard(
            'Social Media Post',
            Icons.share,
            Colors.purple,
            BeTextMore(
              text:
                  'Just completed an amazing hiking trip in the mountains! 🏔️ The views were absolutely breathtaking, '
                  'and the weather was perfect throughout the entire journey. Met some incredible people along the way '
                  'and learned so much about the local flora and fauna. Can\'t wait to plan the next adventure! '
                  'Special thanks to our guide for making this experience unforgettable. #hiking #adventure #nature #mountains',
              trimMode: TrimMode.line,
              trimLines: 2,
              style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.onSurface),
              moreStyle: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
              lessStyle: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
              trimCollapsedText: '... more',
              trimExpandedText: 'less',
            ),
          ),

          // News summary
          _buildExampleCard(
            'News Summary',
            Icons.newspaper,
            Colors.red,
            BeTextMore(
              text:
                  'BREAKING: Major technological breakthrough announced today in quantum computing research. '
                  'Scientists at leading universities have successfully demonstrated a new quantum algorithm '
                  'that could revolutionize data processing and encryption. This development has significant '
                  'implications for cybersecurity, artificial intelligence, and scientific computing. '
                  'Industry experts predict this could lead to commercial applications within the next decade.',
              trimMode: TrimMode.line,
              trimLines: 3,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              moreStyle: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              lessStyle: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              trimCollapsedText: 'Read full story',
              trimExpandedText: 'Minimize',
            ),
          ),

          // FAQ answer
          _buildExampleCard(
            'FAQ Answer',
            Icons.help_outline,
            Colors.teal,
            BeTextMore(
              text:
                  'To reset your password, please follow these steps: 1) Go to the login page and click "Forgot Password" '
                  '2) Enter your email address associated with your account 3) Check your email for a reset link '
                  '4) Click the link and follow the instructions 5) Create a new strong password using at least 8 characters '
                  'including uppercase, lowercase, numbers, and special characters. If you continue to experience issues, '
                  'please contact our support team for further assistance.',
              trimMode: TrimMode.line,
              trimLines: 3,
              style: TextStyle(fontSize: 13, color: Theme.of(context).colorScheme.onSurface),
              moreStyle: const TextStyle(color: Colors.teal, fontWeight: FontWeight.w600),
              lessStyle: const TextStyle(color: Colors.teal, fontWeight: FontWeight.w600),
              trimCollapsedText: 'Show all steps',
              trimExpandedText: 'Hide details',
            ),
          ),

          // Bio/About section
          _buildExampleCard(
            'User Bio',
            Icons.person,
            Colors.indigo,
            BeTextMore(
              text:
                  'Senior Software Engineer with 10+ years of experience in full-stack development. '
                  'Passionate about creating scalable solutions and mentoring junior developers. '
                  'Expertise in React, Node.js, Python, and cloud technologies. Currently working on '
                  'machine learning applications and contributing to open-source projects. '
                  'Love hiking, photography, and exploring new technologies in my free time.',
              trimMode: TrimMode.line,
              trimLines: 2,
              style: TextStyle(fontSize: 13, color: Theme.of(context).colorScheme.onSurface),
              moreStyle: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.w500),
              lessStyle: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.w500),
              trimCollapsedText: 'View full bio',
              trimExpandedText: 'Collapse bio',
            ),
          ),

          // Advanced Features Examples
          Text(
            'Advanced Features:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(height: 16),

          // Length-based trimming example
          _buildExampleCard(
            'Length-Based Trimming',
            Icons.straighten,
            Colors.deepOrange,
            BeTextMore(
              text:
                  'This example demonstrates character-based trimming. The text will be cut off at exactly 120 characters '
                  'regardless of word boundaries or line breaks. This mode is useful when you need precise character limits '
                  'for consistency across different screen sizes and font configurations.',
              trimMode: TrimMode.length,
              trimLength: 120,
              style: TextStyle(fontSize: 13, color: Theme.of(context).colorScheme.onSurface),
              moreStyle: const TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
              lessStyle: const TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
              trimCollapsedText: 'read more',
              trimExpandedText: 'show less',
            ),
          ),

          // Pre and Post text example
          _buildExampleCard(
            'With Prefix & Suffix',
            Icons.format_quote,
            Colors.brown,
            BeTextMore(
              preDataText: '📖 Quote:',
              text:
                  'Innovation distinguishes between a leader and a follower. The way to get started is to quit talking '
                  'and begin doing. Your time is limited, so don\'t waste it living someone else\'s life.',
              postDataText: '— Steve Jobs',
              preDataTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
              postDataTextStyle: TextStyle(
                fontStyle: FontStyle.italic,
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              trimLength: 80,
              style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.onSurface),
              moreStyle: const TextStyle(color: Colors.brown, fontWeight: FontWeight.w600),
              lessStyle: const TextStyle(color: Colors.brown, fontWeight: FontWeight.w600),
            ),
          ),

          // Custom delimiter example
          _buildExampleCard(
            'Custom Styling',
            Icons.palette,
            Colors.pinkAccent,
            BeTextMore(
              text:
                  'This example showcases custom delimiter and enhanced styling options. Notice the custom ellipsis, '
                  'different link colors, and special styling. The widget supports extensive customization to match '
                  'your app\'s design language perfectly.',
              delimiter: ' ••• ',
              trimLength: 100,
              style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.onSurface),
              moreStyle: const TextStyle(
                color: Colors.pinkAccent,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
              lessStyle: const TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
              delimiterStyle: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
              trimCollapsedText: '👀 view more',
              trimExpandedText: '📚 collapse',
            ),
          ),

          const SizedBox(height: 24),
          Text(
            'Use Cases:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(height: 8),
          Text(
            '• Product descriptions in e-commerce apps\n'
            '• Article previews in news and blog applications\n'
            '• User reviews and testimonials\n'
            '• Social media posts with long content\n'
            '• FAQ sections and help documentation\n'
            '• User profiles and biographical information\n'
            '• Comments and forum posts\n'
            '• Email previews in messaging apps\n'
            '• Terms and conditions with controlled expansion\n'
            '• Code documentation and API references\n'
            '• Recipe instructions with step-by-step reveal',
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7)),
          ),

          const SizedBox(height: 16),
          Text(
            'New Features:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(height: 8),
          Text(
            '• Dual trimming modes: Character count vs Line count\n'
            '• Rich text support with TextSpan integration\n'
            '• Annotations for URLs, hashtags, mentions\n'
            '• Pre/post text with custom styling\n'
            '• External state control via ValueNotifier\n'
            '• Custom delimiters and advanced styling\n'
            '• Performance optimized as LeafRenderObjectWidget\n'
            '• Full accessibility support',
            style: TextStyle(color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.8)),
          ),

          const SizedBox(height: 16),
          Text(
            'Benefits:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(height: 8),
          Text(
            '• Improves user experience by showing relevant content first\n'
            '• Saves screen space and reduces clutter\n'
            '• Allows users to control information density\n'
            '• Enhances readability and content organization\n'
            '• Provides smooth expand/collapse interactions\n'
            '• Customizable styling for different contexts',
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7)),
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
