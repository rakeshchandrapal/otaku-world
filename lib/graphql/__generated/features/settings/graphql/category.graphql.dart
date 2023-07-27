// GENERATED FILE
// DO NOT MODIFY
// ignore_for_file: type=lint
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$GetGenreCollection {
  Query$GetGenreCollection({
    this.GenreCollection,
    this.$__typename = 'Query',
  });

  factory Query$GetGenreCollection.fromJson(Map<String, dynamic> json) {
    final l$GenreCollection = json['GenreCollection'];
    final l$$__typename = json['__typename'];
    return Query$GetGenreCollection(
      GenreCollection: (l$GenreCollection as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<String?>? GenreCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$GenreCollection = GenreCollection;
    _resultData['GenreCollection'] = l$GenreCollection?.map((e) => e).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$GenreCollection = GenreCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$GenreCollection == null
          ? null
          : Object.hashAll(l$GenreCollection.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetGenreCollection) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$GenreCollection = GenreCollection;
    final lOther$GenreCollection = other.GenreCollection;
    if (l$GenreCollection != null && lOther$GenreCollection != null) {
      if (l$GenreCollection.length != lOther$GenreCollection.length) {
        return false;
      }
      for (int i = 0; i < l$GenreCollection.length; i++) {
        final l$GenreCollection$entry = l$GenreCollection[i];
        final lOther$GenreCollection$entry = lOther$GenreCollection[i];
        if (l$GenreCollection$entry != lOther$GenreCollection$entry) {
          return false;
        }
      }
    } else if (l$GenreCollection != lOther$GenreCollection) {
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

extension UtilityExtension$Query$GetGenreCollection
    on Query$GetGenreCollection {
  CopyWith$Query$GetGenreCollection<Query$GetGenreCollection> get copyWith =>
      CopyWith$Query$GetGenreCollection(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetGenreCollection<TRes> {
  factory CopyWith$Query$GetGenreCollection(
    Query$GetGenreCollection instance,
    TRes Function(Query$GetGenreCollection) then,
  ) = _CopyWithImpl$Query$GetGenreCollection;

  factory CopyWith$Query$GetGenreCollection.stub(TRes res) =
      _CopyWithStubImpl$Query$GetGenreCollection;

  TRes call({
    List<String?>? GenreCollection,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetGenreCollection<TRes>
    implements CopyWith$Query$GetGenreCollection<TRes> {
  _CopyWithImpl$Query$GetGenreCollection(
    this._instance,
    this._then,
  );

  final Query$GetGenreCollection _instance;

  final TRes Function(Query$GetGenreCollection) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? GenreCollection = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetGenreCollection(
        GenreCollection: GenreCollection == _undefined
            ? _instance.GenreCollection
            : (GenreCollection as List<String?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetGenreCollection<TRes>
    implements CopyWith$Query$GetGenreCollection<TRes> {
  _CopyWithStubImpl$Query$GetGenreCollection(this._res);

  TRes _res;

  call({
    List<String?>? GenreCollection,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeQueryGetGenreCollection = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetGenreCollection'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'GenreCollection'),
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
]);
Query$GetGenreCollection _parserFn$Query$GetGenreCollection(
        Map<String, dynamic> data) =>
    Query$GetGenreCollection.fromJson(data);
typedef OnQueryComplete$Query$GetGenreCollection = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetGenreCollection?,
);

class Options$Query$GetGenreCollection
    extends graphql.QueryOptions<Query$GetGenreCollection> {
  Options$Query$GetGenreCollection({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetGenreCollection? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetGenreCollection? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
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
                        : _parserFn$Query$GetGenreCollection(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetGenreCollection,
          parserFn: _parserFn$Query$GetGenreCollection,
        );

  final OnQueryComplete$Query$GetGenreCollection? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetGenreCollection
    extends graphql.WatchQueryOptions<Query$GetGenreCollection> {
  WatchOptions$Query$GetGenreCollection({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetGenreCollection? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetGenreCollection,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetGenreCollection,
        );
}

class FetchMoreOptions$Query$GetGenreCollection
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetGenreCollection(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetGenreCollection,
        );
}

extension ClientExtension$Query$GetGenreCollection on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetGenreCollection>>
      query$GetGenreCollection(
              [Options$Query$GetGenreCollection? options]) async =>
          await this.query(options ?? Options$Query$GetGenreCollection());
  graphql.ObservableQuery<Query$GetGenreCollection>
      watchQuery$GetGenreCollection(
              [WatchOptions$Query$GetGenreCollection? options]) =>
          this.watchQuery(options ?? WatchOptions$Query$GetGenreCollection());
  void writeQuery$GetGenreCollection({
    required Query$GetGenreCollection data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryGetGenreCollection)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetGenreCollection? readQuery$GetGenreCollection(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetGenreCollection)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetGenreCollection.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetGenreCollection>
    useQuery$GetGenreCollection([Options$Query$GetGenreCollection? options]) =>
        graphql_flutter.useQuery(options ?? Options$Query$GetGenreCollection());
graphql.ObservableQuery<Query$GetGenreCollection>
    useWatchQuery$GetGenreCollection(
            [WatchOptions$Query$GetGenreCollection? options]) =>
        graphql_flutter
            .useWatchQuery(options ?? WatchOptions$Query$GetGenreCollection());

class Query$GetGenreCollection$Widget
    extends graphql_flutter.Query<Query$GetGenreCollection> {
  Query$GetGenreCollection$Widget({
    widgets.Key? key,
    Options$Query$GetGenreCollection? options,
    required graphql_flutter.QueryBuilder<Query$GetGenreCollection> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetGenreCollection(),
          builder: builder,
        );
}
