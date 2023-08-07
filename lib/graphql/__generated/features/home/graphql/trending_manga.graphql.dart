// GENERATED FILE
// DO NOT MODIFY
// ignore_for_file: type=lint
import '../../../graphql/fragments.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$GetTrendingManga {
  factory Variables$Query$GetTrendingManga({int? page}) =>
      Variables$Query$GetTrendingManga._({
        if (page != null) r'page': page,
      });

  Variables$Query$GetTrendingManga._(this._$data);

  factory Variables$Query$GetTrendingManga.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('page')) {
      final l$page = data['page'];
      result$data['page'] = (l$page as int?);
    }
    return Variables$Query$GetTrendingManga._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get page => (_$data['page'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('page')) {
      final l$page = page;
      result$data['page'] = l$page;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetTrendingManga<Variables$Query$GetTrendingManga>
      get copyWith => CopyWith$Variables$Query$GetTrendingManga(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetTrendingManga) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$page = page;
    final lOther$page = other.page;
    if (_$data.containsKey('page') != other._$data.containsKey('page')) {
      return false;
    }
    if (l$page != lOther$page) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$page = page;
    return Object.hashAll([_$data.containsKey('page') ? l$page : const {}]);
  }
}

abstract class CopyWith$Variables$Query$GetTrendingManga<TRes> {
  factory CopyWith$Variables$Query$GetTrendingManga(
    Variables$Query$GetTrendingManga instance,
    TRes Function(Variables$Query$GetTrendingManga) then,
  ) = _CopyWithImpl$Variables$Query$GetTrendingManga;

  factory CopyWith$Variables$Query$GetTrendingManga.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetTrendingManga;

  TRes call({int? page});
}

