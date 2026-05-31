enum Constants {
  mainBox,
  themeKey,
  savedProjectsCountKey,
  projects,
}

// ── Studio brand ─────────────────────────────────────────────────────
const studioName = 'Nagdy Labs';
const studioWordmarkA = 'Nagdy';
const studioWordmarkB = 'Labs';
const studioKicker = 'SOFTWARE STUDIO';
const studioHeadline = 'We build production-grade apps & backends.';
const studioSubhead =
    'Nagdy Labs is a founder-led software studio shipping high-performance mobile, web and real-time products — from polished Flutter interfaces to scalable Node.js & NestJS systems.';

// ── About the studio ─────────────────────────────────────────────────
const aboutKicker = 'ABOUT THE STUDIO';
const aboutTitle = 'We engineer products, end to end.';
const aboutLead =
    'Nagdy Labs is a software studio with 5+ years building and shipping high-performance products — from first commit to production.';
const aboutBody =
    'We pair deep Flutter & Dart craft with scalable Node.js / NestJS backends, real-time systems and clean cloud infrastructure. Across mobile, web, games, e-commerce and social platforms, we have shipped 29 production applications — owning the full lifecycle: architecture, API design, deployment, monitoring and iteration.';

const myAddress = 'Cairo, Egypt — working worldwide';
const myEmail = 'mohamednagdy257@gmail.com';
const myPhone = '+201558400064';
const githubURL = 'https://github.com/Mohamed-Nagdy';

// ── Headline stats ───────────────────────────────────────────────────
const studioStats = <(String, String)>[
  ('5+', 'Years shipping'),
  ('29', 'Projects delivered'),
  ('1M+', 'Downloads'),
  ('9', 'Languages localized'),
];

// ── Studio track record (product milestones) ─────────────────────────
class Milestone {
  const Milestone(this.year, this.title, this.blurb);
  final String year;
  final String title;
  final String blurb;
}

const milestones = <Milestone>[
  Milestone(
    '2019',
    'First products shipped',
    'Our earliest Quran and utility apps reach Google Play — where the studio cut its teeth on polish, performance and reliability.',
  ),
  Milestone(
    '2021',
    'Calendar & events suite',
    'A family of Saudi calendar, prayer-time and events apps — one of which crosses 1M+ downloads across Android and iOS.',
  ),
  Milestone(
    '2022',
    'Full-stack platforms',
    'End-to-end products on Node.js backends — food-ordering with driver apps and admin dashboards, plus social applications.',
  ),
  Milestone(
    '2024',
    'Games & finance',
    'Published games (Crystal Crush, Brain Land) alongside finance and productivity apps with cloud sync and analytics.',
  ),
  Milestone(
    '2026',
    'ViBE ZO — our flagship',
    'A social livestreaming & short-video platform on a NestJS + PostgreSQL backend engineered for high concurrency.',
  ),
];
