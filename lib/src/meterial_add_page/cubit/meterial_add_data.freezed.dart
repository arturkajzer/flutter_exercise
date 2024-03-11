// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meterial_add_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MaterialAddData {
  MaterialCategory? get selectedCategory => throw _privateConstructorUsedError;
  HelmetDto get helmetItem => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialAddDataCopyWith<MaterialAddData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialAddDataCopyWith<$Res> {
  factory $MaterialAddDataCopyWith(
          MaterialAddData value, $Res Function(MaterialAddData) then) =
      _$MaterialAddDataCopyWithImpl<$Res, MaterialAddData>;
  @useResult
  $Res call({MaterialCategory? selectedCategory, HelmetDto helmetItem});
}

/// @nodoc
class _$MaterialAddDataCopyWithImpl<$Res, $Val extends MaterialAddData>
    implements $MaterialAddDataCopyWith<$Res> {
  _$MaterialAddDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCategory = freezed,
    Object? helmetItem = null,
  }) {
    return _then(_value.copyWith(
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as MaterialCategory?,
      helmetItem: null == helmetItem
          ? _value.helmetItem
          : helmetItem // ignore: cast_nullable_to_non_nullable
              as HelmetDto,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialAddDataImplCopyWith<$Res>
    implements $MaterialAddDataCopyWith<$Res> {
  factory _$$MaterialAddDataImplCopyWith(_$MaterialAddDataImpl value,
          $Res Function(_$MaterialAddDataImpl) then) =
      __$$MaterialAddDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MaterialCategory? selectedCategory, HelmetDto helmetItem});
}

/// @nodoc
class __$$MaterialAddDataImplCopyWithImpl<$Res>
    extends _$MaterialAddDataCopyWithImpl<$Res, _$MaterialAddDataImpl>
    implements _$$MaterialAddDataImplCopyWith<$Res> {
  __$$MaterialAddDataImplCopyWithImpl(
      _$MaterialAddDataImpl _value, $Res Function(_$MaterialAddDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCategory = freezed,
    Object? helmetItem = null,
  }) {
    return _then(_$MaterialAddDataImpl(
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as MaterialCategory?,
      helmetItem: null == helmetItem
          ? _value.helmetItem
          : helmetItem // ignore: cast_nullable_to_non_nullable
              as HelmetDto,
    ));
  }
}

/// @nodoc

class _$MaterialAddDataImpl implements _MaterialAddData {
  _$MaterialAddDataImpl(
      {required this.selectedCategory, required this.helmetItem});

  @override
  final MaterialCategory? selectedCategory;
  @override
  final HelmetDto helmetItem;

  @override
  String toString() {
    return 'MaterialAddData(selectedCategory: $selectedCategory, helmetItem: $helmetItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialAddDataImpl &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.helmetItem, helmetItem) ||
                other.helmetItem == helmetItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedCategory, helmetItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialAddDataImplCopyWith<_$MaterialAddDataImpl> get copyWith =>
      __$$MaterialAddDataImplCopyWithImpl<_$MaterialAddDataImpl>(
          this, _$identity);
}

abstract class _MaterialAddData implements MaterialAddData {
  factory _MaterialAddData(
      {required final MaterialCategory? selectedCategory,
      required final HelmetDto helmetItem}) = _$MaterialAddDataImpl;

  @override
  MaterialCategory? get selectedCategory;
  @override
  HelmetDto get helmetItem;
  @override
  @JsonKey(ignore: true)
  _$$MaterialAddDataImplCopyWith<_$MaterialAddDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
