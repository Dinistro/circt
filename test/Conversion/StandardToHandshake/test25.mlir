// NOTE: Assertions have been autogenerated by utils/update_mlir_test_checks.py
// RUN: circt-opt -lower-std-to-handshake %s | FileCheck %s
// CHECK-LABEL:   handshake.func @if_else(
// CHECK-SAME:                            %[[VAL_0:.*]]: none, ...) -> none attributes {argNames = ["inCtrl"], resNames = ["outCtrl"]} {
// CHECK:           %[[VAL_1:.*]]:4 = fork [4] %[[VAL_0]] : none
// CHECK:           %[[VAL_2:.*]] = constant %[[VAL_1]]#2 {value = 0 : index} : index
// CHECK:           %[[VAL_3:.*]]:2 = fork [2] %[[VAL_2]] : index
// CHECK:           %[[VAL_4:.*]] = constant %[[VAL_1]]#1 {value = -1 : index} : index
// CHECK:           %[[VAL_5:.*]] = arith.muli %[[VAL_3]]#0, %[[VAL_4]] : index
// CHECK:           %[[VAL_6:.*]] = constant %[[VAL_1]]#0 {value = 20 : index} : index
// CHECK:           %[[VAL_7:.*]] = arith.addi %[[VAL_5]], %[[VAL_6]] : index
// CHECK:           %[[VAL_8:.*]] = arith.cmpi sge, %[[VAL_7]], %[[VAL_3]]#1 : index
// CHECK:           %[[VAL_9:.*]], %[[VAL_10:.*]] = cond_br %[[VAL_8]], %[[VAL_1]]#3 : none
// CHECK:           %[[VAL_11:.*]], %[[VAL_12:.*]] = control_merge %[[VAL_9]] : none
// CHECK:           sink %[[VAL_12]] : index
// CHECK:           %[[VAL_13:.*]] = cf.br %[[VAL_11]] : none
// CHECK:           %[[VAL_14:.*]], %[[VAL_15:.*]] = control_merge %[[VAL_10]] : none
// CHECK:           sink %[[VAL_15]] : index
// CHECK:           %[[VAL_16:.*]] = cf.br %[[VAL_14]] : none
// CHECK:           %[[VAL_17:.*]], %[[VAL_18:.*]] = control_merge %[[VAL_16]], %[[VAL_13]] : none
// CHECK:           sink %[[VAL_18]] : index
// CHECK:           return %[[VAL_17]] : none
// CHECK:         }
  func @if_else() {
    %c0 = arith.constant 0 : index
    %c-1 = arith.constant -1 : index
    %1 = arith.muli %c0, %c-1 : index
    %c20 = arith.constant 20 : index
    %2 = arith.addi %1, %c20 : index
    %3 = arith.cmpi sge, %2, %c0 : index
    cond_br %3, ^bb1, ^bb2
  ^bb1: // pred: ^bb0
    cf.br ^bb3
  ^bb2: // pred: ^bb0
    cf.br ^bb3
  ^bb3: // 2 preds: ^bb1, ^bb2
    return
  }
