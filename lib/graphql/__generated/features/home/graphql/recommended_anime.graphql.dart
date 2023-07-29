// GENERATED FILE
// DO NOT MODIFY
// ignore_for_file: type=lint
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$GetRecommendedAnime {
  factory Variables$Query$GetRecommendedAnime({List<String?>? categories}) =>
      Variables$Query$GetRecommendedAnime._({
        if (categories != null) r'categories': categories,
      });

  Variables$Query$GetRecommendedAnime._(this._$data);

  factory Variables$Query$GetRecommendedAnime.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('categories')) {
      final l$categories = data['categories'];
      result$data['categories'] =
          (l$categories as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    return Variables$Query$GetRecommendedAnime._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String?>? get categories => (_$data['categories'] as List<String?>?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('categories')) {
      final l$categories = categories;
      result$data['categories'] = l$categories?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetRecommendedAnime<
          Variables$Query$GetRecommendedAnime>
      get copyWith => CopyWith$Variables$Query$GetRecommendedAnime(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetRecommendedAnime) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$categories = categories;
    final lOther$categories = other.categories;
    if (_$data.containsKey('categories') !=
        other._$data.containsKey('categories')) {
      return false;
    }
    if (l$categories != null && lOther$categories != null) {
      if (l$categories.length != lOther$categories.length) {
        return false;
      }
      for (int i = 0; i < l$categories.length; i++) {
        final l$categories$entry = l$categories[i];
        final lOther$categories$entry = lOther$categories[i];
        if (l$categories$entry != lOther$categories$entry) {
          return false;
        }
      }
    } else if (l$categories != lOther$categories) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$categories = categories;
    return Object.hashAll([
      _$data.containsKey('categories')
          ? l$categories == null
              ? null
              : Object.hashAll(l$categories.map((v) => v))
          : const {}
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetRecommendedAnime<TRes> {
  factory CopyWith$Variables$Query$GetRecommendedAnime(
    Variables$Query$GetRecommendedAnime instance,
    TRes Function(Variables$Query$GetRecommendedAnime) then,
  ) = _CopyWithImpl$Variables$Query$GetRecommendedAnime;

  factory CopyWith$Variables$Query$GetRecommendedAnime.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetRecommendedAnime;

  TRes call({List<String?>? categories});
}

class _CopyWithImpl$Variables$Query$GetRecommendedAnime<TRes>
    implements CopyWith$Variables$Query$GetRecommendedAnime<TRes> {
  _CopyWithImpl$Variables$Query$GetRecommendedAnime(
    this._instance,
    this._then,
  );

  final Variables$Query$GetRecommendedAnime _instance;

  final TRes Function(Variables$Query$GetRecommendedAnime) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? categories = _undefined}) =>
      _then(Variables$Query$GetRecommendedAnime._({
        ..._instance._$data,
        if (categories != _undefined)
          'categories': (categories as List<String?>?),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetRecommendedAnime<TRes>
    implements CopyWith$Variables$Query$GetRecommendedAnime<TRes> {
  _CopyWithStubImpl$Variables$Query$GetRecommendedAnime(this._res);

  TRes _res;

  call({List<String?>? categories}) => _res;
}

class Query$GetRecommendedAnime {
  Query$GetRecommendedAnime({
    this.Page,
    this.$__typename = 'Query',
  });

  factory Query$GetRecommendedAnime.fromJson(Map<String, dynamic> json) {
    final l$Page = json['Page'];
    final l$$__typename = json['__typename'];
    return Query$GetRecommendedAnime(
      Page: l$Page == null
          ? null
          : Query$GetRecommendedAnime$Page.fromJson(
              (l$Page as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetRecommendedAnime$Page? Page;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$Page = Page;
    _resultData['Page'] = l$Page?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$Page = Page;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$Page,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetRecommendedAnime) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$Page = Page;
    final lOther$Page = other.Page;
    if (l$Page != lOther$Page) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetRecommendedAnime
    on Query$GetRecommendedAnime {
  CopyWith$Query$GetRecommendedAnime<Query$GetRecommendedAnime> get copyWith =>
      CopyWith$Query$GetRecommendedAnime(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetRecommendedAnime<TRes> {
  factory CopyWith$Query$GetRecommendedAnime(
    Query$GetRecommendedAnime instance,
    TRes Function(Query$GetRecommendedAnime) then,
  ) = _CopyWithImpl$Query$GetRecommendedAnime;

  factory CopyWith$Query$GetRecommendedAnime.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRecommendedAnime;

  TRes call({
    Query$GetRecommendedAnime$Page? Page,
    String? $__typename,
  });
  CopyWith$Query$GetRecommendedAnime$Page<TRes> get Page;
}

class _CopyWithImpl$Query$GetRecommendedAnime<TRes>
    implements CopyWith$Query$GetRecommendedAnime<TRes> {
  _CopyWithImpl$Query$GetRecommendedAnime(
    this._instance,
    this._then,
  );

  final Query$GetRecommendedAnime _instance;

  final TRes Function(Query$GetRecommendedAnime) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? Page = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetRecommendedAnime(
        Page: Page == _undefined
            ? _instance.Page
            : (Page as Query$GetRecommendedAnime$Page?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetRecommendedAnime$Page<TRes> get Page {
    final local$Page = _instance.Page;
    return local$Page == null
        ? CopyWith$Query$GetRecommendedAnime$Page.stub(_then(_instance))
        : CopyWith$Query$GetRecommendedAnime$Page(
            local$Page, (e) => call(Page: e));
  }
}

class _CopyWithStubImpl$Query$GetRecommendedAnime<TRes>
    implements CopyWith$Query$GetRecommendedAnime<TRes> {
  _CopyWithStubImpl$Query$GetRecommendedAnime(this._res);

  TRes _res;

  call({
    Query$GetRecommendedAnime$Page? Page,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetRecommendedAnime$Page<TRes> get Page =>
      CopyWith$Query$GetRecommendedAnime$Page.stub(_res);
}

const documentNodeQueryGetRecommendedAnime = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetRecommendedAnime'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'categories')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'Page'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'perPage'),
            value: IntValueNode(value: '10'),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'genre_in'),
                value: VariableNode(name: NameNode(value: 'categories')),
              ),
              ArgumentNode(
                name: NameNode(value: 'sort'),
                value: ListValueNode(values: [
                  EnumValueNode(name: NameNode(value: 'POPULARITY_DESC'))
                ]),
              ),
              ArgumentNode(
                name: NameNode(value: 'type'),
                value: EnumValueNode(name: NameNode(value: 'ANIME')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'title'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'english'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'romaji'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'native'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'coverImage'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'large'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'meanScore'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$GetRecommendedAnime _parserFn$Query$GetRecommendedAnime(
        Map<String, dynamic> data) =>
    Query$GetRecommendedAnime.fromJson(data);
typedef OnQueryComplete$Query$GetRecommendedAnime = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetRecommendedAnime?,
);

class Options$Query$GetRecommendedAnime
    extends graphql.QueryOptions<Query$GetRecommendedAnime> {
  Options$Query$GetRecommendedAnime({
    String? operationName,
    Variables$Query$GetRecommendedAnime? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetRecommendedAnime? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetRecommendedAnime? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null
                        ? null
                        : _parserFn$Query$GetRecommendedAnime(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetRecommendedAnime,
          parserFn: _parserFn$Query$GetRecommendedAnime,
        );

  final OnQueryComplete$Query$GetRecommendedAnime? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetRecommendedAnime
    extends graphql.WatchQueryOptions<Query$GetRecommendedAnime> {
  WatchOptions$Query$GetRecommendedAnime({
    String? operationName,
    Variables$Query$GetRecommendedAnime? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetRecommendedAnime? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetRecommendedAnime,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetRecommendedAnime,
        );
}

class FetchMoreOptions$Query$GetRecommendedAnime
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetRecommendedAnime({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$GetRecommendedAnime? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryGetRecommendedAnime,
        );
}

extension ClientExtension$Query$GetRecommendedAnime on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetRecommendedAnime>>
      query$GetRecommendedAnime(
              [Options$Query$GetRecommendedAnime? options]) async =>
          await this.query(options ?? Options$Query$GetRecommendedAnime());
  graphql.ObservableQuery<Query$GetRecommendedAnime>
      watchQuery$GetRecommendedAnime(
              [WatchOptions$Query$GetRecommendedAnime? options]) =>
          this.watchQuery(options ?? WatchOptions$Query$GetRecommendedAnime());
  void writeQuery$GetRecommendedAnime({
    required Query$GetRecommendedAnime data,
    Variables$Query$GetRecommendedAnime? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetRecommendedAnime),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetRecommendedAnime? readQuery$GetRecommendedAnime({
    Variables$Query$GetRecommendedAnime? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetRecommendedAnime),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetRecommendedAnime.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetRecommendedAnime>
    useQuery$GetRecommendedAnime(
            [Options$Query$GetRecommendedAnime? options]) =>
        graphql_flutter
            .useQuery(options ?? Options$Query$GetRecommendedAnime());
graphql.ObservableQuery<Query$GetRecommendedAnime>
    useWatchQuery$GetRecommendedAnime(
            [WatchOptions$Query$GetRecommendedAnime? options]) =>
        graphql_flutter
            .useWatchQuery(options ?? WatchOptions$Query$GetRecommendedAnime());

class Query$GetRecommendedAnime$Widget
    extends graphql_flutter.Query<Query$GetRecommendedAnime> {
  Query$GetRecommendedAnime$Widget({
    widgets.Key? key,
    Options$Query$GetRecommendedAnime? options,
    required graphql_flutter.QueryBuilder<Query$GetRecommendedAnime> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetRecommendedAnime(),
          builder: builder,
        );
}

class Query$GetRecommendedAnime$Page {
  Query$GetRecommendedAnime$Page({
    this.media,
    this.$__typename = 'Page',
  });

  factory Query$GetRecommendedAnime$Page.fromJson(Map<String, dynamic> json) {
    final l$media = json['media'];
    final l$$__typename = json['__typename'];
    return Query$GetRecommendedAnime$Page(
      media: (l$media as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$GetRecommendedAnime$Page$media.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetRecommendedAnime$Page$media?>? media;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$media = media;
    _resultData['media'] = l$media?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$media = media;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$media == null ? null : Object.hashAll(l$media.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetRecommendedAnime$Page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$media = media;
    final lOther$media = other.media;
    if (l$media != null && lOther$media != null) {
      if (l$media.length != lOther$media.length) {
        return false;
      }
      for (int i = 0; i < l$media.length; i++) {
        final l$media$entry = l$media[i];
        final lOther$media$entry = lOther$media[i];
        if (l$media$entry != lOther$media$entry) {
          return false;
        }
      }
    } else if (l$media != lOther$media) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetRecommendedAnime$Page
    on Query$GetRecommendedAnime$Page {
  CopyWith$Query$GetRecommendedAnime$Page<Query$GetRecommendedAnime$Page>
      get copyWith => CopyWith$Query$GetRecommendedAnime$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetRecommendedAnime$Page<TRes> {
  factory CopyWith$Query$GetRecommendedAnime$Page(
    Query$GetRecommendedAnime$Page instance,
    TRes Function(Query$GetRecommendedAnime$Page) then,
  ) = _CopyWithImpl$Query$GetRecommendedAnime$Page;

  factory CopyWith$Query$GetRecommendedAnime$Page.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRecommendedAnime$Page;

  TRes call({
    List<Query$GetRecommendedAnime$Page$media?>? media,
    String? $__typename,
  });
  TRes media(
      Iterable<Query$GetRecommendedAnime$Page$media?>? Function(
              Iterable<
                  CopyWith$Query$GetRecommendedAnime$Page$media<
                      Query$GetRecommendedAnime$Page$media>?>?)
          _fn);
}

class _CopyWithImpl$Query$GetRecommendedAnime$Page<TRes>
    implements CopyWith$Query$GetRecommendedAnime$Page<TRes> {
  _CopyWithImpl$Query$GetRecommendedAnime$Page(
    this._instance,
    this._then,
  );

  final Query$GetRecommendedAnime$Page _instance;

  final TRes Function(Query$GetRecommendedAnime$Page) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? media = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetRecommendedAnime$Page(
        media: media == _undefined
            ? _instance.media
            : (media as List<Query$GetRecommendedAnime$Page$media?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes media(
          Iterable<Query$GetRecommendedAnime$Page$media?>? Function(
                  Iterable<
                      CopyWith$Query$GetRecommendedAnime$Page$media<
                          Query$GetRecommendedAnime$Page$media>?>?)
              _fn) =>
      call(
          media: _fn(_instance.media?.map((e) => e == null
              ? null
              : CopyWith$Query$GetRecommendedAnime$Page$media(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$GetRecommendedAnime$Page<TRes>
    implements CopyWith$Query$GetRecommendedAnime$Page<TRes> {
  _CopyWithStubImpl$Query$GetRecommendedAnime$Page(this._res);

  TRes _res;

  call({
    List<Query$GetRecommendedAnime$Page$media?>? media,
    String? $__typename,
  }) =>
      _res;
  media(_fn) => _res;
}

class Query$GetRecommendedAnime$Page$media {
  Query$GetRecommendedAnime$Page$media({
    required this.id,
    this.title,
    this.coverImage,
    this.meanScore,
    this.$__typename = 'Media',
  });

  factory Query$GetRecommendedAnime$Page$media.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$coverImage = json['coverImage'];
    final l$meanScore = json['meanScore'];
    final l$$__typename = json['__typename'];
    return Query$GetRecommendedAnime$Page$media(
      id: (l$id as int),
      title: l$title == null
          ? null
          : Query$GetRecommendedAnime$Page$media$title.fromJson(
              (l$title as Map<String, dynamic>)),
      coverImage: l$coverImage == null
          ? null
          : Query$GetRecommendedAnime$Page$media$coverImage.fromJson(
              (l$coverImage as Map<String, dynamic>)),
      meanScore: (l$meanScore as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final Query$GetRecommendedAnime$Page$media$title? title;

  final Query$GetRecommendedAnime$Page$media$coverImage? coverImage;

  final int? meanScore;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title?.toJson();
    final l$coverImage = coverImage;
    _resultData['coverImage'] = l$coverImage?.toJson();
    final l$meanScore = meanScore;
    _resultData['meanScore'] = l$meanScore;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$coverImage = coverImage;
    final l$meanScore = meanScore;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$coverImage,
      l$meanScore,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetRecommendedAnime$Page$media) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$coverImage = coverImage;
    final lOther$coverImage = other.coverImage;
    if (l$coverImage != lOther$coverImage) {
      return false;
    }
    final l$meanScore = meanScore;
    final lOther$meanScore = other.meanScore;
    if (l$meanScore != lOther$meanScore) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetRecommendedAnime$Page$media
    on Query$GetRecommendedAnime$Page$media {
  CopyWith$Query$GetRecommendedAnime$Page$media<
          Query$GetRecommendedAnime$Page$media>
      get copyWith => CopyWith$Query$GetRecommendedAnime$Page$media(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetRecommendedAnime$Page$media<TRes> {
  factory CopyWith$Query$GetRecommendedAnime$Page$media(
    Query$GetRecommendedAnime$Page$media instance,
    TRes Function(Query$GetRecommendedAnime$Page$media) then,
  ) = _CopyWithImpl$Query$GetRecommendedAnime$Page$media;

  factory CopyWith$Query$GetRecommendedAnime$Page$media.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRecommendedAnime$Page$media;

  TRes call({
    int? id,
    Query$GetRecommendedAnime$Page$media$title? title,
    Query$GetRecommendedAnime$Page$media$coverImage? coverImage,
    int? meanScore,
    String? $__typename,
  });
  CopyWith$Query$GetRecommendedAnime$Page$media$title<TRes> get title;
  CopyWith$Query$GetRecommendedAnime$Page$media$coverImage<TRes> get coverImage;
}

class _CopyWithImpl$Query$GetRecommendedAnime$Page$media<TRes>
    implements CopyWith$Query$GetRecommendedAnime$Page$media<TRes> {
  _CopyWithImpl$Query$GetRecommendedAnime$Page$media(
    this._instance,
    this._then,
  );

  final Query$GetRecommendedAnime$Page$media _instance;

  final TRes Function(Query$GetRecommendedAnime$Page$media) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? coverImage = _undefined,
    Object? meanScore = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetRecommendedAnime$Page$media(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        title: title == _undefined
            ? _instance.title
            : (title as Query$GetRecommendedAnime$Page$media$title?),
        coverImage: coverImage == _undefined
            ? _instance.coverImage
            : (coverImage as Query$GetRecommendedAnime$Page$media$coverImage?),
        meanScore:
            meanScore == _undefined ? _instance.meanScore : (meanScore as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetRecommendedAnime$Page$media$title<TRes> get title {
    final local$title = _instance.title;
    return local$title == null
        ? CopyWith$Query$GetRecommendedAnime$Page$media$title.stub(
            _then(_instance))
        : CopyWith$Query$GetRecommendedAnime$Page$media$title(
            local$title, (e) => call(title: e));
  }

  CopyWith$Query$GetRecommendedAnime$Page$media$coverImage<TRes>
      get coverImage {
    final local$coverImage = _instance.coverImage;
    return local$coverImage == null
        ? CopyWith$Query$GetRecommendedAnime$Page$media$coverImage.stub(
            _then(_instance))
        : CopyWith$Query$GetRecommendedAnime$Page$media$coverImage(
            local$coverImage, (e) => call(coverImage: e));
  }
}

class _CopyWithStubImpl$Query$GetRecommendedAnime$Page$media<TRes>
    implements CopyWith$Query$GetRecommendedAnime$Page$media<TRes> {
  _CopyWithStubImpl$Query$GetRecommendedAnime$Page$media(this._res);

  TRes _res;

  call({
    int? id,
    Query$GetRecommendedAnime$Page$media$title? title,
    Query$GetRecommendedAnime$Page$media$coverImage? coverImage,
    int? meanScore,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetRecommendedAnime$Page$media$title<TRes> get title =>
      CopyWith$Query$GetRecommendedAnime$Page$media$title.stub(_res);
  CopyWith$Query$GetRecommendedAnime$Page$media$coverImage<TRes>
      get coverImage =>
          CopyWith$Query$GetRecommendedAnime$Page$media$coverImage.stub(_res);
}

class Query$GetRecommendedAnime$Page$media$title {
  Query$GetRecommendedAnime$Page$media$title({
    this.english,
    this.romaji,
    this.native,
    this.$__typename = 'MediaTitle',
  });

  factory Query$GetRecommendedAnime$Page$media$title.fromJson(
      Map<String, dynamic> json) {
    final l$english = json['english'];
    final l$romaji = json['romaji'];
    final l$native = json['native'];
    final l$$__typename = json['__typename'];
    return Query$GetRecommendedAnime$Page$media$title(
      english: (l$english as String?),
      romaji: (l$romaji as String?),
      native: (l$native as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? english;

  final String? romaji;

  final String? native;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$english = english;
    _resultData['english'] = l$english;
    final l$romaji = romaji;
    _resultData['romaji'] = l$romaji;
    final l$native = native;
    _resultData['native'] = l$native;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$english = english;
    final l$romaji = romaji;
    final l$native = native;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$english,
      l$romaji,
      l$native,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetRecommendedAnime$Page$media$title) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$english = english;
    final lOther$english = other.english;
    if (l$english != lOther$english) {
      return false;
    }
    final l$romaji = romaji;
    final lOther$romaji = other.romaji;
    if (l$romaji != lOther$romaji) {
      return false;
    }
    final l$native = native;
    final lOther$native = other.native;
    if (l$native != lOther$native) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetRecommendedAnime$Page$media$title
    on Query$GetRecommendedAnime$Page$media$title {
  CopyWith$Query$GetRecommendedAnime$Page$media$title<
          Query$GetRecommendedAnime$Page$media$title>
      get copyWith => CopyWith$Query$GetRecommendedAnime$Page$media$title(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetRecommendedAnime$Page$media$title<TRes> {
  factory CopyWith$Query$GetRecommendedAnime$Page$media$title(
    Query$GetRecommendedAnime$Page$media$title instance,
    TRes Function(Query$GetRecommendedAnime$Page$media$title) then,
  ) = _CopyWithImpl$Query$GetRecommendedAnime$Page$media$title;

  factory CopyWith$Query$GetRecommendedAnime$Page$media$title.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRecommendedAnime$Page$media$title;

  TRes call({
    String? english,
    String? romaji,
    String? native,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetRecommendedAnime$Page$media$title<TRes>
    implements CopyWith$Query$GetRecommendedAnime$Page$media$title<TRes> {
  _CopyWithImpl$Query$GetRecommendedAnime$Page$media$title(
    this._instance,
    this._then,
  );

  final Query$GetRecommendedAnime$Page$media$title _instance;

  final TRes Function(Query$GetRecommendedAnime$Page$media$title) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? english = _undefined,
    Object? romaji = _undefined,
    Object? native = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetRecommendedAnime$Page$media$title(
        english:
            english == _undefined ? _instance.english : (english as String?),
        romaji: romaji == _undefined ? _instance.romaji : (romaji as String?),
        native: native == _undefined ? _instance.native : (native as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetRecommendedAnime$Page$media$title<TRes>
    implements CopyWith$Query$GetRecommendedAnime$Page$media$title<TRes> {
  _CopyWithStubImpl$Query$GetRecommendedAnime$Page$media$title(this._res);

  TRes _res;

  call({
    String? english,
    String? romaji,
    String? native,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetRecommendedAnime$Page$media$coverImage {
  Query$GetRecommendedAnime$Page$media$coverImage({
    this.large,
    this.$__typename = 'MediaCoverImage',
  });

  factory Query$GetRecommendedAnime$Page$media$coverImage.fromJson(
      Map<String, dynamic> json) {
    final l$large = json['large'];
    final l$$__typename = json['__typename'];
    return Query$GetRecommendedAnime$Page$media$coverImage(
      large: (l$large as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? large;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$large = large;
    _resultData['large'] = l$large;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$large = large;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$large,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetRecommendedAnime$Page$media$coverImage) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$large = large;
    final lOther$large = other.large;
    if (l$large != lOther$large) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetRecommendedAnime$Page$media$coverImage
    on Query$GetRecommendedAnime$Page$media$coverImage {
  CopyWith$Query$GetRecommendedAnime$Page$media$coverImage<
          Query$GetRecommendedAnime$Page$media$coverImage>
      get copyWith => CopyWith$Query$GetRecommendedAnime$Page$media$coverImage(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetRecommendedAnime$Page$media$coverImage<TRes> {
  factory CopyWith$Query$GetRecommendedAnime$Page$media$coverImage(
    Query$GetRecommendedAnime$Page$media$coverImage instance,
    TRes Function(Query$GetRecommendedAnime$Page$media$coverImage) then,
  ) = _CopyWithImpl$Query$GetRecommendedAnime$Page$media$coverImage;

  factory CopyWith$Query$GetRecommendedAnime$Page$media$coverImage.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetRecommendedAnime$Page$media$coverImage;

  TRes call({
    String? large,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetRecommendedAnime$Page$media$coverImage<TRes>
    implements CopyWith$Query$GetRecommendedAnime$Page$media$coverImage<TRes> {
  _CopyWithImpl$Query$GetRecommendedAnime$Page$media$coverImage(
    this._instance,
    this._then,
  );

  final Query$GetRecommendedAnime$Page$media$coverImage _instance;

  final TRes Function(Query$GetRecommendedAnime$Page$media$coverImage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? large = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetRecommendedAnime$Page$media$coverImage(
        large: large == _undefined ? _instance.large : (large as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetRecommendedAnime$Page$media$coverImage<TRes>
    implements CopyWith$Query$GetRecommendedAnime$Page$media$coverImage<TRes> {
  _CopyWithStubImpl$Query$GetRecommendedAnime$Page$media$coverImage(this._res);

  TRes _res;

  call({
    String? large,
    String? $__typename,
  }) =>
      _res;
}
