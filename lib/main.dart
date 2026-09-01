// ============================================================================
// PREMIUM PORTFOLIO — Utkarsha Thadwe | Data Analyst
// Single-file Flutter application with glassmorphism UI + smooth animations
// ============================================================================
//
// SETUP INSTRUCTIONS
// -------------------------------------------------------------------------
// 1. Create a new Flutter project:  flutter create utkarsha_portfolio
// 2. Replace lib/main.dart with this file.
// 3. Add these dependencies to pubspec.yaml (or run the commands below):
//
//      flutter pub add google_fonts
//      flutter pub add url_launcher
//      flutter pub add visibility_detector
//
//    pubspec.yaml dependencies block should look like:
//      dependencies:
//        flutter:
//          sdk: flutter
//        google_fonts: ^6.2.1
//        url_launcher: ^6.3.0
//        visibility_detector: ^0.4.0+2
//
// 4. Run:  flutter run -d chrome   (best experience is Web/Desktop, but it
//    is fully responsive and works great on mobile too)
// ============================================================================

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() => runApp(const PortfolioApp());

// ============================================================================
// THEME / PALETTE
// ============================================================================
class AppColors {
  static const bgDark = Color(0xFF060B18);
  static const bgDark2 = Color(0xFF0A1428);
  static const surface = Color(0xFF0F1C33);
  static const surfaceLight = Color(0xFF152541);
  static const accent = Color(0xFF5EE7C9); // premium teal/mint
  static const accentSoft = Color(0xFF7FB8FF); // soft blue
  static const gold = Color(0xFFE6C36A);
  static const textPrimary = Color(0xFFEAF2FF);
  static const textSecondary = Color(0xFF93A3C4);
  static const textMuted = Color(0xFF5C6A8A);
  static const cardBorder = Color(0x1AFFFFFF);
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utkarsha Thadwe — Data Analyst',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.bgDark,
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
        textTheme: GoogleFonts.plusJakartaSansTextTheme(
          ThemeData.dark().textTheme,
        ),
      ),
      home: const PortfolioHome(),
    );
  }
}

// ============================================================================
// DATA MODELS
// ============================================================================
class SkillGroup {
  final String title;
  final IconData icon;
  final List<String> items;
  const SkillGroup(this.title, this.icon, this.items);
}

class ProjectData {
  final String title;
  final String stack;
  final List<String> points;
  final IconData icon;
  const ProjectData(this.title, this.stack, this.points, this.icon);
}

class EduData {
  final String degree;
  final String school;
  final String years;
  final String gpa;
  const EduData(this.degree, this.school, this.years, this.gpa);
}

const List<SkillGroup> kSkillGroups = [
  SkillGroup('Data Analysis & Visualization', Icons.query_stats_rounded, [
    'SQL (PostgreSQL, MySQL)',
    'Power BI',
    'DAX',
    'Excel (Advanced Formulas, Pivot Tables)',
    'Power Query',
  ]),
  SkillGroup('Data Analytics', Icons.insights_rounded, [
    'Data Cleaning & Transformation',
    'Exploratory Data Analysis (EDA)',
    'Data Modeling',
    'Descriptive Statistics',
    'KPI Analysis',
  ]),
  SkillGroup('Programming & Tools', Icons.code_rounded, [
    'Python (Pandas, NumPy)',
    'Java',
    'Git',
  ]),
  SkillGroup('Core Competencies', Icons.dashboard_customize_rounded, [
    'SQL Querying',
    'Dashboard Development',
    'Data Validation',
    'Reporting',
    'Data-Driven Insights',
  ]),
  SkillGroup('Technical Exposure', Icons.auto_awesome_rounded, [
    'GenAI Tools',
    'GCP Basics',
  ]),
];

