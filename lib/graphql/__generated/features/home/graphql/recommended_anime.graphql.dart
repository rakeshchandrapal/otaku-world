// GENERATED FILE
// DO NOT MODIFY
// ignore_for_file: type=lint
import '../../../graphql/fragments.graphql.dart';
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
              FragmentSpreadNode(
                name: NameNode(value: 'MediaShort'),
                directives: [],
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
  fragmentDefinitionMediaShort,
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
              : Fragment$MediaShort.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$MediaShort?>? media;

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
    List<Fragment$MediaShort?>? media,
    String? $__typename,
  });
  TRes media(
      Iterable<Fragment$MediaShort?>? Function(
              Iterable<CopyWith$Fragment$MediaShort<Fragment$MediaShort>?>?)
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
            : (media as List<Fragment$MediaShort?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes media(
          Iterable<Fragment$MediaShort?>? Function(
                  Iterable<CopyWith$Fragment$MediaShort<Fragment$MediaShort>?>?)
              _fn) =>
      call(
          media: _fn(_instance.media?.map((e) => e == null
              ? null
              : CopyWith$Fragment$MediaShort(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$GetRecommendedAnime$Page<TRes>
    implements CopyWith$Query$GetRecommendedAnime$Page<TRes> {
  _CopyWithStubImpl$Query$GetRecommendedAnime$Page(this._res);

  TRes _res;

  call({
    List<Fragment$MediaShort?>? media,
    String? $__typename,
  }) =>
      _res;
  media(_fn) => _res;
}
