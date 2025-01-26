import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onyx/features/Warehouse-System/cubit/state.dart';

class WarehouseSystemCubit extends Cubit<WarehouseSystemState> {
  WarehouseSystemCubit([WarehouseSystemState? state])
      : super(WarehouseSystemState());
}
