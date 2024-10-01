class BaseResponse<T> {
  final int? total;
  final int? totalHits;
  final T? hits;
  final int? perPage;
  final int? totalPage;
  final int? currentPage;

  BaseResponse({
    this.total,
    this.totalHits,
    this.hits,
    this.currentPage,
    this.perPage,
    this.totalPage,
  });

  factory BaseResponse.fromResponse(dynamic data) {
    return BaseResponse(
      total: data['total'],
      totalHits: data['totalHits'],
      hits: data['hits'],
      totalPage: data['total_page'],
      currentPage: data['current_page'],
      perPage: data['per_page'],
    );
  }

  BaseResponse copyWith({
    bool? status,
    String? message,
    T? hits,
    int? totalPage,
    int? currentPage,
    int? perPage,
  }) {
    return BaseResponse(
      total: total ?? this.total,
      totalHits: totalHits ?? this.totalHits,
      hits: hits,
      totalPage: totalPage ?? this.totalPage,
      currentPage: currentPage ?? this.currentPage,
      perPage: perPage ?? this.perPage,
    );
  }

  @override
  String toString() {
    return 'BaseResponse(total: $total, totalHits: $totalHits, hits: $hits, Total Page: $totalPage, Current Page: $currentPage, Per Page: $perPage,)';
  }
}