const List<ProjectData> kProjects = [
  ProjectData(
    'Finance Expense Tracker',
    'MS Excel · Power Query · PostgreSQL · SQL · Power BI · DAX',
    [
      'Cleaned and transformed financial transaction data using Excel and Power Query for accurate analysis.',
      'Used PostgreSQL and SQL to analyze spending by department, category, region, and payment method.',
      'Calculated budget, actual spending, and variance to identify differences in financial performance.',
      'Built an interactive Power BI dashboard with KPI cards, charts, and slicers for financial reporting.',
    ],
    Icons.account_balance_wallet_rounded,
  ),
  ProjectData(
    'Sales Performance & Insights Dashboard',
    'Power BI · Excel · SQL · DAX',
    [
      'Cleaned and prepared 2,000+ sales records using Excel and SQL for reporting and analysis.',
      'Analyzed sales performance across different categories and business dimensions.',
      'Created Power BI dashboards with KPI cards, trend charts, and interactive slicers.',
      'Used the dashboard to identify sales trends and present key insights from the data.',
    ],
    Icons.bar_chart_rounded,
  ),
  ProjectData(
    'JPMorgan Chase Software Engineering Job Simulation',
    'Java · Spring Boot · REST APIs · H2 Database',
    [
      'Developed backend components using Java and Spring Boot as part of the software engineering simulation.',
      'Integrated a REST API to retrieve and process transaction-related data.',
      'Used Spring Data JPA and H2 Database for storing and managing application data.',
      'Worked with Kafka to process transaction streams.',
    ],
    Icons.account_tree_rounded,
  ),
  ProjectData(
    'Maid Connect: Relational Data System',
    'SQL · MySQL · Java · Spring Boot',
    [
      'Developed a web-based system to connect users with maid service providers based on their requirements.',
      'Designed MySQL tables to store user, maid, service, and booking-related information.',
      'Used SQL queries and JDBC to insert, retrieve, update, and manage application data.',
      'Built backend functionality using Java and deployed the application using Apache Tomcat.',
    ],
    Icons.home_repair_service_rounded,
  ),
];

const List<EduData> kEducation = [
  EduData('Master of Computer Application', 'Savitribai Phule Pune University',
      '2023 – 2025', 'GPA: 72.48%'),
  EduData('Bachelor of Computer Application',
      'Swami Ramanand Teerth Marathwada University', '2020 – 2022',
      'GPA: 81.69%'),
];

const List<String> kCertifications = [
  'Full Stack Diploma in Java — FirstBit Solutions (2023)',
  'Cloud Computing — Udemy',
  'Ultimate Job-Ready AI-Powered Data Analytics Course — CodeWithHarry (Ongoing)',
];

const String kEmail = 'thadweutkarsha@gmail.com';
const String kGithub = 'https://github.com/Utkarshamt';
const String kLinkedIn =
    'https://www.linkedin.com/in/utkarsha-thadwe-67162b249/';
const String kResume =
    'https://drive.google.com/file/d/1GIdtt3pJlA4nQIy0BJq1I9HCfZ8GecJh/view?usp=sharing';

