IBDEI0NM ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,10795,1,3,0)
 ;;=3^Malig Neop Oropharynx,Unspec
 ;;^UTILITY(U,$J,358.3,10795,1,4,0)
 ;;=4^C10.9
 ;;^UTILITY(U,$J,358.3,10795,2)
 ;;=^5000909
 ;;^UTILITY(U,$J,358.3,10796,0)
 ;;=C25.9^^68^675^143
 ;;^UTILITY(U,$J,358.3,10796,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10796,1,3,0)
 ;;=3^Malig Neop Pancreas,Unspec
 ;;^UTILITY(U,$J,358.3,10796,1,4,0)
 ;;=4^C25.9
 ;;^UTILITY(U,$J,358.3,10796,2)
 ;;=^5000946
 ;;^UTILITY(U,$J,358.3,10797,0)
 ;;=C47.9^^68^675^144
 ;;^UTILITY(U,$J,358.3,10797,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10797,1,3,0)
 ;;=3^Malig Neop Peripheral Nerves/Autonomic Nervous System,Unspec
 ;;^UTILITY(U,$J,358.3,10797,1,4,0)
 ;;=4^C47.9
 ;;^UTILITY(U,$J,358.3,10797,2)
 ;;=^5001121
 ;;^UTILITY(U,$J,358.3,10798,0)
 ;;=C38.4^^68^675^145
 ;;^UTILITY(U,$J,358.3,10798,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10798,1,3,0)
 ;;=3^Malig Neop Pleura
 ;;^UTILITY(U,$J,358.3,10798,1,4,0)
 ;;=4^C38.4
 ;;^UTILITY(U,$J,358.3,10798,2)
 ;;=^267140
 ;;^UTILITY(U,$J,358.3,10799,0)
 ;;=C61.^^68^675^146
 ;;^UTILITY(U,$J,358.3,10799,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10799,1,3,0)
 ;;=3^Malig Neop Prostate
 ;;^UTILITY(U,$J,358.3,10799,1,4,0)
 ;;=4^C61.
 ;;^UTILITY(U,$J,358.3,10799,2)
 ;;=^267239
 ;;^UTILITY(U,$J,358.3,10800,0)
 ;;=C20.^^68^675^147
 ;;^UTILITY(U,$J,358.3,10800,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10800,1,3,0)
 ;;=3^Malig Neop Rectum
 ;;^UTILITY(U,$J,358.3,10800,1,4,0)
 ;;=4^C20.
 ;;^UTILITY(U,$J,358.3,10800,2)
 ;;=^267090
 ;;^UTILITY(U,$J,358.3,10801,0)
 ;;=C64.1^^68^675^152
 ;;^UTILITY(U,$J,358.3,10801,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10801,1,3,0)
 ;;=3^Malig Neop Right Kidney,Except Renal pelvis
 ;;^UTILITY(U,$J,358.3,10801,1,4,0)
 ;;=4^C64.1
 ;;^UTILITY(U,$J,358.3,10801,2)
 ;;=^5001248
 ;;^UTILITY(U,$J,358.3,10802,0)
 ;;=C65.1^^68^675^155
 ;;^UTILITY(U,$J,358.3,10802,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10802,1,3,0)
 ;;=3^Malig Neop Right Renal Pelvis
 ;;^UTILITY(U,$J,358.3,10802,1,4,0)
 ;;=4^C65.1
 ;;^UTILITY(U,$J,358.3,10802,2)
 ;;=^5001251
 ;;^UTILITY(U,$J,358.3,10803,0)
 ;;=C62.91^^68^675^156
 ;;^UTILITY(U,$J,358.3,10803,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10803,1,3,0)
 ;;=3^Malig Neop Right Testis
 ;;^UTILITY(U,$J,358.3,10803,1,4,0)
 ;;=4^C62.91
 ;;^UTILITY(U,$J,358.3,10803,2)
 ;;=^5001237
 ;;^UTILITY(U,$J,358.3,10804,0)
 ;;=C17.9^^68^675^157
 ;;^UTILITY(U,$J,358.3,10804,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10804,1,3,0)
 ;;=3^Malig Neop Small Intestine,Unspec
 ;;^UTILITY(U,$J,358.3,10804,1,4,0)
 ;;=4^C17.9
 ;;^UTILITY(U,$J,358.3,10804,2)
 ;;=^5000926
 ;;^UTILITY(U,$J,358.3,10805,0)
 ;;=C16.9^^68^675^158
 ;;^UTILITY(U,$J,358.3,10805,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10805,1,3,0)
 ;;=3^Malig Neop Stomach,Unspec
 ;;^UTILITY(U,$J,358.3,10805,1,4,0)
 ;;=4^C16.9
 ;;^UTILITY(U,$J,358.3,10805,2)
 ;;=^5000923
 ;;^UTILITY(U,$J,358.3,10806,0)
 ;;=C02.9^^68^675^160
 ;;^UTILITY(U,$J,358.3,10806,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10806,1,3,0)
 ;;=3^Malig Neop Tongue,Unspec
 ;;^UTILITY(U,$J,358.3,10806,1,4,0)
 ;;=4^C02.9
 ;;^UTILITY(U,$J,358.3,10806,2)
 ;;=^5000891
 ;;^UTILITY(U,$J,358.3,10807,0)
 ;;=C64.9^^68^675^125
 ;;^UTILITY(U,$J,358.3,10807,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10807,1,3,0)
 ;;=3^Malig Neop Kidney,Except Renal Pelvis,Unspec
 ;;^UTILITY(U,$J,358.3,10807,1,4,0)
 ;;=4^C64.9
 ;;^UTILITY(U,$J,358.3,10807,2)
 ;;=^5001250
 ;;^UTILITY(U,$J,358.3,10808,0)
 ;;=C34.92^^68^675^128
 ;;^UTILITY(U,$J,358.3,10808,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10808,1,3,0)
 ;;=3^Malig Neop Left Bronchus/Lung,Unspec Part
