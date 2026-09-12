import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

/// Learn screen — curated fitness & gym articles hub.
class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  int _selectedCategory = 0;

  static const List<_Category> _categories = [
    _Category(label: 'All', icon: Icons.grid_view_rounded),
    _Category(label: 'Training', icon: Icons.fitness_center),
    _Category(label: 'Nutrition', icon: Icons.restaurant_menu),
    _Category(label: 'Recovery', icon: Icons.self_improvement),
    _Category(label: 'Mindset', icon: Icons.psychology_outlined),
  ];

  static final List<_Article> _articles = [
    // ── Featured ──────────────────────────────────────────────────
    _Article(
      id: 'progressive-overload',
      title: 'The Science of Progressive Overload',
      subtitle:
          'Why gradually adding more stress to your muscles is the '
          'single most important driver of long-term strength gains.',
      category: 'Training',
      readMinutes: 5,
      emoji: '📈',
      accentColor: const Color(0xFF2563EB),
      isFeatured: true,
      body: '''
Progressive overload is the gradual increase of stress placed upon the body during exercise training. It is the cornerstone principle behind every successful strength programme.

**Why it works**
Your muscles are remarkably adaptive. After each workout they rebuild slightly stronger to handle the stress you imposed. If you never increase that stress, adaptation stops — a plateau. Progressive overload breaks plateaus by giving your muscles a new reason to grow.

**Practical methods**
- **Add weight** — the classic approach. Even a 1–2 kg jump per session compounds over months.
- **Add reps** — hit the top of your rep range, then increase load.
- **Add sets** — raise total weekly volume by one working set per muscle group.
- **Reduce rest** — same work in less time is greater relative intensity.
- **Improve form** — deeper range of motion recruits more muscle fibres.

**How to track it**
A training log is non-negotiable. Note every exercise, set, rep, and weight. Without data you are guessing.

Aim to beat last week's performance on at least one metric per session. Small wins compound into dramatic results over a year.
''',
    ),
    _Article(
      id: 'compound-vs-isolation',
      title: 'Compound vs Isolation Exercises',
      subtitle:
          'Squats, deadlifts, and presses build the base — but curls '
          'and lateral raises fill in the gaps. How to programme both.',
      category: 'Training',
      readMinutes: 4,
      emoji: '🏋️',
      accentColor: const Color(0xFF004AC6),
      isFeatured: false,
      body: '''
**Compound movements** recruit multiple joints and muscle groups simultaneously — think squats, deadlifts, bench press, rows, and overhead press. They produce the greatest hormonal response, burn the most calories, and build functional strength.

**Isolation movements** target a single muscle — curls, lateral raises, leg extensions, cable flyes. They let you bring up lagging muscle groups and add volume without taxing the CNS.

**The optimal split**
Structure each session around 2–3 compound lifts, then finish with 2–3 isolation exercises for the muscles you want to develop further.

Example Upper Day:
1. Bench Press — 4 x 5 (compound, strength focus)
2. Barbell Row — 4 x 6 (compound, back thickness)
3. Overhead Press — 3 x 8 (compound, shoulder strength)
4. Dumbbell Curl — 3 x 12 (isolation, bicep detail)
5. Lateral Raise — 3 x 15 (isolation, shoulder width)

This structure ensures you build a strong foundation while sculpting the details.
''',
    ),
    _Article(
      id: 'protein-timing',
      title: 'Protein Timing: Does It Really Matter?',
      subtitle:
          'The "anabolic window" myth debunked — and what actually '
          'matters for muscle protein synthesis throughout the day.',
      category: 'Nutrition',
      readMinutes: 4,
      emoji: '🥩',
      accentColor: const Color(0xFF22C55E),
      isFeatured: false,
      body: '''
For years, fitness culture obsessed over the "anabolic window" — the 30-minute post-workout period where protein supposedly needed to be consumed or gains would be lost. Modern research paints a more nuanced picture.

**Total daily protein matters most**
A 2018 meta-analysis in the Journal of the International Society of Sports Nutrition found that total daily protein intake is a far stronger predictor of muscle growth than timing. Aim for 1.6–2.2 g per kg of body weight per day.

**Spreading intake is smart**
Your body can only maximally stimulate muscle protein synthesis (MPS) with roughly 0.4 g/kg per meal. Spreading protein across 4–5 meals optimises MPS compared to consuming it all at once.

**Pre-sleep protein**
Consuming 40 g of casein before bed has been shown to elevate overnight MPS and improve muscle recovery, especially on hard training days.

**Practical takeaway**
- Hit your daily target (1.6–2.2 g/kg)
- Spread across 4–5 sittings
- Include a protein-rich snack before sleep on training days
- Stop stressing about the exact post-workout timing
''',
    ),
    _Article(
      id: 'sleep-and-muscle',
      title: 'Sleep: Your Secret Recovery Weapon',
      subtitle:
          'Growth hormone peaks at night, cortisol drops, and muscles '
          'rebuild. Skimping on sleep is silently killing your gains.',
      category: 'Recovery',
      readMinutes: 6,
      emoji: '😴',
      accentColor: const Color(0xFF6CF8BB),
      isFeatured: false,
      body: '''
Sleep is arguably the most underrated performance-enhancing tool available — and it is free.

**What happens during sleep**
- **Slow-wave sleep (SWS)**: The pituitary gland releases the majority of daily growth hormone during SWS. GH drives muscle repair and fat metabolism.
- **REM sleep**: Consolidates motor learning and movement patterns — critical for skill-based sports.
- **Cortisol reduction**: Chronic sleep deprivation elevates cortisol, which accelerates muscle catabolism.

**The numbers**
A Stanford study on basketball players who extended sleep to 10 hours per night saw a 9% improvement in free-throw accuracy, faster sprint times, and improved reaction time. Conversely, sleeping under 6 hours for just two weeks impairs strength output as significantly as missing two full workouts.

**Sleep hygiene for athletes**
1. Maintain a consistent wake time, even on weekends
2. Keep the bedroom cool (18–19 C is optimal)
3. Avoid caffeine after 14:00
4. Dim lights 1–2 hours before bed to support melatonin production
5. Limit alcohol — it suppresses REM sleep significantly

Target 7–9 hours. Consider it a non-negotiable training variable.
''',
    ),
    _Article(
      id: 'mind-muscle-connection',
      title: 'The Mind-Muscle Connection',
      subtitle:
          'Focusing on the muscle being trained can increase activation '
          'by up to 20%. Build this skill intentionally.',
      category: 'Mindset',
      readMinutes: 3,
      emoji: '🧠',
      accentColor: const Color(0xFFFFDBCD),
      isFeatured: false,
      body: '''
The mind-muscle connection (MMC) refers to the deliberate, focused contraction of a specific muscle during exercise — consciously feeling the target muscle work rather than simply moving the weight from A to B.

**The evidence**
A 2018 study in the European Journal of Sport Science found that consciously focusing on the target muscle (e.g., chest during bench press) increased EMG activation by 12–20% compared to focusing on the movement itself.

**How to develop it**
- **Slow the eccentric**: Lower the weight over 3–4 seconds. Speed hides poor recruitment.
- **Visualise before you lift**: Close your eyes, picture the muscle shortening and lengthening.
- **Use lighter weight initially**: The MMC is harder to maintain under heavy load. Build it at 50–60% of your max first.
- **Isometric holds**: At peak contraction, pause for 1–2 seconds and squeeze hard.
- **Touch the muscle**: Lightly placing a finger on the working muscle improves neural drive.

**Practical programming**
Apply MMC focus especially to isolation exercises — bicep curls, lateral raises, glute kickbacks. For heavy compound lifts, focus on technique and bracing cues instead.

This skill compounds. After months of deliberate practice, the connection becomes automatic.
''',
    ),
    _Article(
      id: 'warm-up-science',
      title: 'Warm-Up Science: More Than Just Jogging',
      subtitle:
          'A proper warm-up increases force production, reduces injury '
          'risk, and primes the nervous system. The full framework.',
      category: 'Training',
      readMinutes: 4,
      emoji: '🔥',
      accentColor: const Color(0xFFFF6B35),
      isFeatured: false,
      body: '''
Skipping your warm-up is one of the most common mistakes in the gym. A structured warm-up does far more than raise your heart rate.

**The three phases**

**Phase 1 — General warm-up (3–5 min)**
Elevate core temperature and blood flow. Light cardio — rowing, cycling, jumping jacks. This increases enzyme activity and improves oxygen delivery to muscles.

**Phase 2 — Mobility and activation (5–10 min)**
Address your personal restriction patterns. Common needs:
- Hip flexor and thoracic spine mobility for squat/deadlift patterns
- Shoulder external rotation for pressing
- Glute activation (banded clamshells, hip thrusts) for lower body days

**Phase 3 — Movement-specific warm-up sets**
Perform progressively heavier sets of your first compound lift at zero fatigue. For a 100 kg squat:
1. 40 kg x 8 (50%)
2. 60 kg x 5 (60%)
3. 80 kg x 3 (80%)
4. 90 kg x 1 (90%)
5. 100 kg — working sets

This ramps the nervous system so your first working set is executed at full capacity.

**Skip static stretching pre-lift**
Research consistently shows static stretching before heavy lifting reduces force output by 5–8%. Save it for the cool-down.
''',
    ),
    _Article(
      id: 'creatine-guide',
      title: 'Creatine: The Most Evidence-Backed Supplement',
      subtitle:
          'Over 700 studies, 5–15% strength gains, and an excellent '
          'safety record. Everything you need to know.',
      category: 'Nutrition',
      readMinutes: 5,
      emoji: '💊',
      accentColor: const Color(0xFF7C3AED),
      isFeatured: false,
      body: '''
Creatine monohydrate is the most researched sports supplement in existence, with over 700 peer-reviewed studies supporting its efficacy and safety.

**What it does**
Creatine increases phosphocreatine stores in muscle, which regenerates ATP more rapidly during high-intensity efforts (under 10 seconds). This translates to:
- More reps at a given load
- Faster recovery between sets
- Greater power output in sprints and explosive movements

Long-term, this means more total training volume — which drives more muscle growth.

**The research in numbers**
- Average strength gain: 5–15% over control
- Average lean mass gain over 4–12 weeks: 1–2 kg (partly water in muscle cells)
- No evidence of kidney damage in healthy individuals

**How to take it**
- **Dose**: 3–5 g daily. Timing is irrelevant.
- **Loading phase**: Optional. 20 g/day for 5–7 days saturates stores faster, but simple daily dosing achieves the same saturation within 4 weeks.
- **Form**: Creatine monohydrate is the gold standard. Skip expensive "Kre-Alkalyn" or "HCl" variants — no evidence they outperform monohydrate.
- **With food or water**: Mix in water, juice, or a shake.

**Safety**
Decades of research show creatine is safe for healthy adults. The only notable side effect is mild water retention in the first week or two.
''',
    ),
    _Article(
      id: 'deload-week',
      title: 'Why Every Hard Trainer Needs a Deload Week',
      subtitle:
          'Accumulated fatigue masks fitness. A strategic deload lets '
          'your nervous system recover so you can hit new PRs.',
      category: 'Recovery',
      readMinutes: 3,
      emoji: '🔄',
      accentColor: const Color(0xFF0EA5E9),
      isFeatured: false,
      body: '''
A deload is a planned period — typically one week — of reduced training intensity or volume, taken deliberately to allow accumulated fatigue to dissipate.

**The fitness-fatigue model**
After a workout, both fitness and fatigue increase. Fatigue dissipates faster than fitness. A deload accelerates fatigue removal, uncovering the fitness you have built beneath it. This is why lifters often feel significantly stronger the week after a deload.

**Signs you need one**
- Strength is stagnant or declining despite consistent effort
- Persistent joint soreness (not muscle soreness)
- Mood disturbance, poor sleep, or low motivation
- Elevated resting heart rate over several days

**How to structure a deload**
Two common approaches:
- **Volume deload**: Keep the same weights but reduce sets by 50%.
- **Intensity deload**: Keep the same sets but reduce load to 50–60% of normal.

Most experienced trainers schedule a deload every 4–8 weeks of progressive training.

**What to do during a deload**
Keep moving. Light cardio, mobility work, and technical drills are fine and beneficial. Avoid full rest — total inactivity slows the recovery of connective tissue.

Come back the following week ready to set new personal records.
''',
    ),
  ];

  List<_Article> get _filteredArticles {
    if (_selectedCategory == 0) return _articles;
    final label = _categories[_selectedCategory].label;
    return _articles.where((a) => a.category == label).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.transparent,
        systemNavigationBarColor: AppColors.chromeBackground,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.chromeBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _LearnTopBar(),
            _CategoryFilter(
              categories: _categories,
              selectedIndex: _selectedCategory,
              onSelected: (i) => setState(() => _selectedCategory = i),
            ),
            Expanded(child: _ArticleList(articles: _filteredArticles)),
          ],
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// Top app bar
// ──────────────────────────────────────────────────────────────────────────────