// ============================================================================
// HOME PAGE
// ============================================================================
class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});
  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scroll = ScrollController();
  final _heroKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _eduKey = GlobalKey();
  final _contactKey = GlobalKey();

  double _navOpacity = 0;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      final o = (_scroll.offset / 180).clamp(0.0, 1.0);
      if (o != _navOpacity) setState(() => _navOpacity = o);
    });
  }

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 760;

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: Stack(
        children: [
          const _AmbientBackground(),
          SingleChildScrollView(
            controller: _scroll,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(key: _heroKey, child: _HeroSection(isMobile: isMobile, onExplore: () => _scrollTo(_projectsKey))),
                _RevealSection(
                  child: SizedBox(key: _aboutKey, child: _AboutSection(isMobile: isMobile)),
                ),
                _RevealSection(
                  child: SizedBox(key: _skillsKey, child: _SkillsSection(isMobile: isMobile)),
                ),
                _RevealSection(
                  child: SizedBox(key: _projectsKey, child: _ProjectsSection(isMobile: isMobile)),
                ),
                _RevealSection(
                  child: SizedBox(key: _eduKey, child: _EducationSection(isMobile: isMobile)),
                ),
                _RevealSection(
                  child: SizedBox(key: _contactKey, child: _ContactSection(isMobile: isMobile)),
                ),
                const _Footer(),
              ],
            ),
          ),
          _TopNav(
            opacity: _navOpacity,
            isMobile: isMobile,
            onHome: () => _scrollTo(_heroKey),
            onAbout: () => _scrollTo(_aboutKey),
            onSkills: () => _scrollTo(_skillsKey),
            onProjects: () => _scrollTo(_projectsKey),
            onEdu: () => _scrollTo(_eduKey),
            onContact: () => _scrollTo(_contactKey),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// AMBIENT ANIMATED BACKGROUND (floating gradient blobs)
// ============================================================================
class _AmbientBackground extends StatefulWidget {
  const _AmbientBackground();
  @override
  State<_AmbientBackground> createState() => _AmbientBackgroundState();
}

class _AmbientBackgroundState extends State<_AmbientBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(seconds: 18))
      ..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned.fill(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.bgDark, AppColors.bgDark2, AppColors.bgDark],
          ),
        ),
        child: AnimatedBuilder(
          animation: _ctrl,
          builder: (context, _) {
            final t = _ctrl.value * 2 * 3.14159265;
            return Stack(
              children: [
                _blob(
                  size,
                  dx: 0.15 + 0.08 * _sin(t),
                  dy: 0.10 + 0.06 * _cos(t * 0.8),
                  color: AppColors.accent.withOpacity(0.14),
                  radius: 260,
                ),
                _blob(
                  size,
                  dx: 0.80 + 0.06 * _cos(t * 0.6),
                  dy: 0.30 + 0.08 * _sin(t * 0.7),
                  color: AppColors.accentSoft.withOpacity(0.12),
                  radius: 320,
                ),
                _blob(
                  size,
                  dx: 0.55 + 0.07 * _sin(t * 0.5),
                  dy: 0.85 + 0.05 * _cos(t * 0.9),
                  color: AppColors.gold.withOpacity(0.08),
                  radius: 280,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  double _sin(double v) => (v).isNaN ? 0 : (SinCache.sin(v));
  double _cos(double v) => (v).isNaN ? 0 : (SinCache.cos(v));

  Widget _blob(Size size, {required double dx, required double dy, required Color color, required double radius}) {
    return Positioned(
      left: size.width * dx - radius / 2,
      top: size.height * dy - radius / 2,
      child: IgnorePointer(
        child: Container(
          width: radius,
          height: radius,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(colors: [color, color.withOpacity(0)]),
          ),
        ),
      ),
    );
  }
}

// tiny helper so we don't import dart:math at top-level twice; keeps file self-contained
class SinCache {
  static double sin(double v) => _sinImpl(v);
  static double cos(double v) => _sinImpl(v + 1.5707963267948966);
  static double _sinImpl(double x) {
    // simple Taylor approximation is unnecessary — use dart:math via indirection
    return _MathBridge.sin(x);
  }
}

// ============================================================================
// REVEAL-ON-SCROLL WRAPPER
// ============================================================================
class _RevealSection extends StatefulWidget {
  final Widget child;
  const _RevealSection({required this.child});
  @override
  State<_RevealSection> createState() => _RevealSectionState();
}

class _RevealSectionState extends State<_RevealSection> {
  bool _visible = false;
  final Key _visKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: _visKey,
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.15 && !_visible) {
          setState(() => _visible = true);
        }
      },
      child: AnimatedOpacity(
        opacity: _visible ? 1 : 0,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeOut,
        child: AnimatedSlide(
          offset: _visible ? Offset.zero : const Offset(0, 0.08),
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOutCubic,
          child: widget.child,
        ),
      ),
    );
  }
}