class _CopyWithImpl$Variables$Query$GetTrendingManga<TRes>
    implements CopyWith$Variables$Query$GetTrendingManga<TRes> {
  _CopyWithImpl$Variables$Query$GetTrendingManga(
    this._instance,
    this._then,
  );

  final Variables$Query$GetTrendingManga _instance;

  final TRes Function(Variables$Query$GetTrendingManga) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? page = _undefined}) =>
      _then(Variables$Query$GetTrendingManga._({
        ..._instance._$data,
        if (page != _undefined) 'page': (page as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetTrendingManga<TRes>
    implements CopyWith$Variables$Query$GetTrendingManga<TRes> {
  _CopyWithStubImpl$Variables$Query$GetTrendingManga(this._res);

  TRes _res;

  call({int? page}) => _res;
}

class Query$GetTrendingManga {
  Query$GetTrendingManga({
    this.Page,
    this.$__typename = 'Query',
  });

  factory Query$GetTrendingManga.fromJson(Map<String, dynamic> json) {
    final l$Page = json['Page'];
    final l$$__typename = json['__typename'];
    return Query$GetTrendingManga(
      Page: l$Page == null
          ? null
          : Query$GetTrendingManga$Page.fromJson(
              (l$Page as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetTrendingManga$Page? Page;

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
    if (!(other is Query$GetTrendingManga) ||
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

extension UtilityExtension$Query$GetTrendingManga on Query$GetTrendingManga {
  CopyWith$Query$GetTrendingManga<Query$GetTrendingManga> get copyWith =>
      CopyWith$Query$GetTrendingManga(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetTrendingManga<TRes> {
  factory CopyWith$Query$GetTrendingManga(
    Query$GetTrendingManga instance,
    TRes Function(Query$GetTrendingManga) then,
  ) = _CopyWithImpl$Query$GetTrendingManga;

  factory CopyWith$Query$GetTrendingManga.stub(TRes res) =
      _CopyWithStubImpl$Query$GetTrendingManga;

  TRes call({
    Query$GetTrendingManga$Page? Page,
    String? $__typename,
  });
  CopyWith$Query$GetTrendingManga$Page<TRes> get Page;
}

class _CopyWithImpl$Query$GetTrendingManga<TRes>
    implements CopyWith$Query$GetTrendingManga<TRes> {
  _CopyWithImpl$Query$GetTrendingManga(
    this._instance,
    this._then,
  );

  final Query$GetTrendingManga _instance;

  final TRes Function(Query$GetTrendingManga) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? Page = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetTrendingManga(
        Page: Page == _undefined
            ? _instance.Page
            : (Page as Query$GetTrendingManga$Page?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetTrendingManga$Page<TRes> get Page {
    final local$Page = _instance.Page;
    return local$Page == null
        ? CopyWith$Query$GetTrendingManga$Page.stub(_then(_instance))
        : CopyWith$Query$GetTrendingManga$Page(
            local$Page, (e) => call(Page: e));
  }
}

class _CopyWithStubImpl$Query$GetTrendingManga<TRes>
    implements CopyWith$Query$GetTrendingManga<TRes> {
  _CopyWithStubImpl$Query$GetTrendingManga(this._res);

  TRes _res;

  call({
    Query$GetTrendingManga$Page? Page,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetTrendingManga$Page<TRes> get Page =>
      CopyWith$Query$GetTrendingManga$Page.stub(_res);
}

const documentNodeQueryGetTrendingManga = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetTrendingManga'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'page')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
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
            value: IntValueNode(value: '30'),
          ),
          ArgumentNode(
            name: NameNode(value: 'page'),
            value: VariableNode(name: NameNode(value: 'page')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'pageInfo'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'currentPage'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'hasNextPage'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'lastPage'),
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
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'sort'),
                value: ListValueNode(values: [
                  EnumValueNode(name: NameNode(value: 'TRENDING_DESC'))
                ]),
              ),
              ArgumentNode(
                name: NameNode(value: 'type'),
                value: EnumValueNode(name: NameNode(value: 'MANGA')),
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
Query$GetTrendingManga _parserFn$Query$GetTrendingManga(
        Map<String, dynamic> data) =>
    Query$GetTrendingManga.fromJson(data);
typedef OnQueryComplete$Query$GetTrendingManga = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetTrendingManga?,
);

class Options$Query$GetTrendingManga
    extends graphql.QueryOptions<Query$GetTrendingManga> {
  Options$Query$GetTrendingManga({
    String? operationName,
    Variables$Query$GetTrendingManga? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetTrendingManga? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetTrendingManga? onComplete,
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
                        : _parserFn$Query$GetTrendingManga(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetTrendingManga,
          parserFn: _parserFn$Query$GetTrendingManga,
        );

  final OnQueryComplete$Query$GetTrendingManga? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetTrendingManga
    extends graphql.WatchQueryOptions<Query$GetTrendingManga> {
  WatchOptions$Query$GetTrendingManga({
    String? operationName,
    Variables$Query$GetTrendingManga? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetTrendingManga? typedOptimisticResult,
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
          document: documentNodeQueryGetTrendingManga,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetTrendingManga,
        );
}

class FetchMoreOptions$Query$GetTrendingManga extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetTrendingManga({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$GetTrendingManga? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryGetTrendingManga,
        );
}

extension ClientExtension$Query$GetTrendingManga on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetTrendingManga>> query$GetTrendingManga(
          [Options$Query$GetTrendingManga? options]) async =>
      await this.query(options ?? Options$Query$GetTrendingManga());
  graphql.ObservableQuery<Query$GetTrendingManga> watchQuery$GetTrendingManga(
          [WatchOptions$Query$GetTrendingManga? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetTrendingManga());
  void writeQuery$GetTrendingManga({
    required Query$GetTrendingManga data,
    Variables$Query$GetTrendingManga? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetTrendingManga),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetTrendingManga? readQuery$GetTrendingManga({
    Variables$Query$GetTrendingManga? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetTrendingManga),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetTrendingManga.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetTrendingManga>
    useQuery$GetTrendingManga([Options$Query$GetTrendingManga? options]) =>
        graphql_flutter.useQuery(options ?? Options$Query$GetTrendingManga());
graphql.ObservableQuery<Query$GetTrendingManga> useWatchQuery$GetTrendingManga(
        [WatchOptions$Query$GetTrendingManga? options]) =>
    graphql_flutter
        .useWatchQuery(options ?? WatchOptions$Query$GetTrendingManga());

class Query$GetTrendingManga$Widget
    extends graphql_flutter.Query<Query$GetTrendingManga> {
  Query$GetTrendingManga$Widget({
    widgets.Key? key,
    Options$Query$GetTrendingManga? options,
    required graphql_flutter.QueryBuilder<Query$GetTrendingManga> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetTrendingManga(),
          builder: builder,
        );
}

class Query$GetTrendingManga$Page {
  Query$GetTrendingManga$Page({
    this.pageInfo,
    this.media,
    this.$__typename = 'Page',
  });

  factory Query$GetTrendingManga$Page.fromJson(Map<String, dynamic> json) {
    final l$pageInfo = json['pageInfo'];
    final l$media = json['media'];
    final l$$__typename = json['__typename'];
    return Query$GetTrendingManga$Page(
      pageInfo: l$pageInfo == null
          ? null
          : Query$GetTrendingManga$Page$pageInfo.fromJson(
              (l$pageInfo as Map<String, dynamic>)),
      media: (l$media as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Fragment$MediaShort.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetTrendingManga$Page$pageInfo? pageInfo;

  final List<Fragment$MediaShort?>? media;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo?.toJson();
    final l$media = media;
    _resultData['media'] = l$media?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$pageInfo = pageInfo;
    final l$media = media;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$pageInfo,
      l$media == null ? null : Object.hashAll(l$media.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetTrendingManga$Page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
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

extension UtilityExtension$Query$GetTrendingManga$Page
    on Query$GetTrendingManga$Page {
  CopyWith$Query$GetTrendingManga$Page<Query$GetTrendingManga$Page>
      get copyWith => CopyWith$Query$GetTrendingManga$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetTrendingManga$Page<TRes> {
  factory CopyWith$Query$GetTrendingManga$Page(
    Query$GetTrendingManga$Page instance,
    TRes Function(Query$GetTrendingManga$Page) then,
  ) = _CopyWithImpl$Query$GetTrendingManga$Page;

  factory CopyWith$Query$GetTrendingManga$Page.stub(TRes res) =
      _CopyWithStubImpl$Query$GetTrendingManga$Page;

  TRes call({
    Query$GetTrendingManga$Page$pageInfo? pageInfo,
    List<Fragment$MediaShort?>? media,
    String? $__typename,
  });
  CopyWith$Query$GetTrendingManga$Page$pageInfo<TRes> get pageInfo;
  TRes media(
      Iterable<Fragment$MediaShort?>? Function(
              Iterable<CopyWith$Fragment$MediaShort<Fragment$MediaShort>?>?)
          _fn);
}

class _CopyWithImpl$Query$GetTrendingManga$Page<TRes>
    implements CopyWith$Query$GetTrendingManga$Page<TRes> {
  _CopyWithImpl$Query$GetTrendingManga$Page(
    this._instance,
    this._then,
  );

  final Query$GetTrendingManga$Page _instance;

  final TRes Function(Query$GetTrendingManga$Page) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? pageInfo = _undefined,
    Object? media = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetTrendingManga$Page(
        pageInfo: pageInfo == _undefined
            ? _instance.pageInfo
            : (pageInfo as Query$GetTrendingManga$Page$pageInfo?),
        media: media == _undefined
            ? _instance.media
            : (media as List<Fragment$MediaShort?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetTrendingManga$Page$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return local$pageInfo == null
        ? CopyWith$Query$GetTrendingManga$Page$pageInfo.stub(_then(_instance))
        : CopyWith$Query$GetTrendingManga$Page$pageInfo(
            local$pageInfo, (e) => call(pageInfo: e));
  }

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

class _CopyWithStubImpl$Query$GetTrendingManga$Page<TRes>
    implements CopyWith$Query$GetTrendingManga$Page<TRes> {
  _CopyWithStubImpl$Query$GetTrendingManga$Page(this._res);

  TRes _res;

  call({
    Query$GetTrendingManga$Page$pageInfo? pageInfo,
    List<Fragment$MediaShort?>? media,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetTrendingManga$Page$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$GetTrendingManga$Page$pageInfo.stub(_res);
  media(_fn) => _res;
}

class Query$GetTrendingManga$Page$pageInfo {
  Query$GetTrendingManga$Page$pageInfo({
    this.currentPage,
    this.hasNextPage,
    this.lastPage,
    this.$__typename = 'PageInfo',
  });

  factory Query$GetTrendingManga$Page$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$currentPage = json['currentPage'];
    final l$hasNextPage = json['hasNextPage'];
    final l$lastPage = json['lastPage'];
    final l$$__typename = json['__typename'];
    return Query$GetTrendingManga$Page$pageInfo(
      currentPage: (l$currentPage as int?),
      hasNextPage: (l$hasNextPage as bool?),
      lastPage: (l$lastPage as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final int? currentPage;

  final bool? hasNextPage;

  final int? lastPage;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$currentPage = currentPage;
    _resultData['currentPage'] = l$currentPage;
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$lastPage = lastPage;
    _resultData['lastPage'] = l$lastPage;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$currentPage = currentPage;
    final l$hasNextPage = hasNextPage;
    final l$lastPage = lastPage;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$currentPage,
      l$hasNextPage,
      l$lastPage,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetTrendingManga$Page$pageInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$currentPage = currentPage;
    final lOther$currentPage = other.currentPage;
    if (l$currentPage != lOther$currentPage) {
      return false;
    }
    final l$hasNextPage = hasNextPage;
    final lOther$hasNextPage = other.hasNextPage;
    if (l$hasNextPage != lOther$hasNextPage) {
      return false;
    }
    final l$lastPage = lastPage;
    final lOther$lastPage = other.lastPage;
    if (l$lastPage != lOther$lastPage) {
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

extension UtilityExtension$Query$GetTrendingManga$Page$pageInfo
    on Query$GetTrendingManga$Page$pageInfo {
  CopyWith$Query$GetTrendingManga$Page$pageInfo<
          Query$GetTrendingManga$Page$pageInfo>
      get copyWith => CopyWith$Query$GetTrendingManga$Page$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetTrendingManga$Page$pageInfo<TRes> {
  factory CopyWith$Query$GetTrendingManga$Page$pageInfo(
    Query$GetTrendingManga$Page$pageInfo instance,
    TRes Function(Query$GetTrendingManga$Page$pageInfo) then,
  ) = _CopyWithImpl$Query$GetTrendingManga$Page$pageInfo;

  factory CopyWith$Query$GetTrendingManga$Page$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$GetTrendingManga$Page$pageInfo;

  TRes call({
    int? currentPage,
    bool? hasNextPage,
    int? lastPage,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetTrendingManga$Page$pageInfo<TRes>
    implements CopyWith$Query$GetTrendingManga$Page$pageInfo<TRes> {
  _CopyWithImpl$Query$GetTrendingManga$Page$pageInfo(
    this._instance,
    this._then,
  );

  final Query$GetTrendingManga$Page$pageInfo _instance;

  final TRes Function(Query$GetTrendingManga$Page$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? currentPage = _undefined,
    Object? hasNextPage = _undefined,
    Object? lastPage = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetTrendingManga$Page$pageInfo(
        currentPage: currentPage == _undefined
            ? _instance.currentPage
            : (currentPage as int?),
        hasNextPage: hasNextPage == _undefined
            ? _instance.hasNextPage
            : (hasNextPage as bool?),
        lastPage:
            lastPage == _undefined ? _instance.lastPage : (lastPage as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetTrendingManga$Page$pageInfo<TRes>
    implements CopyWith$Query$GetTrendingManga$Page$pageInfo<TRes> {
  _CopyWithStubImpl$Query$GetTrendingManga$Page$pageInfo(this._res);

  TRes _res;

  call({
    int? currentPage,
    bool? hasNextPage,
    int? lastPage,
    String? $__typename,
  }) =>
      _res;
}
