import 'package:flutter/material.dart';

enum CardType { addNew, editData, deleteData, userProfile }

class ReusableCard extends StatelessWidget {
  final CardType type;
  final String? title;
  final String? subtitle;
  final String? imageUrl;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onTap;
  final Widget? customContent;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;

  const ReusableCard({
    Key? key,
    required this.type,
    this.title,
    this.subtitle,
    this.imageUrl,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.onTap,
    this.customContent,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 150,
      height: height ?? 150,
      margin: margin ?? const EdgeInsets.all(8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
          child: Container(
            decoration: BoxDecoration(
              color: _getBackgroundColor(),
              borderRadius: BorderRadius.circular(borderRadius ?? 16),
              border: _getBorder(),
            ),
            padding: padding ?? const EdgeInsets.all(16),
            child: customContent ?? _buildDefaultContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildDefaultContent() {
    switch (type) {
      case CardType.addNew:
        return _buildAddNewCard();
      case CardType.editData:
        return _buildEditDataCard();
      case CardType.deleteData:
        return _buildDeleteDataCard();
      case CardType.userProfile:
        return _buildUserProfileCard();
    }
  }

  Widget _buildAddNewCard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon ?? Icons.add,
          size: 32,
          color: textColor ?? const Color(0xFF9C27B0),
        ),
        const SizedBox(height: 8),
        Text(
          title ?? 'إضافة إلى',
          style: TextStyle(
            color: textColor ?? const Color(0xFF9C27B0),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildEditDataCard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon ?? Icons.edit,
          size: 24,
          color: textColor ?? Colors.white,
        ),
        const SizedBox(height: 8),
        Text(
          title ?? 'تعديل البيانات',
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildDeleteDataCard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon ?? Icons.delete,
          size: 24,
          color: textColor ?? Colors.red,
        ),
        const SizedBox(height: 8),
        Text(
          title ?? 'حذف الآن',
          style: TextStyle(
            color: textColor ?? Colors.red,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildUserProfileCard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
            image: imageUrl != null
                ? DecorationImage(
                    image: NetworkImage(imageUrl!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: imageUrl == null
              ? Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.grey[600],
                )
              : null,
        ),
        const SizedBox(height: 8),
        Text(
          title ?? 'محمد محمد',
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        if (subtitle != null)
          Text(
            subtitle!,
            style: TextStyle(
              color: (textColor ?? Colors.white).withOpacity(0.7),
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        // النقاط الثلاث
        Positioned(
          top: 8,
          right: 8,
          child: Icon(
            Icons.more_vert,
            color: textColor ?? Colors.white,
            size: 16,
          ),
        ),
      ],
    );
  }

  Color _getBackgroundColor() {
    if (backgroundColor != null) return backgroundColor!;

    switch (type) {
      case CardType.addNew:
        return Colors.transparent;
      case CardType.editData:
        return const Color(0xFF1E3A8A);
      case CardType.deleteData:
        return const Color(0xFF1E3A8A);
      case CardType.userProfile:
        return const Color(0xFF1E3A8A);
    }
  }

  Border? _getBorder() {
    switch (type) {
      case CardType.addNew:
        return Border.all(
          color: const Color(0xFF9C27B0),
          width: 2,
          style: BorderStyle.solid,
        );
      default:
        return null;
    }
  }
}

// مثال على الاستخدام
class ExampleUsage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            // كارت إضافة جديد
            ReusableCard(
              type: CardType.addNew,
              title: 'إضافة إلى',
              onTap: () => print('Add new pressed'),
            ),

            // كارت تعديل البيانات
            ReusableCard(
              type: CardType.editData,
              title: 'تعديل البيانات',
              icon: Icons.edit,
              onTap: () => print('Edit data pressed'),
            ),

            // كارت حذف
            ReusableCard(
              type: CardType.deleteData,
              title: 'حذف الآن',
              icon: Icons.delete,
              onTap: () => print('Delete pressed'),
            ),

            // كارت المستخدم
            ReusableCard(
              type: CardType.userProfile,
              title: 'محمد محمد',
              imageUrl: 'https://example.com/avatar.jpg',
              onTap: () => print('User profile pressed'),
            ),

            // مثال على التخصيص
            ReusableCard(
              type: CardType.userProfile,
              title: 'مؤمن محمد',
              backgroundColor: const Color(0xFF7C3AED),
              width: 200,
              height: 180,
              onTap: () => print('Custom user pressed'),
            ),

            // كارت مخصص بالكامل
            ReusableCard(
              type: CardType.addNew,
              backgroundColor: const Color(0xFF059669),
              customContent: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.upload, size: 32, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    'رفع ملف',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
              onTap: () => print('Upload file pressed'),
            ),
          ],
        ),
      ),
    );
  }
}
