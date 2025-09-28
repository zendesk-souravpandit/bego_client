import 'package:beui/from.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// Comprehensive use cases for BeFormBuilder form components
///
/// This file demonstrates all available form field components in the BeFormBuilder system:
/// - Text Fields (various input types and validation)
/// - Checkboxes and Switches
/// - Dropdowns and Radio Groups
/// - Sliders and Range Sliders
/// - Date and Time Pickers
/// - Chip-based Selection (Choice and Filter chips)
/// - Form validation and state management

@widgetbook.UseCase(name: 'Basic Form Fields', type: BeFormBuilder)
Widget basicFormFieldsUseCase(final BuildContext context) {
  final formKey = GlobalKey<BeFormBuilderState>();

  return Scaffold(
    appBar: AppBar(
      title: const Text('Basic Form Fields'),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: BeFormBuilder(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Text Field
            BeFormBuilderTextField(
              name: 'text_field',
              decoration: const InputDecoration(
                labelText: 'Full Name',
                hintText: 'Enter your full name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              validator: (final value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Email Field with validation
            BeFormBuilderTextField(
              name: 'email',
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email address',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (final value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Number Field
            BeFormBuilderTextField(
              name: 'age',
              decoration: const InputDecoration(
                labelText: 'Age',
                hintText: 'Enter your age',
                prefixIcon: Icon(Icons.cake),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (final value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your age';
                }
                final age = int.tryParse(value);
                if (age == null || age < 1 || age > 120) {
                  return 'Please enter a valid age (1-120)';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Password Field
            BeFormBuilderTextField(
              name: 'password',
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter a secure password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (final value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                if (value.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Checkbox
            BeFormBuilderCheckbox(
              name: 'agree_terms',
              title: const Text('I agree to the Terms and Conditions'),
              validator: (final value) {
                if (value != true) {
                  return 'You must agree to the terms';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Switch
            BeFormBuilderSwitch(
              name: 'newsletter',
              title: const Text('Subscribe to Newsletter'),
              subtitle: const Text('Receive updates and promotions'),
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),

            const SizedBox(height: 32),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState?.saveAndValidate() ?? false) {
                  final formData = formKey.currentState!.value;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Form submitted: ${formData.toString()}'), backgroundColor: Colors.green),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fix the errors above'), backgroundColor: Colors.red),
                  );
                }
              },
              child: const Text('Submit Form'),
            ),

            const SizedBox(height: 16),

            // Reset Button
            OutlinedButton(
              onPressed: () {
                formKey.currentState?.reset();
              },
              child: const Text('Reset Form'),
            ),
          ],
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Selection Components', type: BeFormBuilder)
Widget selectionComponentsUseCase(final BuildContext context) {
  final formKey = GlobalKey<BeFormBuilderState>();

  return Scaffold(
    appBar: AppBar(
      title: const Text('Selection Components'),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: BeFormBuilder(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Dropdown
            BeFormBuilderDropdown<String>(
              name: 'country',
              inputDecoration: const InputDecoration(labelText: 'Country', border: OutlineInputBorder()),
              hint: const Text('Select your country'),
              items:
                  [
                    'United States',
                    'Canada',
                    'United Kingdom',
                    'Australia',
                    'Germany',
                    'France',
                    'Japan',
                    'India',
                  ].map((final country) => DropdownMenuItem(value: country, child: Text(country))).toList(),
              validator: (final value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a country';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Radio Group
            BeFormBuilderRadioGroup<String>(
              name: 'gender',
              decoration: const InputDecoration(labelText: 'Gender', border: OutlineInputBorder()),
              options: const [
                BeFormBuilderFieldOption(value: 'male', child: Text('Male')),
                BeFormBuilderFieldOption(value: 'female', child: Text('Female')),
                BeFormBuilderFieldOption(value: 'other', child: Text('Other')),
                BeFormBuilderFieldOption(value: 'prefer_not_to_say', child: Text('Prefer not to say')),
              ],
              validator: (final value) {
                if (value == null || value.isEmpty) {
                  return 'Please select your gender';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Checkbox Group
            BeFormBuilderCheckboxGroup<String>(
              name: 'interests',
              decoration: const InputDecoration(labelText: 'Interests', border: OutlineInputBorder()),
              options: const [
                BeFormBuilderFieldOption(value: 'technology', child: Text('Technology')),
                BeFormBuilderFieldOption(value: 'sports', child: Text('Sports')),
                BeFormBuilderFieldOption(value: 'music', child: Text('Music')),
                BeFormBuilderFieldOption(value: 'art', child: Text('Art')),
                BeFormBuilderFieldOption(value: 'travel', child: Text('Travel')),
                BeFormBuilderFieldOption(value: 'cooking', child: Text('Cooking')),
              ],
              validator: (final value) {
                if (value == null || value.isEmpty) {
                  return 'Please select at least one interest';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Choice Chips
            BeFormBuilderChoiceChips<String>(
              name: 'skill_level',
              decoration: const InputDecoration(labelText: 'Skill Level', border: OutlineInputBorder()),
              options: const [
                BeFormBuilderChipOption(value: 'beginner', child: Text('Beginner')),
                BeFormBuilderChipOption(value: 'intermediate', child: Text('Intermediate')),
                BeFormBuilderChipOption(value: 'advanced', child: Text('Advanced')),
                BeFormBuilderChipOption(value: 'expert', child: Text('Expert')),
              ],
              validator: (final value) {
                if (value == null || value.isEmpty) {
                  return 'Please select your skill level';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Filter Chips
            BeFormBuilderFilterChips<String>(
              name: 'languages',
              decoration: const InputDecoration(labelText: 'Programming Languages', border: OutlineInputBorder()),
              options: const [
                BeFormBuilderChipOption(value: 'dart', child: Text('Dart')),
                BeFormBuilderChipOption(value: 'flutter', child: Text('Flutter')),
                BeFormBuilderChipOption(value: 'javascript', child: Text('JavaScript')),
                BeFormBuilderChipOption(value: 'python', child: Text('Python')),
                BeFormBuilderChipOption(value: 'java', child: Text('Java')),
                BeFormBuilderChipOption(value: 'swift', child: Text('Swift')),
                BeFormBuilderChipOption(value: 'kotlin', child: Text('Kotlin')),
              ],
              validator: (final value) {
                if (value == null || value.isEmpty) {
                  return 'Please select at least one language';
                }
                return null;
              },
            ),

            const SizedBox(height: 32),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.saveAndValidate() ?? false) {
                        final formData = formKey.currentState!.value;
                        _showFormDataDialog(context, formData);
                      }
                    },
                    child: const Text('Show Values'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      formKey.currentState?.reset();
                    },
                    child: const Text('Reset'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Sliders and Date Pickers', type: BeFormBuilder)
Widget slidersAndDatePickersUseCase(final BuildContext context) {
  final formKey = GlobalKey<BeFormBuilderState>();

  return Scaffold(
    appBar: AppBar(
      title: const Text('Sliders and Date Pickers'),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: BeFormBuilder(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Single Slider
            BeFormBuilderSlider(
              name: 'rating',
              decoration: const InputDecoration(labelText: 'Rate your experience (1-10)', border: OutlineInputBorder()),
              min: 1.0,
              max: 10.0,
              divisions: 9,
              initialValue: 5.0,
              validator: (final value) {
                if (value == null || value < 1) {
                  return 'Please provide a rating';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Range Slider
            BeFormBuilderRangeSlider(
              name: 'price_range',
              decoration: const InputDecoration(labelText: 'Budget Range (\$)', border: OutlineInputBorder()),
              min: 0.0,
              max: 10000.0,
              divisions: 100,
              initialValue: const RangeValues(1000.0, 5000.0),
              validator: (final value) {
                if (value == null) {
                  return 'Please select a price range';
                }
                if (value.end - value.start < 500) {
                  return 'Range should be at least \$500';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Date Picker
            BeFormBuilderDateTimePicker(
              name: 'birth_date',
              decoration: const InputDecoration(
                labelText: 'Date of Birth',
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
              inputType: InputType.date,
              lastDate: DateTime.now(),
              firstDate: DateTime(1900),
              validator: (final value) {
                if (value == null) {
                  return 'Please select your birth date';
                }
                final age = DateTime.now().difference(value).inDays / 365;
                if (age < 13) {
                  return 'You must be at least 13 years old';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Time Picker
            BeFormBuilderDateTimePicker(
              name: 'appointment_time',
              decoration: const InputDecoration(
                labelText: 'Preferred Appointment Time',
                prefixIcon: Icon(Icons.access_time),
                border: OutlineInputBorder(),
              ),
              inputType: InputType.time,
              validator: (final value) {
                if (value == null) {
                  return 'Please select a time';
                }
                final hour = value.hour;
                if (hour < 9 || hour > 17) {
                  return 'Appointments available 9 AM - 5 PM only';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // DateTime Picker
            BeFormBuilderDateTimePicker(
              name: 'event_datetime',
              decoration: const InputDecoration(
                labelText: 'Event Date & Time',
                prefixIcon: Icon(Icons.event),
                border: OutlineInputBorder(),
              ),
              inputType: InputType.both,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365)),
              validator: (final value) {
                if (value == null) {
                  return 'Please select event date and time';
                }
                if (value.isBefore(DateTime.now().add(const Duration(hours: 24)))) {
                  return 'Event must be at least 24 hours from now';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Date Range Picker
            BeFormBuilderDateRangePicker(
              name: 'vacation_dates',
              decoration: const InputDecoration(
                labelText: 'Vacation Dates',
                prefixIcon: Icon(Icons.date_range),
                border: OutlineInputBorder(),
              ),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365)),
              validator: (final value) {
                if (value == null) {
                  return 'Please select vacation dates';
                }
                final days = value.end.difference(value.start).inDays;
                if (days < 2) {
                  return 'Vacation must be at least 2 days';
                }
                if (days > 30) {
                  return 'Vacation cannot exceed 30 days';
                }
                return null;
              },
            ),

            const SizedBox(height: 32),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.saveAndValidate() ?? false) {
                        final formData = formKey.currentState!.value;
                        _showFormDataDialog(context, formData);
                      }
                    },
                    child: const Text('Validate & Show'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      formKey.currentState?.reset();
                    },
                    child: const Text('Reset All'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Complex Form Example', type: BeFormBuilder)
Widget complexFormExampleUseCase(final BuildContext context) {
  final formKey = GlobalKey<BeFormBuilderState>();

  return Scaffold(
    appBar: AppBar(
      title: const Text('Complex Form Example'),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: BeFormBuilder(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Personal Information Section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Personal Information', style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: BeFormBuilderTextField(
                            name: 'first_name',
                            decoration: const InputDecoration(labelText: 'First Name', border: OutlineInputBorder()),
                            validator: (final value) => value?.isEmpty == true ? 'Required' : null,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: BeFormBuilderTextField(
                            name: 'last_name',
                            decoration: const InputDecoration(labelText: 'Last Name', border: OutlineInputBorder()),
                            validator: (final value) => value?.isEmpty == true ? 'Required' : null,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    BeFormBuilderTextField(
                      name: 'email_complex',
                      decoration: const InputDecoration(
                        labelText: 'Email Address',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (final value) {
                        if (value?.isEmpty == true) return 'Email is required';
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
                          return 'Invalid email format';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    BeFormBuilderTextField(
                      name: 'phone',
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(),
                        helperText: 'Format: (123) 456-7890',
                      ),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9\-\(\)\s]'))],
                      validator: (final value) {
                        if (value?.isEmpty == true) return 'Phone is required';
                        if (!RegExp(r'^\(\d{3}\) \d{3}-\d{4}$').hasMatch(value!)) {
                          return 'Use format: (123) 456-7890';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Preferences Section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Preferences', style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: 16),

                    BeFormBuilderDropdown<String>(
                      name: 'language',
                      inputDecoration: const InputDecoration(
                        labelText: 'Preferred Language',
                        border: OutlineInputBorder(),
                      ),
                      items:
                          [
                            'English',
                            'Spanish',
                            'French',
                            'German',
                            'Japanese',
                          ].map((final lang) => DropdownMenuItem(value: lang, child: Text(lang))).toList(),
                      validator: (final value) => value == null ? 'Please select a language' : null,
                    ),

                    const SizedBox(height: 16),

                    BeFormBuilderSlider(
                      name: 'experience_level',
                      decoration: const InputDecoration(
                        labelText: 'Experience Level (Years)',
                        border: OutlineInputBorder(),
                      ),
                      min: 0.0,
                      max: 20.0,
                      divisions: 20,
                      initialValue: 2.0,
                    ),

                    const SizedBox(height: 16),

                    BeFormBuilderCheckboxGroup<String>(
                      name: 'notification_preferences',
                      decoration: const InputDecoration(
                        labelText: 'Notification Preferences',
                        border: OutlineInputBorder(),
                      ),
                      options: const [
                        BeFormBuilderFieldOption(value: 'email', child: Text('Email Notifications')),
                        BeFormBuilderFieldOption(value: 'sms', child: Text('SMS Notifications')),
                        BeFormBuilderFieldOption(value: 'push', child: Text('Push Notifications')),
                        BeFormBuilderFieldOption(value: 'newsletter', child: Text('Newsletter')),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Settings Section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Account Settings', style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: 16),

                    BeFormBuilderSwitch(
                      name: 'two_factor_auth',
                      title: const Text('Enable Two-Factor Authentication'),
                      subtitle: const Text('Adds extra security to your account'),
                      decoration: const InputDecoration(border: OutlineInputBorder()),
                    ),

                    const SizedBox(height: 16),

                    BeFormBuilderSwitch(
                      name: 'public_profile',
                      title: const Text('Make Profile Public'),
                      subtitle: const Text('Others can see your profile information'),
                      decoration: const InputDecoration(border: OutlineInputBorder()),
                    ),

                    const SizedBox(height: 16),

                    BeFormBuilderChoiceChips<String>(
                      name: 'theme_preference',
                      decoration: const InputDecoration(labelText: 'Theme Preference', border: OutlineInputBorder()),
                      options: const [
                        BeFormBuilderChipOption(value: 'light', child: Text('Light')),
                        BeFormBuilderChipOption(value: 'dark', child: Text('Dark')),
                        BeFormBuilderChipOption(value: 'system', child: Text('System')),
                      ],
                      initialValue: 'system',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (formKey.currentState?.saveAndValidate() ?? false) {
                        final formData = formKey.currentState!.value;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Profile saved successfully!'), backgroundColor: Colors.green),
                        );
                        _showFormDataDialog(context, formData);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fix errors above'), backgroundColor: Colors.red),
                        );
                      }
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('Save Profile'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      formKey.currentState?.reset();
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text('Form reset to defaults')));
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Reset Form'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

/// Helper function to show form data in a dialog
void _showFormDataDialog(final BuildContext context, final Map<String, dynamic> formData) {
  showDialog<void>(
    context: context,
    builder:
        (final context) => AlertDialog(
          title: const Text('Form Data'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children:
                  formData.entries.map((final entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: [
                            TextSpan(text: '${entry.key}: ', style: const TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: entry.value.toString()),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
          actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))],
        ),
  );
}