// ============================================================================
// TOP NAV
// ============================================================================
class _TopNav extends StatelessWidget {
  final double opacity;
  final bool isMobile;
  final VoidCallback onHome, onAbout, onSkills, onProjects, onEdu, onContact;
  const _TopNav({
    required this.opacity,
    required this.isMobile,
    required this.onHome,
    required this.onAbout,
    required this.onSkills,
    required this.onProjects,
    required this.onEdu,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16 * opacity, sigmaY: 16 * opacity),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 56, vertical: 18),
            decoration: BoxDecoration(
              color: AppColors.bgDark.withOpacity(0.65 * opacity),
              border: Border(
                bottom: BorderSide(
                  color: AppColors.cardBorder.withOpacity(opacity),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onHome,
                  child: Row(
                    children: [
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          gradient: const LinearGradient(
                            colors: [AppColors.accent, AppColors.accentSoft],
                          ),
                        ),
                        alignment: Alignment.center,
                        child: const Text('UT',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 13,
                                color: AppColors.bgDark)),
                      ),
                      const SizedBox(width: 10),
                      if (!isMobile)
                        Text('Utkarsha Thadwe',
                            style: GoogleFonts.plusJakartaSans(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w700,
                                fontSize: 15)),
                    ],
                  ),
                ),
                if (!isMobile)
                  Row(
                    children: [
                      _NavLink('About', onAbout),
                      _NavLink('Skills', onSkills),
                      _NavLink('Projects', onProjects),
                      _NavLink('Education', onEdu),
                      const SizedBox(width: 8),
                      _NavCtaButton(onTap: onContact),
                    ],
                  )
                else
                  _NavCtaButton(onTap: onContact, compact: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavLink(this.label, this.onTap);
  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: GoogleFonts.plusJakartaSans(
              color: _hover ? AppColors.accent : AppColors.textSecondary,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}

class _NavCtaButton extends StatefulWidget {
  final VoidCallback onTap;
  final bool compact;
  const _NavCtaButton({required this.onTap, this.compact = false});
  @override
  State<_NavCtaButton> createState() => _NavCtaButtonState();
}

class _NavCtaButtonState extends State<_NavCtaButton> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
              horizontal: widget.compact ? 14 : 20, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(
                color: _hover ? AppColors.accent : AppColors.cardBorder),
            borderRadius: BorderRadius.circular(30),
            color: _hover ? AppColors.accent.withOpacity(0.1) : Colors.transparent,
          ),
          child: Text('Contact',
              style: GoogleFonts.plusJakartaSans(
                  color: _hover ? AppColors.accent : AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 13)),
        ),
      ),
    );
  }
}

