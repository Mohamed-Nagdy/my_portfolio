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

// ── Founder ──────────────────────────────────────────────────────────
const founderName = 'Mohamed Abdelbasit';
const founderRole = 'Head of Software Development · Senior Software Engineer';
const aboutKicker = 'ABOUT THE STUDIO';
const aboutTitle = 'Engineering led by someone who ships.';
const aboutLead =
    'Nagdy Labs is led by Mohamed Abdelbasit — a software-engineering leader with 5+ years building and shipping high-performance products end to end.';
const aboutBody =
    'We pair deep Flutter & Dart craft with scalable Node.js / NestJS backends, real-time systems and clean cloud infrastructure. Across e-commerce, ERP, events and social platforms, we have delivered 15+ production applications — owning the full lifecycle from architecture and API design through deployment, monitoring and iteration. Today Mohamed heads the software department at Zytronic, driving technical strategy, architecture and delivery.';

const myAddress = 'Cairo, Egypt — working worldwide';
const cvURL =
    'https://drive.google.com/file/d/1cMULEa-in5872uzjoNnR3fpxxhmRJEG6/view?usp=share_link';
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

// ── Experience timeline (from CV) ────────────────────────────────────
class ExperienceItem {
  const ExperienceItem(this.role, this.org, this.period, this.blurb);
  final String role;
  final String org;
  final String period;
  final String blurb;
}

const experience = <ExperienceItem>[
  ExperienceItem(
    'Head of Software Development',
    'Zytronic',
    'Jan 2026 — Present',
    'Leading the software department: technical strategy, architecture, CI/CD and delivery across all products.',
  ),
  ExperienceItem(
    'Software Engineer — Mobile',
    'Super App',
    'Feb 2023 — Dec 2025',
    'Full-stack cross-platform apps in Flutter with Node.js services, performance tuning and RESTful API design.',
  ),
  ExperienceItem(
    'Full-Stack Mobile Engineer',
    'Freelance (Remote)',
    'Jun 2022 — Feb 2023',
    'End-to-end Flutter apps with Node.js backends, delivered for remote clients on Agile cycles.',
  ),
  ExperienceItem(
    'Mobile Developer',
    'Afaky Info Tech',
    'Jun 2021 — Jun 2022',
    'Architected a comprehensive ERP system delivered as a cross-platform mobile application.',
  ),
  ExperienceItem(
    'Mobile Developer',
    'Best Gator',
    'Jan 2021 — Jun 2021',
    'Built and maintained Flutter apps with Node.js back-end services, optimized for speed and scale.',
  ),
];

const education = 'B.Sc. Computer Engineering — Zagazig University, 2020';
