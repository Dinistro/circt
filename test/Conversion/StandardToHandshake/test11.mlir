// NOTE: Assertions have been autogenerated by utils/update_mlir_test_checks.py
// RUN: circt-opt -lower-std-to-handshake %s | FileCheck %s
// CHECK-LABEL:   handshake.func @imperfectly_nested_loops(
// CHECK-SAME:                                             %[[VAL_0:.*]]: none, ...) -> none attributes {argNames = ["inCtrl"], resNames = ["outCtrl"]} {
// CHECK:           %[[VAL_1:.*]]:4 = fork [4] %[[VAL_0]] : none
// CHECK:           %[[VAL_2:.*]] = constant %[[VAL_1]]#2 {value = 0 : index} : index
// CHECK:           %[[VAL_3:.*]] = constant %[[VAL_1]]#1 {value = 42 : index} : index
// CHECK:           %[[VAL_4:.*]] = constant %[[VAL_1]]#0 {value = 1 : index} : index
// CHECK:           %[[VAL_5:.*]] = br %[[VAL_1]]#3 : none
// CHECK:           %[[VAL_6:.*]] = br %[[VAL_2]] : index
// CHECK:           %[[VAL_7:.*]] = br %[[VAL_3]] : index
// CHECK:           %[[VAL_8:.*]] = br %[[VAL_4]] : index
// CHECK:           %[[VAL_9:.*]], %[[VAL_10:.*]] = control_merge %[[VAL_5]] : none
// CHECK:           %[[VAL_11:.*]]:3 = fork [3] %[[VAL_10]] : index
// CHECK:           %[[VAL_12:.*]] = buffer [1] seq %[[VAL_13:.*]] {initValues = [0]} : i1
// CHECK:           %[[VAL_14:.*]]:4 = fork [4] %[[VAL_12]] : i1
// CHECK:           %[[VAL_15:.*]] = mux %[[VAL_14]]#3 {{\[}}%[[VAL_9]], %[[VAL_16:.*]]] : i1, none
// CHECK:           %[[VAL_17:.*]] = mux %[[VAL_11]]#2 {{\[}}%[[VAL_7]]] : index, index
// CHECK:           %[[VAL_18:.*]] = mux %[[VAL_14]]#2 {{\[}}%[[VAL_17]], %[[VAL_19:.*]]] : i1, index
// CHECK:           %[[VAL_20:.*]]:2 = fork [2] %[[VAL_18]] : index
// CHECK:           %[[VAL_21:.*]] = mux %[[VAL_11]]#1 {{\[}}%[[VAL_8]]] : index, index
// CHECK:           %[[VAL_22:.*]] = mux %[[VAL_14]]#1 {{\[}}%[[VAL_21]], %[[VAL_23:.*]]] : i1, index
// CHECK:           %[[VAL_24:.*]] = mux %[[VAL_11]]#0 {{\[}}%[[VAL_6]]] : index, index
// CHECK:           %[[VAL_25:.*]] = mux %[[VAL_14]]#0 {{\[}}%[[VAL_24]], %[[VAL_26:.*]]] : i1, index
// CHECK:           %[[VAL_27:.*]]:2 = fork [2] %[[VAL_25]] : index
// CHECK:           %[[VAL_13]] = merge %[[VAL_28:.*]]#0 : i1
// CHECK:           %[[VAL_29:.*]] = arith.cmpi slt, %[[VAL_27]]#0, %[[VAL_20]]#0 : index
// CHECK:           %[[VAL_28]]:5 = fork [5] %[[VAL_29]] : i1
// CHECK:           %[[VAL_30:.*]], %[[VAL_31:.*]] = cond_br %[[VAL_28]]#4, %[[VAL_20]]#1 : index
// CHECK:           sink %[[VAL_31]] : index
// CHECK:           %[[VAL_32:.*]], %[[VAL_33:.*]] = cond_br %[[VAL_28]]#3, %[[VAL_22]] : index
// CHECK:           sink %[[VAL_33]] : index
// CHECK:           %[[VAL_34:.*]], %[[VAL_35:.*]] = cond_br %[[VAL_28]]#2, %[[VAL_15]] : none
// CHECK:           %[[VAL_36:.*]], %[[VAL_37:.*]] = cond_br %[[VAL_28]]#1, %[[VAL_27]]#1 : index
// CHECK:           sink %[[VAL_37]] : index
// CHECK:           %[[VAL_38:.*]] = merge %[[VAL_36]] : index
// CHECK:           %[[VAL_39:.*]] = merge %[[VAL_32]] : index
// CHECK:           %[[VAL_40:.*]] = merge %[[VAL_30]] : index
// CHECK:           %[[VAL_41:.*]], %[[VAL_42:.*]] = control_merge %[[VAL_34]] : none
// CHECK:           %[[VAL_43:.*]]:4 = fork [4] %[[VAL_41]] : none
// CHECK:           sink %[[VAL_42]] : index
// CHECK:           %[[VAL_44:.*]] = constant %[[VAL_43]]#2 {value = 7 : index} : index
// CHECK:           %[[VAL_45:.*]] = constant %[[VAL_43]]#1 {value = 56 : index} : index
// CHECK:           %[[VAL_46:.*]] = constant %[[VAL_43]]#0 {value = 2 : index} : index
// CHECK:           %[[VAL_47:.*]] = br %[[VAL_38]] : index
// CHECK:           %[[VAL_48:.*]] = br %[[VAL_39]] : index
// CHECK:           %[[VAL_49:.*]] = br %[[VAL_40]] : index
// CHECK:           %[[VAL_50:.*]] = br %[[VAL_43]]#3 : none
// CHECK:           %[[VAL_51:.*]] = br %[[VAL_44]] : index
// CHECK:           %[[VAL_52:.*]] = br %[[VAL_45]] : index
// CHECK:           %[[VAL_53:.*]] = br %[[VAL_46]] : index
// CHECK:           %[[VAL_54:.*]] = mux %[[VAL_55:.*]]#5 {{\[}}%[[VAL_56:.*]], %[[VAL_52]]] : index, index
// CHECK:           %[[VAL_57:.*]]:2 = fork [2] %[[VAL_54]] : index
// CHECK:           %[[VAL_58:.*]] = mux %[[VAL_55]]#4 {{\[}}%[[VAL_59:.*]], %[[VAL_53]]] : index, index
// CHECK:           %[[VAL_60:.*]] = mux %[[VAL_55]]#3 {{\[}}%[[VAL_61:.*]], %[[VAL_47]]] : index, index
// CHECK:           %[[VAL_62:.*]] = mux %[[VAL_55]]#2 {{\[}}%[[VAL_63:.*]], %[[VAL_48]]] : index, index
// CHECK:           %[[VAL_64:.*]] = mux %[[VAL_55]]#1 {{\[}}%[[VAL_65:.*]], %[[VAL_49]]] : index, index
// CHECK:           %[[VAL_66:.*]], %[[VAL_67:.*]] = control_merge %[[VAL_68:.*]], %[[VAL_50]] : none
// CHECK:           %[[VAL_55]]:6 = fork [6] %[[VAL_67]] : index
// CHECK:           %[[VAL_69:.*]] = mux %[[VAL_55]]#0 {{\[}}%[[VAL_70:.*]], %[[VAL_51]]] : index, index
// CHECK:           %[[VAL_71:.*]]:2 = fork [2] %[[VAL_69]] : index
// CHECK:           %[[VAL_72:.*]] = arith.cmpi slt, %[[VAL_71]]#1, %[[VAL_57]]#1 : index
// CHECK:           %[[VAL_73:.*]]:7 = fork [7] %[[VAL_72]] : i1
// CHECK:           %[[VAL_74:.*]], %[[VAL_75:.*]] = cond_br %[[VAL_73]]#6, %[[VAL_57]]#0 : index
// CHECK:           sink %[[VAL_75]] : index
// CHECK:           %[[VAL_76:.*]], %[[VAL_77:.*]] = cond_br %[[VAL_73]]#5, %[[VAL_58]] : index
// CHECK:           sink %[[VAL_77]] : index
// CHECK:           %[[VAL_78:.*]], %[[VAL_79:.*]] = cond_br %[[VAL_73]]#4, %[[VAL_60]] : index
// CHECK:           %[[VAL_80:.*]], %[[VAL_81:.*]] = cond_br %[[VAL_73]]#3, %[[VAL_62]] : index
// CHECK:           %[[VAL_82:.*]], %[[VAL_83:.*]] = cond_br %[[VAL_73]]#2, %[[VAL_64]] : index
// CHECK:           %[[VAL_84:.*]], %[[VAL_85:.*]] = cond_br %[[VAL_73]]#1, %[[VAL_66]] : none
// CHECK:           %[[VAL_86:.*]], %[[VAL_87:.*]] = cond_br %[[VAL_73]]#0, %[[VAL_71]]#0 : index
// CHECK:           sink %[[VAL_87]] : index
// CHECK:           %[[VAL_88:.*]] = merge %[[VAL_86]] : index
// CHECK:           %[[VAL_89:.*]] = merge %[[VAL_76]] : index
// CHECK:           %[[VAL_90:.*]]:2 = fork [2] %[[VAL_89]] : index
// CHECK:           %[[VAL_91:.*]] = merge %[[VAL_74]] : index
// CHECK:           %[[VAL_92:.*]] = merge %[[VAL_78]] : index
// CHECK:           %[[VAL_93:.*]] = merge %[[VAL_80]] : index
// CHECK:           %[[VAL_94:.*]] = merge %[[VAL_82]] : index
// CHECK:           %[[VAL_95:.*]], %[[VAL_96:.*]] = control_merge %[[VAL_84]] : none
// CHECK:           sink %[[VAL_96]] : index
// CHECK:           %[[VAL_97:.*]] = arith.addi %[[VAL_88]], %[[VAL_90]]#1 : index
// CHECK:           %[[VAL_59]] = br %[[VAL_90]]#0 : index
// CHECK:           %[[VAL_56]] = br %[[VAL_91]] : index
// CHECK:           %[[VAL_61]] = br %[[VAL_92]] : index
// CHECK:           %[[VAL_63]] = br %[[VAL_93]] : index
// CHECK:           %[[VAL_65]] = br %[[VAL_94]] : index
// CHECK:           %[[VAL_68]] = br %[[VAL_95]] : none
// CHECK:           %[[VAL_70]] = br %[[VAL_97]] : index
// CHECK:           %[[VAL_98:.*]] = merge %[[VAL_79]] : index
// CHECK:           %[[VAL_99:.*]] = merge %[[VAL_81]] : index
// CHECK:           %[[VAL_100:.*]]:2 = fork [2] %[[VAL_99]] : index
// CHECK:           %[[VAL_101:.*]] = merge %[[VAL_83]] : index
// CHECK:           %[[VAL_102:.*]], %[[VAL_103:.*]] = control_merge %[[VAL_85]] : none
// CHECK:           sink %[[VAL_103]] : index
// CHECK:           %[[VAL_104:.*]] = arith.addi %[[VAL_98]], %[[VAL_100]]#1 : index
// CHECK:           %[[VAL_23]] = br %[[VAL_100]]#0 : index
// CHECK:           %[[VAL_19]] = br %[[VAL_101]] : index
// CHECK:           %[[VAL_16]] = br %[[VAL_102]] : none
// CHECK:           %[[VAL_26]] = br %[[VAL_104]] : index
// CHECK:           %[[VAL_105:.*]], %[[VAL_106:.*]] = control_merge %[[VAL_35]] : none
// CHECK:           sink %[[VAL_106]] : index
// CHECK:           return %[[VAL_105]] : none
// CHECK:         }
func @imperfectly_nested_loops() {
  %c0 = arith.constant 0 : index
  %c42 = arith.constant 42 : index
  %c1 = arith.constant 1 : index
  cf.br ^bb1(%c0 : index)
^bb1(%0: index):      // 2 preds: ^bb0, ^bb5
  %1 = arith.cmpi slt, %0, %c42 : index
  cf.cond_br %1, ^bb2, ^bb6
^bb2: // pred: ^bb1
  %c7 = arith.constant 7 : index
  %c56 = arith.constant 56 : index
  %c2 = arith.constant 2 : index
  cf.br ^bb3(%c7 : index)
^bb3(%2: index):      // 2 preds: ^bb2, ^bb4
  %3 = arith.cmpi slt, %2, %c56 : index
  cf.cond_br %3, ^bb4, ^bb5
^bb4: // pred: ^bb3
  %4 = arith.addi %2, %c2 : index
  cf.br ^bb3(%4 : index)
^bb5: // pred: ^bb3
  %5 = arith.addi %0, %c1 : index
  cf.br ^bb1(%5 : index)
^bb6: // pred: ^bb1
  return
}