// ============================================================================
// HERO SECTION
// ============================================================================
class _HeroSection extends StatefulWidget {
  final bool isMobile;
  final VoidCallback onExplore;
  const _HeroSection({required this.isMobile, required this.onExplore});
  @override
  State<_HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<_HeroSection>
    with TickerProviderStateMixin {
  late final AnimationController _entrance;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  static const String _fullText = 'Data Analyst';
  String _typed = '';
  int _charIndex = 0;
  late Ticker _typeTicker;
  double _accum = 0;

  @override
  void initState() {
    super.initState();
    _entrance = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _fade = CurvedAnimation(parent: _entrance, curve: Curves.easeOut);
    _slide = Tween<Offset>(begin: const Offset(0, 0.15), end: Offset.zero)
        .animate(CurvedAnimation(parent: _entrance, curve: Curves.easeOutCubic));
    _entrance.forward();

    _typeTicker = createTicker((elapsed) {
      final ms = elapsed.inMilliseconds - _accum;
      if (ms > 65 && _charIndex < _fullText.length) {
        _accum = elapsed.inMilliseconds.toDouble();
        setState(() {
          _charIndex++;
          _typed = _fullText.substring(0, _charIndex);
        });
      }
    });
    Future.delayed(const Duration(milliseconds: 500), () => _typeTicker.start());
  }

  @override
  void dispose() {
    _entrance.dispose();
    _typeTicker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = widget.isMobile;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 22 : 80, vertical: isMobile ? 120 : 0),
      child: SizedBox(
        height: isMobile ? null : MediaQuery.of(context).size.height,
        child: Center(
          child: FadeTransition(
            opacity: _fade,
            child: SlideTransition(
              position: _slide,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _pill('✦ Available for opportunities'),
                  const SizedBox(height: 26),
                  Text(
                    'Hi, I\'m',
                    style: GoogleFonts.plusJakartaSans(
                        color: AppColors.textSecondary,
                        fontSize: isMobile ? 18 : 22,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 6),
                  ShaderMask(
                    shaderCallback: (rect) => const LinearGradient(
                      colors: [AppColors.textPrimary, AppColors.accent],
                    ).createShader(rect),
                    child: Text(
                      'Utkarsha Thadwe',
                      style: GoogleFonts.plusJakartaSans(
                        color: Colors.white,
                        fontSize: isMobile ? 40 : 72,
                        fontWeight: FontWeight.w800,
                        height: 1.05,
                        letterSpacing: -1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Text(
                        _typed,
                        style: GoogleFonts.robotoMono(
                            color: AppColors.accent,
                            fontSize: isMobile ? 18 : 26,
                            fontWeight: FontWeight.w600),
                      ),
                      _BlinkingCursor(isMobile: isMobile),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 620),
                    child: Text(
                      'Analytical and detail-oriented Data Analyst with a Master\'s in Computer Applications and hands-on project experience in SQL, Power BI, Excel, and Python — turning financial and sales datasets into clear, data-driven insights.',
                      style: GoogleFonts.plusJakartaSans(
                          color: AppColors.textSecondary,
                          fontSize: isMobile ? 14.5 : 16.5,
                          height: 1.6),
                    ),
                  ),
                  const SizedBox(height: 36),
                  Wrap(
                    spacing: 16,
                    runSpacing: 14,
                    children: [
                      _PrimaryButton(
                        label: 'View Projects',
                        icon: Icons.arrow_forward_rounded,
                        onTap: widget.onExplore,
                      ),
                      _SecondaryButton(
                        label: 'Download Resume',
                        icon: Icons.download_rounded,
                        onTap: () => _launch(kResume),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      _SocialIcon(icon: Icons.code_rounded, onTap: () => _launch(kGithub)),
                      const SizedBox(width: 14),
                      _SocialIcon(icon: Icons.business_center_rounded, onTap: () => _launch(kLinkedIn)),
                      const SizedBox(width: 14),
                      _SocialIcon(icon: Icons.mail_outline_rounded, onTap: () => _launch('mailto:$kEmail')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _pill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.accent.withOpacity(0.08),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.accent.withOpacity(0.35)),
      ),
      child: Text(text,
          style: GoogleFonts.plusJakartaSans(
              color: AppColors.accent,
              fontSize: 12.5,
              fontWeight: FontWeight.w600)),
    );
  }
}

class _BlinkingCursor extends StatefulWidget {
  final bool isMobile;
  const _BlinkingCursor({required this.isMobile});
  @override
  State<_BlinkingCursor> createState() => _BlinkingCursorState();
}

class _BlinkingCursorState extends State<_BlinkingCursor>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;
  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 800))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _c,
      child: Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Container(
          width: 2,
          height: widget.isMobile ? 20 : 26,
          color: AppColors.accent,
        ),
      ),
    );
  }
}

// ============================================================================
// SHARED: SECTION HEADER
// ============================================================================
class _SectionHeader extends StatelessWidget {
  final String kicker;
  final String title;
  const _SectionHeader({required this.kicker, required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 28, height: 2, color: AppColors.accent),
            const SizedBox(width: 10),
            Text(kicker.toUpperCase(),
                style: GoogleFonts.plusJakartaSans(
                    color: AppColors.accent,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2)),
          ],
        ),
        const SizedBox(height: 12),
        Text(title,
            style: GoogleFonts.plusJakartaSans(
                color: AppColors.textPrimary,
                fontSize: 32,
                fontWeight: FontWeight.w800)),
      ],
    );
  }
}

