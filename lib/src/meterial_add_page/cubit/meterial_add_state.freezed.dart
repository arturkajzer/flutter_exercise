// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meterial_add_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MaterialAddState {
  MaterialCategory? get selectedCategory => throw _privateConstructorUsedError;
  HelmetModel get helmetModel => throw _privateConstructorUsedError;
  LadderModel get ladderModel => throw _privateConstructorUsedError;
  bool get helmetIsVisible => throw _privateConstructorUsedError;
  bool get ladderIsVisible => throw _privateConstructorUsedError;
  bool get scaffoldPartIsVisible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialAddStateCopyWith<MaterialAddState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialAddStateCopyWith<$Res> {
  factory $MaterialAddStateCopyWith(
          MaterialAddState value, $Res Function(MaterialAddState) then) =
      _$MaterialAddStateCopyWithImpl<$Res, MaterialAddState>;
  @useResult
  $Res call(
      {MaterialCategory? selectedCategory,
      HelmetModel helmetModel,
      LadderModel ladderModel,
      bool helmetIsVisible,
      bool ladderIsVisible,
      bool scaffoldPartIsVisible});
}

/// @nodoc
class _$MaterialAddStateCopyWithImpl<$Res, $Val extends MaterialAddState>
    implements $MaterialAddStateCopyWith<$Res> {
  _$MaterialAddStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCategory = freezed,
    Object? helmetModel = null,
    Object? ladderModel = null,
    Object? helmetIsVisible = null,
    Object? ladderIsVisible = null,
    Object? scaffoldPartIsVisible = null,
  }) {
    return _then(_value.copyWith(
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as MaterialCategory?,
      helmetModel: null == helmetModel
          ? _value.helmetModel
          : helmetModel // ignore: cast_nullable_to_non_nullable
              as HelmetModel,
      ladderModel: null == ladderModel
          ? _value.ladderModel
          : ladderModel // ignore: cast_nullable_to_non_nullable
              as LadderModel,
      helmetIsVisible: null == helmetIsVisible
          ? _value.helmetIsVisible
          : helmetIsVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      ladderIsVisible: null == ladderIsVisible
          ? _value.ladderIsVisible
          : ladderIsVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      scaffoldPartIsVisible: null == scaffoldPartIsVisible
          ? _value.scaffoldPartIsVisible
          : scaffoldPartIsVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialAddStateImplCopyWith<$Res>
    implements $MaterialAddStateCopyWith<$Res> {
  factory _$$MaterialAddStateImplCopyWith(_$MaterialAddStateImpl value,
          $Res Function(_$MaterialAddStateImpl) then) =
      __$$MaterialAddStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MaterialCategory? selectedCategory,
      HelmetModel helmetModel,
      LadderModel ladderModel,
      bool helmetIsVisible,
      bool ladderIsVisible,
      bool scaffoldPartIsVisible});
}

/// @nodoc
class __$$MaterialAddStateImplCopyWithImpl<$Res>
    extends _$MaterialAddStateCopyWithImpl<$Res, _$MaterialAddStateImpl>
    implements _$$MaterialAddStateImplCopyWith<$Res> {
  __$$MaterialAddStateImplCopyWithImpl(_$MaterialAddStateImpl _value,
      $Res Function(_$MaterialAddStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCategory = freezed,
    Object? helmetModel = null,
    Object? ladderModel = null,
    Object? helmetIsVisible = null,
    Object? ladderIsVisible = null,
    Object? scaffoldPartIsVisible = null,
  }) {
    return _then(_$MaterialAddStateImpl(
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as MaterialCategory?,
      helmetModel: null == helmetModel
          ? _value.helmetModel
          : helmetModel // ignore: cast_nullable_to_non_nullable
              as HelmetModel,
      ladderModel: null == ladderModel
          ? _value.ladderModel
          : ladderModel // ignore: cast_nullable_to_non_nullable
              as LadderModel,
      helmetIsVisible: null == helmetIsVisible
          ? _value.helmetIsVisible
          : helmetIsVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      ladderIsVisible: null == ladderIsVisible
          ? _value.ladderIsVisible
          : ladderIsVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      scaffoldPartIsVisible: null == scaffoldPartIsVisible
          ? _value.scaffoldPartIsVisible
          : scaffoldPartIsVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MaterialAddStateImpl implements _MaterialAddState {
  const _$MaterialAddStateImpl(
      {required this.selectedCategory,
      required this.helmetModel,
      required this.ladderModel,
      required this.helmetIsVisible,
      required this.ladderIsVisible,
      required this.scaffoldPartIsVisible});

  @override
  final MaterialCategory? selectedCategory;
  @override
  final HelmetModel helmetModel;
  @override
  final LadderModel ladderModel;
  @override
  final bool helmetIsVisible;
  @override
  final bool ladderIsVisible;
  @override
  final bool scaffoldPartIsVisible;

  @override
  String toString() {
    return 'MaterialAddState(selectedCategory: $selectedCategory, helmetModel: $helmetModel, ladderModel: $ladderModel, helmetIsVisible: $helmetIsVisible, ladderIsVisible: $ladderIsVisible, scaffoldPartIsVisible: $scaffoldPartIsVisible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialAddStateImpl &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.helmetModel, helmetModel) ||
                other.helmetModel == helmetModel) &&
            (identical(other.ladderModel, ladderModel) ||
                other.ladderModel == ladderModel) &&
            (identical(other.helmetIsVisible, helmetIsVisible) ||
                other.helmetIsVisible == helmetIsVisible) &&
            (identical(other.ladderIsVisible, ladderIsVisible) ||
                other.ladderIsVisible == ladderIsVisible) &&
            (identical(other.scaffoldPartIsVisible, scaffoldPartIsVisible) ||
                other.scaffoldPartIsVisible == scaffoldPartIsVisible));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedCategory, helmetModel,
      ladderModel, helmetIsVisible, ladderIsVisible, scaffoldPartIsVisible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialAddStateImplCopyWith<_$MaterialAddStateImpl> get copyWith =>
      __$$MaterialAddStateImplCopyWithImpl<_$MaterialAddStateImpl>(
          this, _$identity);
}

abstract class _MaterialAddState implements MaterialAddState {
  const factory _MaterialAddState(
      {required final MaterialCategory? selectedCategory,
      required final HelmetModel helmetModel,
      required final LadderModel ladderModel,
      required final bool helmetIsVisible,
      required final bool ladderIsVisible,
      required final bool scaffoldPartIsVisible}) = _$MaterialAddStateImpl;

  @override
  MaterialCategory? get selectedCategory;
  @override
  HelmetModel get helmetModel;
  @override
  LadderModel get ladderModel;
  @override
  bool get helmetIsVisible;
  @override
  bool get ladderIsVisible;
  @override
  bool get scaffoldPartIsVisible;
  @override
  @JsonKey(ignore: true)
  _$$MaterialAddStateImplCopyWith<_$MaterialAddStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
