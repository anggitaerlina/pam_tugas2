class Blogs {
  final int id;
  final String title;
  final String url;
  final String image_url;
  final String news_site;
  final String summary;
  final String published_at;
  final String updated_at;
  final String featured;
  final String launches;
  final String events;

  const Blogs({
    required this.id,
    required this.title,
    required this.url,
    required this.image_url,
    required this.news_site,
    required this.summary,
    required this.published_at,
    required this.updated_at,
    required this.featured,
    required this.launches,
    required this.events,
  });

  factory Blogs.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'id': int id,
      'title': String title,
      'url': String url,
      'image_url': String image_url,
      'news_site': String news_site,
      'summary': String summary,
      'published_at': String published_at,
      'updated_at': String updated_at,
      'featured': String featured,
      'launches': String launches,
      'events': String events,
      } =>
          Blogs(
            id: id,
            title: title,
            url: url,
            image_url: image_url,
            news_site: news_site,
            summary: summary,
            published_at: published_at,
            updated_at: updated_at,
            featured: featured,
            launches: launches,
            events: events,
          ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}