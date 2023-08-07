// GENERATED FILE
// DO NOT MODIFY
// ignore_for_file: type=lint
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$Viewer {
  Query$Viewer({
    this.Viewer,
    this.$__typename = 'Query',
  });

  factory Query$Viewer.fromJson(Map<String, dynamic> json) {
    final l$Viewer = json['Viewer'];
    final l$$__typename = json['__typename'];
    return Query$Viewer(
      Viewer: l$Viewer == null
          ? null
          : Query$Viewer$Viewer.fromJson((l$Viewer as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Viewer$Viewer? Viewer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$Viewer = Viewer;
    _resultData['Viewer'] = l$Viewer?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$Viewer = Viewer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$Viewer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Viewer) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$Viewer = Viewer;
    final lOther$Viewer = other.Viewer;
    if (l$Viewer != lOther$Viewer) {
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

extension UtilityExtension$Query$Viewer on Query$Viewer {
  CopyWith$Query$Viewer<Query$Viewer> get copyWith => CopyWith$Query$Viewer(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Viewer<TRes> {
  factory CopyWith$Query$Viewer(
    Query$Viewer instance,
    TRes Function(Query$Viewer) then,
  ) = _CopyWithImpl$Query$Viewer;

  factory CopyWith$Query$Viewer.stub(TRes res) = _CopyWithStubImpl$Query$Viewer;

  TRes call({
    Query$Viewer$Viewer? Viewer,
    String? $__typename,
  });
  CopyWith$Query$Viewer$Viewer<TRes> get Viewer;
}

class _CopyWithImpl$Query$Viewer<TRes> implements CopyWith$Query$Viewer<TRes> {
  _CopyWithImpl$Query$Viewer(
    this._instance,
    this._then,
  );

  final Query$Viewer _instance;

  final TRes Function(Query$Viewer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? Viewer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Viewer(
        Viewer: Viewer == _undefined
            ? _instance.Viewer
            : (Viewer as Query$Viewer$Viewer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$Viewer$Viewer<TRes> get Viewer {
    final local$Viewer = _instance.Viewer;
    return local$Viewer == null
        ? CopyWith$Query$Viewer$Viewer.stub(_then(_instance))
        : CopyWith$Query$Viewer$Viewer(local$Viewer, (e) => call(Viewer: e));
  }
}

class _CopyWithStubImpl$Query$Viewer<TRes>
    implements CopyWith$Query$Viewer<TRes> {
  _CopyWithStubImpl$Query$Viewer(this._res);

  TRes _res;

  call({
    Query$Viewer$Viewer? Viewer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$Viewer$Viewer<TRes> get Viewer =>
      CopyWith$Query$Viewer$Viewer.stub(_res);
}

const documentNodeQueryViewer = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Viewer'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'Viewer'),
        alias: null,
        arguments: [],
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
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'avatar'),
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
                name: NameNode(value: 'medium'),
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
            name: NameNode(value: 'about'),
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
]);
Query$Viewer _parserFn$Query$Viewer(Map<String, dynamic> data) =>
    Query$Viewer.fromJson(data);
typedef OnQueryComplete$Query$Viewer = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$Viewer?,
);

class Options$Query$Viewer extends graphql.QueryOptions<Query$Viewer> {
  Options$Query$Viewer({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Viewer? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Viewer? onComplete,
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
                    data == null ? null : _parserFn$Query$Viewer(data),
                  ),
          onError: onError,
          document: documentNodeQueryViewer,
          parserFn: _parserFn$Query$Viewer,
        );

  final OnQueryComplete$Query$Viewer? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$Viewer
    extends graphql.WatchQueryOptions<Query$Viewer> {
  WatchOptions$Query$Viewer({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Viewer? typedOptimisticResult,
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
          document: documentNodeQueryViewer,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$Viewer,
        );
}

class FetchMoreOptions$Query$Viewer extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Viewer({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryViewer,
        );
}

extension ClientExtension$Query$Viewer on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Viewer>> query$Viewer(
          [Options$Query$Viewer? options]) async =>
      await this.query(options ?? Options$Query$Viewer());
  graphql.ObservableQuery<Query$Viewer> watchQuery$Viewer(
          [WatchOptions$Query$Viewer? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$Viewer());
  void writeQuery$Viewer({
    required Query$Viewer data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryViewer)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$Viewer? readQuery$Viewer({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryViewer)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Viewer.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Viewer> useQuery$Viewer(
        [Options$Query$Viewer? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$Viewer());
graphql.ObservableQuery<Query$Viewer> useWatchQuery$Viewer(
        [WatchOptions$Query$Viewer? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$Viewer());

class Query$Viewer$Widget extends graphql_flutter.Query<Query$Viewer> {
  Query$Viewer$Widget({
    widgets.Key? key,
    Options$Query$Viewer? options,
    required graphql_flutter.QueryBuilder<Query$Viewer> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$Viewer(),
          builder: builder,
        );
}

class Query$Viewer$Viewer {
  Query$Viewer$Viewer({
    required this.id,
    required this.name,
    this.avatar,
    this.about,
    this.$__typename = 'User',
  });

  factory Query$Viewer$Viewer.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$avatar = json['avatar'];
    final l$about = json['about'];
    final l$$__typename = json['__typename'];
    return Query$Viewer$Viewer(
      id: (l$id as int),
      name: (l$name as String),
      avatar: l$avatar == null
          ? null
          : Query$Viewer$Viewer$avatar.fromJson(
              (l$avatar as Map<String, dynamic>)),
      about: (l$about as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String name;

  final Query$Viewer$Viewer$avatar? avatar;

  final String? about;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$avatar = avatar;
    _resultData['avatar'] = l$avatar?.toJson();
    final l$about = about;
    _resultData['about'] = l$about;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$avatar = avatar;
    final l$about = about;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$avatar,
      l$about,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Viewer$Viewer) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$avatar = avatar;
    final lOther$avatar = other.avatar;
    if (l$avatar != lOther$avatar) {
      return false;
    }
    final l$about = about;
    final lOther$about = other.about;
    if (l$about != lOther$about) {
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

extension UtilityExtension$Query$Viewer$Viewer on Query$Viewer$Viewer {
  CopyWith$Query$Viewer$Viewer<Query$Viewer$Viewer> get copyWith =>
      CopyWith$Query$Viewer$Viewer(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Viewer$Viewer<TRes> {
  factory CopyWith$Query$Viewer$Viewer(
    Query$Viewer$Viewer instance,
    TRes Function(Query$Viewer$Viewer) then,
  ) = _CopyWithImpl$Query$Viewer$Viewer;

  factory CopyWith$Query$Viewer$Viewer.stub(TRes res) =
      _CopyWithStubImpl$Query$Viewer$Viewer;

  TRes call({
    int? id,
    String? name,
    Query$Viewer$Viewer$avatar? avatar,
    String? about,
    String? $__typename,
  });
  CopyWith$Query$Viewer$Viewer$avatar<TRes> get avatar;
}

class _CopyWithImpl$Query$Viewer$Viewer<TRes>
    implements CopyWith$Query$Viewer$Viewer<TRes> {
  _CopyWithImpl$Query$Viewer$Viewer(
    this._instance,
    this._then,
  );

  final Query$Viewer$Viewer _instance;

  final TRes Function(Query$Viewer$Viewer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? avatar = _undefined,
    Object? about = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Viewer$Viewer(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        avatar: avatar == _undefined
            ? _instance.avatar
            : (avatar as Query$Viewer$Viewer$avatar?),
        about: about == _undefined ? _instance.about : (about as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$Viewer$Viewer$avatar<TRes> get avatar {
    final local$avatar = _instance.avatar;
    return local$avatar == null
        ? CopyWith$Query$Viewer$Viewer$avatar.stub(_then(_instance))
        : CopyWith$Query$Viewer$Viewer$avatar(
            local$avatar, (e) => call(avatar: e));
  }
}

class _CopyWithStubImpl$Query$Viewer$Viewer<TRes>
    implements CopyWith$Query$Viewer$Viewer<TRes> {
  _CopyWithStubImpl$Query$Viewer$Viewer(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    Query$Viewer$Viewer$avatar? avatar,
    String? about,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$Viewer$Viewer$avatar<TRes> get avatar =>
      CopyWith$Query$Viewer$Viewer$avatar.stub(_res);
}

class Query$Viewer$Viewer$avatar {
  Query$Viewer$Viewer$avatar({
    this.large,
    this.medium,
    this.$__typename = 'UserAvatar',
  });

  factory Query$Viewer$Viewer$avatar.fromJson(Map<String, dynamic> json) {
    final l$large = json['large'];
    final l$medium = json['medium'];
    final l$$__typename = json['__typename'];
    return Query$Viewer$Viewer$avatar(
      large: (l$large as String?),
      medium: (l$medium as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? large;

  final String? medium;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$large = large;
    _resultData['large'] = l$large;
    final l$medium = medium;
    _resultData['medium'] = l$medium;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$large = large;
    final l$medium = medium;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$large,
      l$medium,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Viewer$Viewer$avatar) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$large = large;
    final lOther$large = other.large;
    if (l$large != lOther$large) {
      return false;
    }
    final l$medium = medium;
    final lOther$medium = other.medium;
    if (l$medium != lOther$medium) {
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

extension UtilityExtension$Query$Viewer$Viewer$avatar
    on Query$Viewer$Viewer$avatar {
  CopyWith$Query$Viewer$Viewer$avatar<Query$Viewer$Viewer$avatar>
      get copyWith => CopyWith$Query$Viewer$Viewer$avatar(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Viewer$Viewer$avatar<TRes> {
  factory CopyWith$Query$Viewer$Viewer$avatar(
    Query$Viewer$Viewer$avatar instance,
    TRes Function(Query$Viewer$Viewer$avatar) then,
  ) = _CopyWithImpl$Query$Viewer$Viewer$avatar;

  factory CopyWith$Query$Viewer$Viewer$avatar.stub(TRes res) =
      _CopyWithStubImpl$Query$Viewer$Viewer$avatar;

  TRes call({
    String? large,
    String? medium,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Viewer$Viewer$avatar<TRes>
    implements CopyWith$Query$Viewer$Viewer$avatar<TRes> {
  _CopyWithImpl$Query$Viewer$Viewer$avatar(
    this._instance,
    this._then,
  );

  final Query$Viewer$Viewer$avatar _instance;

  final TRes Function(Query$Viewer$Viewer$avatar) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? large = _undefined,
    Object? medium = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Viewer$Viewer$avatar(
        large: large == _undefined ? _instance.large : (large as String?),
        medium: medium == _undefined ? _instance.medium : (medium as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$Viewer$Viewer$avatar<TRes>
    implements CopyWith$Query$Viewer$Viewer$avatar<TRes> {
  _CopyWithStubImpl$Query$Viewer$Viewer$avatar(this._res);

  TRes _res;

  call({
    String? large,
    String? medium,
    String? $__typename,
  }) =>
      _res;
}
