library models;

// export 'user/user.dart';

class ResponseData<T> {
  ResponseData({
    required this.data,
    this.meta,
  });

  final T data;
  final Meta? meta;
  ResponseData<T> copyWith({
    T? data,
    Meta? meta,
  }) =>
      ResponseData(
        data: data ?? this.data,
        meta: meta ?? this.meta,
      );
}

class Meta {
  Meta({
    this.count = 0,
    this.items = 0,
    this.page = 0,
    this.outset = 0,
    this.last = 0,
    this.pages = 0,
    this.offset = 0,
    this.from = 0,
    this.to = 0,
    this.prev = 0,
    this.next = 0,
    this.limit = 0,
  });

  final int count;
  final int items;
  final int page;
  final int outset;
  final int last;
  final int pages;
  final int offset;
  final int from;
  final int to;
  final int prev;
  final int next;
  final int limit;

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        count: json["count"] ?? 0,
        items: json["items"] ?? 0,
        page: json["page"] ?? 0,
        outset: json["outset"] ?? 0,
        last: json["last"] ?? 0,
        pages: json["pages"] ?? 0,
        offset: json["offset"] ?? 0,
        from: json["from"] ?? 0,
        to: json["to"] ?? 0,
        prev: json["prev"] ?? 0,
        next: json["next"] ?? 0,
        limit: json["limit"] ?? 0,
      );
}

typedef Json = Map<String, dynamic>;