class _LearnTopBar extends StatelessWidget {
  const _LearnTopBar();

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;
    return Container(
      color: AppColors.chromeBackground,
      padding: EdgeInsetsDirectional.fromSTEB(20, top + 16, 20, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Learn', style: AppTextStyles.homeGreeting()),
                const SizedBox(height: 2),
                Text(
                  'Fitness knowledge to level up your training.',
                  style: AppTextStyles.homeGreetingSubtitle(),
                ),
              ],
            ),
          ),
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.iconSurface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.border),
            ),
            child: const Icon(
              Icons.bookmark_outline_rounded,
              size: 20,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// Category filter chips
// ──────────────────────────────────────────────────────────────────────────────

class _CategoryFilter extends StatelessWidget {
  const _CategoryFilter({
    required this.categories,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<_Category> categories;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, idx) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final cat = categories[i];
          final isSelected = i == selectedIndex;
          return GestureDetector(
            onTap: () => onSelected(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              padding: const EdgeInsetsDirectional.fromSTEB(14, 0, 14, 0),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.neutralChipSurface,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    cat.icon,
                    size: 14,
                    color: isSelected ? AppColors.surface : AppColors.textMuted,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    cat.label,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      height: 1,
                      color: isSelected
                          ? AppColors.surface
                          : AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// Article list
// ──────────────────────────────────────────────────────────────────────────────

class _ArticleList extends StatelessWidget {
  const _ArticleList({required this.articles});

  final List<_Article> articles;

  @override
  Widget build(BuildContext context) {
    if (articles.isEmpty) {
      return Center(
        child: Text(
          'No articles in this category yet.',
          style: AppTextStyles.homeGreetingSubtitle(),
        ),
      );
    }

    final featured = articles.where((a) => a.isFeatured).toList();
    final rest = articles.where((a) => !a.isFeatured).toList();

    return ListView(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 24),
      children: [
        if (featured.isNotEmpty) ...[
          _FeaturedArticleCard(article: featured.first),
          const SizedBox(height: 24),
          Text('All Articles', style: AppTextStyles.homeSectionTitle()),
          const SizedBox(height: 12),
        ],
        ...rest.map(
          (article) => Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 12),
            child: _ArticleListTile(article: article),
          ),
        ),
        // Render any extra featured articles as tiles.
        ...featured
            .skip(1)
            .map(
              (article) => Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 12),
                child: _ArticleListTile(article: article),
              ),
            ),
      ],
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// Featured article card (large hero format)
// ──────────────────────────────────────────────────────────────────────────────

class _FeaturedArticleCard extends StatelessWidget {
  const _FeaturedArticleCard({required this.article});

  final _Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openArticle(context, article),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: AppColors.profileCardShadow,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Accent glow
              PositionedDirectional(
                top: -48,
                end: -48,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: article.accentColor.withValues(alpha: 0.12),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Eyebrow row
                    Row(
                      children: [
                        _CategoryBadge(
                          label: article.category,
                          color: article.accentColor,
                        ),
                        const Spacer(),
                        _ReadTimeBadge(minutes: article.readMinutes),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Emoji
                    Text(article.emoji, style: const TextStyle(fontSize: 40)),
                    const SizedBox(height: 12),
                    // Title
                    Text(
                      article.title,
                      style: AppTextStyles.homeHeroTitle().copyWith(
                        fontSize: 26,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Subtitle
                    Text(
                      article.subtitle,
                      style: AppTextStyles.homeHeroMeta(),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 20),
                    // CTA
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.surface,
                        minimumSize: const Size.fromHeight(48),
                        shape: const StadiumBorder(),
                        elevation: 0,
                      ),
                      onPressed: () => _openArticle(context, article),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Read Article',
                            style: AppTextStyles.homeHeroButton().copyWith(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            size: 16,
                            color: AppColors.surface,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// Article list tile (compact row format)
// ──────────────────────────────────────────────────────────────────────────────

class _ArticleListTile extends StatelessWidget {
  const _ArticleListTile({required this.article});

  final _Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openArticle(context, article),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Emoji icon chip
              Container(
                width: 52,
                height: 52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: article.accentColor.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  article.emoji,
                  style: const TextStyle(fontSize: 26),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _CategoryBadge(
                          label: article.category,
                          color: article.accentColor,
                          small: true,
                        ),
                        const Spacer(),
                        _ReadTimeBadge(
                          minutes: article.readMinutes,
                          small: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      article.title,
                      style: AppTextStyles.homeExerciseTitle(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      article.subtitle,
                      style: AppTextStyles.homeExerciseSubtitle(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.chevron_right_rounded,
                size: 20,
                color: AppColors.textMuted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// Shared badge widgets
// ──────────────────────────────────────────────────────────────────────────────

class _CategoryBadge extends StatelessWidget {
  const _CategoryBadge({
    required this.label,
    required this.color,
    this.small = false,
  });

  final String label;
  final Color color;
  final bool small;

  @override
  Widget build(BuildContext context) {
    // Warm peach accent needs a darker foreground for legibility.
    final textColor = (color.toARGB32() == const Color(0xFFFFDBCD).toARGB32())
        ? AppColors.homeBurnAccent
        : color;
    return Container(
      padding: EdgeInsetsDirectional.fromSTEB(
        small ? 8 : 10,
        small ? 3 : 4,
        small ? 8 : 10,
        small ? 3 : 4,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: small ? 10 : 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.4,
          color: textColor,
        ),
      ),
    );
  }
}

class _ReadTimeBadge extends StatelessWidget {
  const _ReadTimeBadge({required this.minutes, this.small = false});

  final int minutes;
  final bool small;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.schedule_outlined,
          size: small ? 12 : 13,
          color: AppColors.textMuted,
        ),
        const SizedBox(width: 4),
        Text(
          '$minutes min',
          style: GoogleFonts.inter(
            fontSize: small ? 11 : 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// Article detail page
// ──────────────────────────────────────────────────────────────────────────────

void _openArticle(BuildContext context, _Article article) {
  Navigator.of(context).push<void>(
    MaterialPageRoute(builder: (_) => _ArticleDetailScreen(article: article)),
  );
}

class _ArticleDetailScreen extends StatelessWidget {
  const _ArticleDetailScreen({required this.article});

  final _Article article;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.transparent,
        systemNavigationBarColor: AppColors.chromeBackground,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.chromeBackground,
        body: CustomScrollView(
          slivers: [
            _ArticleAppBar(article: article),
            SliverPadding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 48),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _ArticleBody(body: article.body),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ArticleAppBar extends StatelessWidget {
  const _ArticleAppBar({required this.article});

  final _Article article;

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;
    return SliverToBoxAdapter(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.surface,
          border: Border(bottom: BorderSide(color: AppColors.border)),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, top + 12, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  width: 36,
                  height: 36,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.iconSurface,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    size: 20,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Emoji
              Text(article.emoji, style: const TextStyle(fontSize: 48)),
              const SizedBox(height: 16),
              // Category + read time
              Row(
                children: [
                  _CategoryBadge(
                    label: article.category,
                    color: article.accentColor,
                  ),
                  const SizedBox(width: 10),
                  _ReadTimeBadge(minutes: article.readMinutes),
                ],
              ),
              const SizedBox(height: 14),
              // Title
              Text(
                article.title,
                style: AppTextStyles.homeHeroTitle().copyWith(
                  fontSize: 28,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              // Subtitle
              Text(article.subtitle, style: AppTextStyles.homeHeroMeta()),
            ],
          ),
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// Article body renderer (simple markdown-like parser)
// ──────────────────────────────────────────────────────────────────────────────

class _ArticleBody extends StatelessWidget {
  const _ArticleBody({required this.body});

  final String body;

  @override
  Widget build(BuildContext context) {
    final paragraphs = body.trim().split('\n');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: paragraphs.map((line) {
        final trimmed = line.trim();
        if (trimmed.isEmpty) return const SizedBox(height: 8);

        // Bold standalone header e.g. **Header**
        if (trimmed.startsWith('**') && trimmed.endsWith('**')) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(top: 16, bottom: 4),
            child: Text(
              trimmed.replaceAll('**', ''),
              style: GoogleFonts.plusJakartaSans(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
                height: 1.4,
              ),
            ),
          );
        }

        // Bullet point
        if (trimmed.startsWith('- ')) {
          return _BulletLine(text: trimmed.substring(2));
        }

        // Numbered list e.g. "1. ..."
        final numberedMatch = RegExp(r'^\d+\.\s').firstMatch(trimmed);
        if (numberedMatch != null) {
          return _NumberedLine(
            number: trimmed.substring(0, numberedMatch.end).trim(),
            text: trimmed.substring(numberedMatch.end),
          );
        }

        // Normal paragraph with optional inline **bold**
        return Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 8),
          child: _RichParagraph(text: trimmed),
        );
      }).toList(),
    );
  }
}

class _BulletLine extends StatelessWidget {
  const _BulletLine({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 8, end: 10),
            child: Container(
              width: 5,
              height: 5,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Expanded(child: _RichParagraph(text: text)),
        ],
      ),
    );
  }
}

class _NumberedLine extends StatelessWidget {
  const _NumberedLine({required this.number, required this.text});

  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 28,
            child: Text(
              number,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
                height: 1.6,
              ),
            ),
          ),
          Expanded(child: _RichParagraph(text: text)),
        ],
      ),
    );
  }
}

/// Renders a paragraph that supports **bold** inline spans.
class _RichParagraph extends StatelessWidget {
  const _RichParagraph({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final base = GoogleFonts.inter(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      height: 1.65,
      color: AppColors.onboardingTextSecondary,
    );

    // Split by **...**
    final parts = text.split(RegExp(r'\*\*'));
    if (parts.length <= 1) {
      return Text(text, style: base);
    }

    final spans = <TextSpan>[];
    for (var i = 0; i < parts.length; i++) {
      if (i.isOdd) {
        spans.add(
          TextSpan(
            text: parts[i],
            style: base.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        );
      } else {
        spans.add(TextSpan(text: parts[i], style: base));
      }
    }
    return Text.rich(TextSpan(children: spans));
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// Data models
// ──────────────────────────────────────────────────────────────────────────────

class _Category {
  const _Category({required this.label, required this.icon});

  final String label;
  final IconData icon;
}

class _Article {
  const _Article({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.readMinutes,
    required this.emoji,
    required this.accentColor,
    required this.isFeatured,
    required this.body,
  });

  final String id;
  final String title;
  final String subtitle;
  final String category;
  final int readMinutes;
  final String emoji;
  final Color accentColor;
  final bool isFeatured;
  final String body;
}
