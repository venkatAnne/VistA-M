IBDEI1NC ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,27548,2)
 ;;=^5019513
 ;;^UTILITY(U,$J,358.3,27549,0)
 ;;=G44.1^^132^1317^9
 ;;^UTILITY(U,$J,358.3,27549,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27549,1,3,0)
 ;;=3^Vascular Headache NEC
 ;;^UTILITY(U,$J,358.3,27549,1,4,0)
 ;;=4^G44.1
 ;;^UTILITY(U,$J,358.3,27549,2)
 ;;=^5003934
 ;;^UTILITY(U,$J,358.3,27550,0)
 ;;=G43.909^^132^1317^5
 ;;^UTILITY(U,$J,358.3,27550,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27550,1,3,0)
 ;;=3^Migraine,Unspec,Not Intractable
 ;;^UTILITY(U,$J,358.3,27550,1,4,0)
 ;;=4^G43.909
 ;;^UTILITY(U,$J,358.3,27550,2)
 ;;=^5003909
 ;;^UTILITY(U,$J,358.3,27551,0)
 ;;=G44.009^^132^1317^1
 ;;^UTILITY(U,$J,358.3,27551,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27551,1,3,0)
 ;;=3^Cluster Headache,Unspec,Not Intractable
 ;;^UTILITY(U,$J,358.3,27551,1,4,0)
 ;;=4^G44.009
 ;;^UTILITY(U,$J,358.3,27551,2)
 ;;=^5003921
 ;;^UTILITY(U,$J,358.3,27552,0)
 ;;=G44.40^^132^1317^4
 ;;^UTILITY(U,$J,358.3,27552,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27552,1,3,0)
 ;;=3^Medication Overuse Headache,Not Intractable
 ;;^UTILITY(U,$J,358.3,27552,1,4,0)
 ;;=4^G44.40
 ;;^UTILITY(U,$J,358.3,27552,2)
 ;;=^5003947
 ;;^UTILITY(U,$J,358.3,27553,0)
 ;;=G44.89^^132^1317^3
 ;;^UTILITY(U,$J,358.3,27553,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27553,1,3,0)
 ;;=3^Headache Syndrome NEC
 ;;^UTILITY(U,$J,358.3,27553,1,4,0)
 ;;=4^G44.89
 ;;^UTILITY(U,$J,358.3,27553,2)
 ;;=^5003954
 ;;^UTILITY(U,$J,358.3,27554,0)
 ;;=G44.84^^132^1317^7
 ;;^UTILITY(U,$J,358.3,27554,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27554,1,3,0)
 ;;=3^Primary Exertional Headache
 ;;^UTILITY(U,$J,358.3,27554,1,4,0)
 ;;=4^G44.84
 ;;^UTILITY(U,$J,358.3,27554,2)
 ;;=^336563
 ;;^UTILITY(U,$J,358.3,27555,0)
 ;;=G44.301^^132^1317^6
 ;;^UTILITY(U,$J,358.3,27555,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27555,1,3,0)
 ;;=3^Post-Traumatic Headache,Unspec,Intractable
 ;;^UTILITY(U,$J,358.3,27555,1,4,0)
 ;;=4^G44.301
 ;;^UTILITY(U,$J,358.3,27555,2)
 ;;=^5003941
 ;;^UTILITY(U,$J,358.3,27556,0)
 ;;=G44.209^^132^1317^8
 ;;^UTILITY(U,$J,358.3,27556,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27556,1,3,0)
 ;;=3^Tension-Type Headache,Unspec,Not Intractable
 ;;^UTILITY(U,$J,358.3,27556,1,4,0)
 ;;=4^G44.209
 ;;^UTILITY(U,$J,358.3,27556,2)
 ;;=^5003936
 ;;^UTILITY(U,$J,358.3,27557,0)
 ;;=I50.32^^132^1318^5
 ;;^UTILITY(U,$J,358.3,27557,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27557,1,3,0)
 ;;=3^Diastolic Heart Failure,Chronic
 ;;^UTILITY(U,$J,358.3,27557,1,4,0)
 ;;=4^I50.32
 ;;^UTILITY(U,$J,358.3,27557,2)
 ;;=^5007245
 ;;^UTILITY(U,$J,358.3,27558,0)
 ;;=I50.33^^132^1318^4
 ;;^UTILITY(U,$J,358.3,27558,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27558,1,3,0)
 ;;=3^Diastolic Heart Failure,Acute on Chronic
 ;;^UTILITY(U,$J,358.3,27558,1,4,0)
 ;;=4^I50.33
 ;;^UTILITY(U,$J,358.3,27558,2)
 ;;=^5007246
 ;;^UTILITY(U,$J,358.3,27559,0)
 ;;=I50.40^^132^1318^9
 ;;^UTILITY(U,$J,358.3,27559,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27559,1,3,0)
 ;;=3^Systolic & Diastolic Congestive Heart Failure,Combined Unspec
 ;;^UTILITY(U,$J,358.3,27559,1,4,0)
 ;;=4^I50.40
 ;;^UTILITY(U,$J,358.3,27559,2)
 ;;=^5007247
 ;;^UTILITY(U,$J,358.3,27560,0)
 ;;=I51.7^^132^1318^2
 ;;^UTILITY(U,$J,358.3,27560,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27560,1,3,0)
 ;;=3^Cardiomegaly
 ;;^UTILITY(U,$J,358.3,27560,1,4,0)
 ;;=4^I51.7
 ;;^UTILITY(U,$J,358.3,27560,2)
 ;;=^5007257
 ;;^UTILITY(U,$J,358.3,27561,0)
 ;;=I42.6^^132^1318^1
 ;;^UTILITY(U,$J,358.3,27561,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27561,1,3,0)
 ;;=3^Alcoholic Cardiomyopathy
 ;;^UTILITY(U,$J,358.3,27561,1,4,0)
 ;;=4^I42.6
