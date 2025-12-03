import 'package:flutter/material.dart';

class DocumentItem extends StatelessWidget {
  final String title;
  final String size;
  final String? fileType;
  final IconData? icon;
  final VoidCallback? onDownloadTap;

  const DocumentItem({
    super.key,
    required this.title,
    required this.size,
    this.fileType,
    this.icon,
    this.onDownloadTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Icon(
              icon ?? Icons.description,
              color: Colors.grey[600],
              size: 24,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Text(
                    size,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                  ),
                  if (fileType != null) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: _getFileTypeColor(),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        fileType!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
        if (onDownloadTap != null)
          IconButton(
            icon: const Icon(Icons.download, size: 20),
            onPressed: onDownloadTap,
            splashRadius: 20,
          ),
      ],
    );
  }

  Color _getFileTypeColor() {
    final typeUpper = fileType?.toUpperCase() ?? '';
    if (typeUpper == 'PDF') return Colors.red;
    if (typeUpper == 'XLS') return Colors.green;
    if (typeUpper == 'DOC') return Colors.blue;
    return Colors.grey;
  }
}
