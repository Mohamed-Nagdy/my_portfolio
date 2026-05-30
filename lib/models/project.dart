/// High-level grouping used for filtering and the category badge.
enum ProjectKind {
  mobile,
  game,
  web,
  platform,
  backend;

  String get label => switch (this) {
        ProjectKind.mobile => 'Mobile App',
        ProjectKind.game => 'Game',
        ProjectKind.web => 'Web / Dashboard',
        ProjectKind.platform => 'Platform',
        ProjectKind.backend => 'Backend',
      };
}

class Project {
  const Project({
    required this.slug,
    required this.title,
    required this.kind,
    required this.description,
    required this.image,
    this.tagline,
    this.category,
    this.longDescription,
    this.features = const [],
    this.platforms = const [],
    this.featured = false,
    this.year,
    this.role,
    this.googlePlay,
    this.appStore,
    this.web,
    this.screenshots = const [],
    this.skills = const [],
    this.backendStack = const [],
  });

  /// Tolerant JSON constructor (retained for any legacy/Firestore data).
  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      slug: (json['slug'] ?? json['id'] ?? '') as String,
      title: (json['title'] ?? '') as String,
      kind: ProjectKind.values.firstWhere(
        (k) => k.name == json['kind'],
        orElse: () => ProjectKind.mobile,
      ),
      description: (json['description'] ?? '') as String,
      image: (json['image'] ?? '') as String,
      tagline: json['tagline'] as String?,
      category: json['category'] as String?,
      longDescription: json['long_description'] as String?,
      features: (json['features'] as List?)?.cast<String>() ?? const [],
      platforms: (json['platforms'] as List?)?.cast<String>() ?? const [],
      featured: (json['featured'] ?? false) as bool,
      year: json['year'] as String?,
      role: json['role'] as String?,
      googlePlay: json['google_play'] as String?,
      appStore: json['app_store'] as String?,
      web: json['web'] as String?,
      screenshots: (json['screenshots'] as List?)?.cast<String>() ?? const [],
      skills: (json['skills'] as List?)?.cast<String>() ?? const [],
      backendStack:
          (json['backend_stack'] as List?)?.cast<String>() ?? const [],
    );
  }

  final String slug;
  final String title;
  final ProjectKind kind;
  final String description;
  final String image;
  final String? tagline;
  final String? category;
  final String? longDescription;
  final List<String> features;
  final List<String> platforms;
  final bool featured;
  final String? year;
  final String? role;
  final String? googlePlay;
  final String? appStore;
  final String? web;
  final List<String> screenshots;
  final List<String> skills;
  final List<String> backendStack;

  bool get hasLinks => googlePlay != null || appStore != null || web != null;

  String get categoryLabel => category ?? kind.label;
}

/// True when an image path is a bundled asset rather than a remote URL.
bool isAssetImage(String path) => path.startsWith('assets/');
