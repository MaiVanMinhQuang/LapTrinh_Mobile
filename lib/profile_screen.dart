import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const Color navy = Color(0xFF0F172A);
  static const Color muted = Color(0xFF64748B);
  static const Color page = Color(0xFFF8FAFC);
  static const Color line = Color(0xFFE2E8F0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: page,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 390),
            child: Container(
              decoration: BoxDecoration(
                color: page,
                border: Border.all(color: line, width: 3),
                borderRadius: BorderRadius.circular(44),
              ),
              clipBehavior: Clip.antiAlias,
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 44, 24, 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTopBar(context),
                    const SizedBox(height: 8),
                    _buildProfileHeader(),
                    const SizedBox(height: 16),
                    _buildStatsCard(),
                    const SizedBox(height: 24),
                    _buildAboutSection(),
                    const SizedBox(height: 24),
                    _buildSkillsSection(),
                    const SizedBox(height: 24),
                    _buildProjectsSection(),
                    const SizedBox(height: 24),
                    _buildContactCard(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return SizedBox(
      height: 42,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _IconButton(
            icon: Icons.chevron_left,
            onTap: () => Navigator.maybePop(context),
          ),
          const Text(
            'Profile',
            style: TextStyle(
              color: navy,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          _IconButton(
            icon: Icons.share_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return SizedBox(
      width: double.infinity,
      height: 241,
      child: Column(
        children: [
          Center(
            child: SizedBox(
              width: 140,
              height: 140,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFFB088),
                          Color(0xFFFF8080),
                          Color(0xFFFFC64A),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  Container(
                    width: 132,
                    height: 132,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  ClipOval(
                    child: Image.asset(
                      'assets/profile.jpg',
                      width: 124,
                      height: 124,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 124,
                        height: 124,
                        color: const Color(0xFFE2E8F0),
                        child: const Icon(
                          Icons.person,
                          size: 52,
                          color: muted,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 2,
                    bottom: 2,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0284C7),
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        const SizedBox(height: 8),
        const Text(
          'Alex Rivers',
          style: TextStyle(
            color: navy,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 2),
        const Text(
          'Lead Mobile Engineer',
          style: TextStyle(
            color: muted,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.location_on_outlined, size: 14, color: muted),
              SizedBox(width: 4),
              Text(
                'Tokyo, Japan',
                style: TextStyle(
                  color: Color(0xFF475569),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
      ),
    );
  }

  Widget _buildStatsCard() {
    return Container(
      width: double.infinity,
      height: 58,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFF1F5F9)),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F1729).withOpacity(0.05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: const Row(
        children: [
          Expanded(child: _StatItem(value: '148', label: 'Projects')),
          _VerticalDivider(),
          Expanded(child: _StatItem(value: '9 Yrs', label: 'Experience')),
          _VerticalDivider(),
          Expanded(
            child: _StatItem(
              value: '4.9 ★',
              label: 'Rating',
              valueColor: Color(0xFFF0A000),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle('About Me'),
        SizedBox(height: 8),
        Text(
          'Passionate Lead Mobile Engineer specialized in Flutter, Dart, and building high-performance cross-platform applications. Focused on elegant solutions.',
          style: TextStyle(
            color: Color(0xFF475569),
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionTitle('Skills & Expertise'),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: const [
            _SkillChip(
              label: 'Flutter',
              icon: Icons.flutter_dash,
              background: Color(0xFFDDF4FF),
              foreground: Color(0xFF0284C7),
            ),
            _SkillChip(
              label: 'Dart',
              icon: Icons.code,
              background: Color(0xFFE0FBEA),
              foreground: Color(0xFF16A34A),
            ),
            _SkillChip(
              label: 'Clean Arch',
              icon: Icons.layers_outlined,
              background: Color(0xFFFFE4E6),
              foreground: Color(0xFFE11D48),
            ),
            _SkillChip(
              label: 'UI/UX',
              icon: Icons.brush_outlined,
              background: Color(0xFFF3E8FF),
              foreground: Color(0xFF9333EA),
            ),
            _SkillChip(
              label: 'Firebase',
              icon: Icons.local_fire_department_outlined,
              background: Color(0xFFFFF3D6),
              foreground: Color(0xFFD97706),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProjectsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionTitle('Featured Projects'),
        const SizedBox(height: 8),
        Row(
          children: const [
            Expanded(
              child: _ProjectCard(
                title: 'E-Shop Flutter',
                subtitle: 'Mobile App • 2026',
                imageUrl:
                    'https://images.unsplash.com/photo-1519389950473-47ba0277781c?w=600',
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _ProjectCard(
                title: 'Crypto Vault',
                subtitle: 'Finance • Clean Arch',
                imageUrl:
                    'https://images.unsplash.com/photo-1639762681485-074b7f938ba0?w=600',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContactCard() {
    return Container(
      decoration: _cardDecoration(radius: 20),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: const [
          _ContactRow(
            icon: Icons.alternate_email,
            text: 'Contact Information',
            emphasized: true,
          ),
          Divider(height: 1, color: Color(0xFFF1F5F9)),
          _ContactRow(
            icon: Icons.mail_outline,
            text: 'alex.rivers@email.com',
          ),
          Divider(height: 1, color: Color(0xFFF1F5F9)),
          _ContactRow(
            icon: Icons.phone_outlined,
            text: '+81 (90) 1234-5678',
          ),
        ],
      ),
    );
  }

  BoxDecoration _cardDecoration({double radius = 16}) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF0F172A).withOpacity(0.06),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE2E8F0)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 19, color: const Color(0xFF334155)),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.value,
    required this.label,
    this.valueColor = ProfileScreen.navy,
  });

  final String value;
  final String label;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          label,
          style: const TextStyle(color: ProfileScreen.muted, fontSize: 10),
        ),
      ],
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 30, color: const Color(0xFFE2E8F0));
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: ProfileScreen.navy,
        fontSize: 17,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  const _SkillChip({
    required this.label,
    required this.icon,
    required this.background,
    required this.foreground,
  });

  final String label;
  final IconData icon;
  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: foreground),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: foreground,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  final String title;
  final String subtitle;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            height: 85,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              height: 85,
              color: const Color(0xFFE2E8F0),
              child: const Center(
                child: Icon(Icons.image_outlined, color: ProfileScreen.muted),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 8, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: ProfileScreen.navy,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: ProfileScreen.muted,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.icon,
    required this.text,
    this.emphasized = false,
  });

  final IconData icon;
  final String text;
  final bool emphasized;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 16, color: const Color(0xFF64748B)),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: ProfileScreen.navy,
                  fontSize: 13,
                  fontWeight: emphasized ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              size: 17,
              color: Color(0xFFCBD5E1),
            ),
          ],
        ),
      ),
    );
  }
}