// ============================================================================
// ABOUT SECTION
// ============================================================================
class _AboutSection extends StatelessWidget {
  final bool isMobile;
  const _AboutSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final stats = [
      ('4', 'Projects Delivered'),
      ('3', 'Certifications'),
      ('2K+', 'Records Analyzed'),
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 22 : 80, vertical: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(kicker: 'About Me', title: 'Turning raw data into decisions'),
          const SizedBox(height: 28),
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: isMobile ? 0 : 3,
                child: Text(
                  'I\'m a Data Analyst with a Master\'s in Computer Applications and hands-on experience across SQL, Power BI, Excel, and Python. I specialize in data cleaning, SQL querying, data visualization, and dashboard development, with working knowledge of DAX and data analysis. I enjoy working with financial and sales datasets — identifying trends, tracking KPIs, and presenting clear, data-driven insights that support real decisions.',
                  style: GoogleFonts.plusJakartaSans(
                      color: AppColors.textSecondary, fontSize: 15.5, height: 1.75),
                ),
              ),
              SizedBox(width: isMobile ? 0 : 40, height: isMobile ? 32 : 0),
              Expanded(
                flex: isMobile ? 0 : 2,
                child: Wrap(
                  spacing: 14,
                  runSpacing: 14,
                  children: stats
                      .map((s) => _StatCard(number: s.$1, label: s.$2, isMobile: isMobile))
                      .toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatefulWidget {
  final String number;
  final String label;
  final bool isMobile;
  const _StatCard({required this.number, required this.label, required this.isMobile});
  @override
  State<_StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<_StatCard> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        transform: Matrix4.translationValues(0, _hover ? -4 : 0, 0),
        width: widget.isMobile ? 150 : 170,
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 18),
        decoration: BoxDecoration(
          color: AppColors.surface.withOpacity(0.6),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: _hover ? AppColors.accent.withOpacity(0.5) : AppColors.cardBorder),
          boxShadow: _hover
              ? [BoxShadow(color: AppColors.accent.withOpacity(0.15), blurRadius: 24, spreadRadius: 1)]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.number,
                style: GoogleFonts.plusJakartaSans(
                    color: AppColors.accent, fontSize: 28, fontWeight: FontWeight.w800)),
            const SizedBox(height: 4),
            Text(widget.label,
                style: GoogleFonts.plusJakartaSans(
                    color: AppColors.textSecondary, fontSize: 12.5, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// SKILLS SECTION
// ============================================================================
class _SkillsSection extends StatelessWidget {
  final bool isMobile;
  const _SkillsSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface.withOpacity(0.25),
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 22 : 80, vertical: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(kicker: 'What I Work With', title: 'Skills & Tools'),
          const SizedBox(height: 30),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: kSkillGroups
                .map((g) => _SkillCard(group: g, width: isMobile ? double.infinity : 360))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final SkillGroup group;
  final double width;
  const _SkillCard({required this.group, required this.width});
  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: widget.width,
        padding: const EdgeInsets.all(24),
        transform: Matrix4.translationValues(0, _hover ? -6 : 0, 0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.surfaceLight.withOpacity(_hover ? 0.9 : 0.55),
              AppColors.surface.withOpacity(0.5),
            ],
          ),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
              color: _hover ? AppColors.accent.withOpacity(0.5) : AppColors.cardBorder),
          boxShadow: _hover
              ? [BoxShadow(color: AppColors.accent.withOpacity(0.12), blurRadius: 30, spreadRadius: 2)]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.accent.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(widget.group.icon, color: AppColors.accent, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(widget.group.title,
                      style: GoogleFonts.plusJakartaSans(
                          color: AppColors.textPrimary, fontSize: 15.5, fontWeight: FontWeight.w700)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.group.items
                  .map((s) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                        decoration: BoxDecoration(
                          color: AppColors.bgDark.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: AppColors.cardBorder),
                        ),
                        child: Text(s,
                            style: GoogleFonts.plusJakartaSans(
                                color: AppColors.textSecondary,
                                fontSize: 12.5,
                                fontWeight: FontWeight.w500)),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// PROJECTS SECTION
// ============================================================================
class _ProjectsSection extends StatelessWidget {
  final bool isMobile;
  const _ProjectsSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 22 : 80, vertical: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(kicker: 'Selected Work', title: 'Featured Projects'),
          const SizedBox(height: 30),
          LayoutBuilder(builder: (context, constraints) {
            final cols = isMobile ? 1 : (constraints.maxWidth > 1100 ? 2 : 1);
            final cardWidth = cols == 1
                ? constraints.maxWidth
                : (constraints.maxWidth - 24) / 2;
            return Wrap(
              spacing: 24,
              runSpacing: 24,
              children: kProjects
                  .map((p) => SizedBox(width: cardWidth, child: _ProjectCard(project: p)))
                  .toList(),
            );
          }),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final ProjectData project;
  const _ProjectCard({required this.project});
  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: const EdgeInsets.all(28),
        transform: Matrix4.translationValues(0, _hover ? -8 : 0, 0),
        decoration: BoxDecoration(
          color: AppColors.surface.withOpacity(_hover ? 0.75 : 0.5),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: _hover ? AppColors.accent.withOpacity(0.55) : AppColors.cardBorder,
              width: _hover ? 1.4 : 1),
          boxShadow: _hover
              ? [BoxShadow(color: AppColors.accent.withOpacity(0.18), blurRadius: 34, spreadRadius: 1)]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [AppColors.accent, AppColors.accentSoft]),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(p.icon, color: AppColors.bgDark, size: 22),
                ),
                const Spacer(),
                AnimatedRotation(
                  turns: _hover ? 0.125 : 0,
                  duration: const Duration(milliseconds: 250),
                  child: Icon(Icons.arrow_outward_rounded,
                      color: _hover ? AppColors.accent : AppColors.textMuted, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Text(p.title,
                style: GoogleFonts.plusJakartaSans(
                    color: AppColors.textPrimary, fontSize: 19, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Text(p.stack,
                style: GoogleFonts.robotoMono(
                    color: AppColors.accent, fontSize: 12, fontWeight: FontWeight.w500)),
            const SizedBox(height: 16),
            ...p.points.map((pt) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Container(
                          width: 5,
                          height: 5,
                          decoration: const BoxDecoration(
                              color: AppColors.accent, shape: BoxShape.circle),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(pt,
                            style: GoogleFonts.plusJakartaSans(
                                color: AppColors.textSecondary, fontSize: 13.5, height: 1.55)),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// EDUCATION + CERTIFICATIONS SECTION
// ============================================================================
class _EducationSection extends StatelessWidget {
  final bool isMobile;
  const _EducationSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface.withOpacity(0.25),
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 22 : 80, vertical: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(kicker: 'Background', title: 'Education & Certifications'),
          const SizedBox(height: 30),
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: isMobile ? 0 : 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('EDUCATION',
                        style: GoogleFonts.plusJakartaSans(
                            color: AppColors.textMuted, fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1.5)),
                    const SizedBox(height: 18),
                    ...kEducation.map((e) => _TimelineTile(edu: e)),
                  ],
                ),
              ),
              SizedBox(width: isMobile ? 0 : 50, height: isMobile ? 40 : 0),
              Expanded(
                flex: isMobile ? 0 : 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CERTIFICATIONS',
                        style: GoogleFonts.plusJakartaSans(
                            color: AppColors.textMuted, fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1.5)),
                    const SizedBox(height: 18),
                    ...kCertifications.map((c) => _CertTile(text: c)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TimelineTile extends StatelessWidget {
  final EduData edu;
  const _TimelineTile({required this.edu});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.accent,
                    boxShadow: [BoxShadow(color: AppColors.accent.withOpacity(0.5), blurRadius: 10, spreadRadius: 2)],
                  ),
                ),
                Expanded(child: Container(width: 2, color: AppColors.cardBorder)),
              ],
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(18),
                margin: const EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                  color: AppColors.surfaceLight.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.cardBorder),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(edu.degree,
                        style: GoogleFonts.plusJakartaSans(
                            color: AppColors.textPrimary, fontSize: 15, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 4),
                    Text(edu.school,
                        style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary, fontSize: 13)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(edu.years,
                            style: GoogleFonts.robotoMono(color: AppColors.accent, fontSize: 11.5)),
                        const SizedBox(width: 12),
                        Text(edu.gpa,
                            style: GoogleFonts.plusJakartaSans(color: AppColors.textMuted, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CertTile extends StatefulWidget {
  final String text;
  const _CertTile({required this.text});
  @override
  State<_CertTile> createState() => _CertTileState();
}

class _CertTileState extends State<_CertTile> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        transform: Matrix4.translationValues(_hover ? 6 : 0, 0, 0),
        decoration: BoxDecoration(
          color: AppColors.surfaceLight.withOpacity(_hover ? 0.7 : 0.4),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _hover ? AppColors.gold.withOpacity(0.5) : AppColors.cardBorder),
        ),
        child: Row(
          children: [
            Icon(Icons.workspace_premium_rounded, color: AppColors.gold, size: 20),
            const SizedBox(width: 14),
            Expanded(
              child: Text(widget.text,
                  style: GoogleFonts.plusJakartaSans(
                      color: AppColors.textSecondary, fontSize: 13.5, fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// CONTACT SECTION
// ============================================================================
class _ContactSection extends StatelessWidget {
  final bool isMobile;
  const _ContactSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 22 : 80, vertical: 90),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 60, vertical: isMobile ? 40 : 60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.surfaceLight.withOpacity(0.7), AppColors.surface.withOpacity(0.4)],
          ),
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('LET\'S CONNECT',
                style: GoogleFonts.plusJakartaSans(
                    color: AppColors.accent, fontSize: 12.5, fontWeight: FontWeight.w700, letterSpacing: 2)),
            const SizedBox(height: 14),
            Text('Have a data problem worth solving?',
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(
                    color: AppColors.textPrimary,
                    fontSize: isMobile ? 26 : 36,
                    fontWeight: FontWeight.w800)),
            const SizedBox(height: 14),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Text(
                'I\'m open to Data Analyst roles and collaborations. Reach out — I\'d love to hear from you.',
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary, fontSize: 14.5, height: 1.6),
              ),
            ),
            const SizedBox(height: 34),
            Wrap(
              spacing: 16,
              runSpacing: 14,
              alignment: WrapAlignment.center,
              children: [
                _PrimaryButton(
                  label: kEmail,
                  icon: Icons.mail_outline_rounded,
                  onTap: () => _launch('mailto:$kEmail'),
                ),
                _SecondaryButton(
                  label: 'GitHub',
                  icon: Icons.code_rounded,
                  onTap: () => _launch(kGithub),
                ),
                _SecondaryButton(
                  label: 'LinkedIn',
                  icon: Icons.business_center_rounded,
                  onTap: () => _launch(kLinkedIn),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Container(height: 1, width: 60, color: AppColors.cardBorder),
          const SizedBox(height: 18),
          Text('Designed & built with Flutter · © 2026 Utkarsha Thadwe',
              style: GoogleFonts.plusJakartaSans(color: AppColors.textMuted, fontSize: 12)),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

// ============================================================================
// SHARED BUTTONS / ICONS
// ============================================================================
class _PrimaryButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  const _PrimaryButton({required this.label, required this.icon, required this.onTap});
  @override
  State<_PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<_PrimaryButton> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: LinearGradient(colors: _hover
                ? [AppColors.accentSoft, AppColors.accent]
                : [AppColors.accent, AppColors.accentSoft]),
            boxShadow: [
              BoxShadow(
                  color: AppColors.accent.withOpacity(_hover ? 0.35 : 0.2),
                  blurRadius: _hover ? 26 : 16,
                  offset: const Offset(0, 8)),
            ],
          ),
          transform: Matrix4.translationValues(0, _hover ? -3 : 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.label,
                  style: GoogleFonts.plusJakartaSans(
                      color: AppColors.bgDark, fontWeight: FontWeight.w700, fontSize: 14)),
              const SizedBox(width: 8),
              Icon(widget.icon, color: AppColors.bgDark, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class _SecondaryButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  const _SecondaryButton({required this.label, required this.icon, required this.onTap});
  @override
  State<_SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<_SecondaryButton> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: _hover ? AppColors.accent.withOpacity(0.08) : Colors.transparent,
            border: Border.all(color: _hover ? AppColors.accent : AppColors.cardBorder, width: 1.4),
          ),
          transform: Matrix4.translationValues(0, _hover ? -3 : 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, color: _hover ? AppColors.accent : AppColors.textPrimary, size: 17),
              const SizedBox(width: 8),
              Text(widget.label,
                  style: GoogleFonts.plusJakartaSans(
                      color: _hover ? AppColors.accent : AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.5)),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _SocialIcon({required this.icon, required this.onTap});
  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 44,
          height: 44,
          transform: Matrix4.translationValues(0, _hover ? -3 : 0, 0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _hover ? AppColors.accent.withOpacity(0.12) : AppColors.surface.withOpacity(0.6),
            border: Border.all(color: _hover ? AppColors.accent : AppColors.cardBorder),
          ),
          child: Icon(widget.icon, color: _hover ? AppColors.accent : AppColors.textSecondary, size: 19),
        ),
      ),
    );
  }
}

// ============================================================================
// UTILITIES
// ============================================================================
Future<void> _launch(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

// Minimal math bridge so the file has zero extra top-level imports beyond
// what's declared above (kept isolated for the ambient background helper).
class _MathBridge {
  static double sin(double x) => _sin(x);
  static double _sin(double x) {
    // wrap into [-pi, pi]
    const twoPi = 6.283185307179586;
    x = x % twoPi;
    if (x > 3.141592653589793) x -= twoPi;
    if (x < -3.141592653589793) x += twoPi;
    final x2 = x * x;
    // 7th-order Taylor approximation — plenty smooth for a background blob
    return x - (x * x2) / 6 + (x * x2 * x2) / 120 - (x * x2 * x2 * x2) / 5040;
  }
}