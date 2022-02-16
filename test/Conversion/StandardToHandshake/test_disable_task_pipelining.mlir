// NOTE: Assertions have been autogenerated by utils/update_mlir_test_checks.py
// RUN: circt-opt -lower-std-to-handshake="disable-task-pipelining" %s | FileCheck %s

// CHECK-LABEL:   handshake.func @simple_loop(
// CHECK-SAME:                                %[[VAL_0:.*]]: none, ...) -> none attributes {argNames = ["inCtrl"], resNames = ["outCtrl"]} {
// CHECK:           %[[VAL_1:.*]] = cf.br %[[VAL_0]] : none
// CHECK:           %[[VAL_2:.*]], %[[VAL_3:.*]] = control_merge %[[VAL_1]] : none
// CHECK:           %[[VAL_4:.*]]:3 = fork [3] %[[VAL_2]] : none
// CHECK:           sink %[[VAL_3]] : index
// CHECK:           %[[VAL_5:.*]] = constant %[[VAL_4]]#1 {value = 1 : index} : index
// CHECK:           %[[VAL_6:.*]] = constant %[[VAL_4]]#0 {value = 42 : index} : index
// CHECK:           %[[VAL_7:.*]] = cf.br %[[VAL_4]]#2 : none
// CHECK:           %[[VAL_8:.*]] = cf.br %[[VAL_5]] : index
// CHECK:           %[[VAL_9:.*]] = cf.br %[[VAL_6]] : index
// CHECK:           %[[VAL_10:.*]] = mux %[[VAL_11:.*]]#1 {{\[}}%[[VAL_12:.*]], %[[VAL_9]]] : index, index
// CHECK:           %[[VAL_13:.*]]:2 = fork [2] %[[VAL_10]] : index
// CHECK:           %[[VAL_14:.*]], %[[VAL_15:.*]] = control_merge %[[VAL_16:.*]], %[[VAL_7]] : none
// CHECK:           %[[VAL_11]]:2 = fork [2] %[[VAL_15]] : index
// CHECK:           %[[VAL_17:.*]] = mux %[[VAL_11]]#0 {{\[}}%[[VAL_18:.*]], %[[VAL_8]]] : index, index
// CHECK:           %[[VAL_19:.*]]:2 = fork [2] %[[VAL_17]] : index
// CHECK:           %[[VAL_20:.*]] = arith.cmpi slt, %[[VAL_19]]#1, %[[VAL_13]]#1 : index
// CHECK:           %[[VAL_21:.*]]:3 = fork [3] %[[VAL_20]] : i1
// CHECK:           %[[VAL_22:.*]], %[[VAL_23:.*]] = cond_br %[[VAL_21]]#2, %[[VAL_13]]#0 : index
// CHECK:           sink %[[VAL_23]] : index
// CHECK:           %[[VAL_24:.*]], %[[VAL_25:.*]] = cond_br %[[VAL_21]]#1, %[[VAL_14]] : none
// CHECK:           %[[VAL_26:.*]], %[[VAL_27:.*]] = cond_br %[[VAL_21]]#0, %[[VAL_19]]#0 : index
// CHECK:           sink %[[VAL_27]] : index
// CHECK:           %[[VAL_28:.*]] = merge %[[VAL_26]] : index
// CHECK:           %[[VAL_29:.*]] = merge %[[VAL_22]] : index
// CHECK:           %[[VAL_30:.*]], %[[VAL_31:.*]] = control_merge %[[VAL_24]] : none
// CHECK:           %[[VAL_32:.*]]:2 = fork [2] %[[VAL_30]] : none
// CHECK:           sink %[[VAL_31]] : index
// CHECK:           %[[VAL_33:.*]] = constant %[[VAL_32]]#0 {value = 1 : index} : index
// CHECK:           %[[VAL_34:.*]] = arith.addi %[[VAL_28]], %[[VAL_33]] : index
// CHECK:           %[[VAL_12]] = cf.br %[[VAL_29]] : index
// CHECK:           %[[VAL_16]] = cf.br %[[VAL_32]]#1 : none
// CHECK:           %[[VAL_18]] = cf.br %[[VAL_34]] : index
// CHECK:           %[[VAL_35:.*]], %[[VAL_36:.*]] = control_merge %[[VAL_25]] : none
// CHECK:           sink %[[VAL_36]] : index
// CHECK:           return %[[VAL_35]] : none
// CHECK:         }
func @simple_loop() {
^bb0:
  cf.br ^bb1
^bb1:	// pred: ^bb0
  %c1 = arith.constant 1 : index
  %c42 = arith.constant 42 : index
  cf.br ^bb2(%c1 : index)
^bb2(%0: index):	// 2 preds: ^bb1, ^bb3
  %1 = arith.cmpi slt, %0, %c42 : index
  cond_br %1, ^bb3, ^bb4
^bb3:	// pred: ^bb2
  %c1_0 = arith.constant 1 : index
  %2 = arith.addi %0, %c1_0 : index
  cf.br ^bb2(%2 : index)
^bb4:	// pred: ^bb2
  return
}
