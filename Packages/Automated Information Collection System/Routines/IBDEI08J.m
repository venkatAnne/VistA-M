IBDEI08J ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,3440,1,3,0)
 ;;=3^Retinal Detachment w/ Retinal Break Left Eye,Unspec
 ;;^UTILITY(U,$J,358.3,3440,1,4,0)
 ;;=4^H33.002
 ;;^UTILITY(U,$J,358.3,3440,2)
 ;;=^5005491
 ;;^UTILITY(U,$J,358.3,3441,0)
 ;;=H33.003^^28^253^35
 ;;^UTILITY(U,$J,358.3,3441,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3441,1,3,0)
 ;;=3^Retinal Detachment w/ Retinal Break Bilateral,Unspec
 ;;^UTILITY(U,$J,358.3,3441,1,4,0)
 ;;=4^H33.003
 ;;^UTILITY(U,$J,358.3,3441,2)
 ;;=^5005492
 ;;^UTILITY(U,$J,358.3,3442,0)
 ;;=H53.9^^28^253^38
 ;;^UTILITY(U,$J,358.3,3442,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3442,1,3,0)
 ;;=3^Visual Disturbance,Unspec
 ;;^UTILITY(U,$J,358.3,3442,1,4,0)
 ;;=4^H53.9
 ;;^UTILITY(U,$J,358.3,3442,2)
 ;;=^124001
 ;;^UTILITY(U,$J,358.3,3443,0)
 ;;=H54.62^^28^253^40
 ;;^UTILITY(U,$J,358.3,3443,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3443,1,3,0)
 ;;=3^Visual Loss Lt Eye,Normal Vision Rt Eye
 ;;^UTILITY(U,$J,358.3,3443,1,4,0)
 ;;=4^H54.62
 ;;^UTILITY(U,$J,358.3,3443,2)
 ;;=^5133520
 ;;^UTILITY(U,$J,358.3,3444,0)
 ;;=H54.61^^28^253^41
 ;;^UTILITY(U,$J,358.3,3444,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3444,1,3,0)
 ;;=3^Visual Loss Rt Eye,Normal Vision Lt Eye
 ;;^UTILITY(U,$J,358.3,3444,1,4,0)
 ;;=4^H54.61
 ;;^UTILITY(U,$J,358.3,3444,2)
 ;;=^5006367
 ;;^UTILITY(U,$J,358.3,3445,0)
 ;;=H54.3^^28^253^39
 ;;^UTILITY(U,$J,358.3,3445,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3445,1,3,0)
 ;;=3^Visual Loss Both Eyes,Unqualified
 ;;^UTILITY(U,$J,358.3,3445,1,4,0)
 ;;=4^H54.3
 ;;^UTILITY(U,$J,358.3,3445,2)
 ;;=^268886
 ;;^UTILITY(U,$J,358.3,3446,0)
 ;;=W10.9XXA^^28^254^22
 ;;^UTILITY(U,$J,358.3,3446,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3446,1,3,0)
 ;;=3^Fall,Stairs/Steps,Init Encntr,Unspec
 ;;^UTILITY(U,$J,358.3,3446,1,4,0)
 ;;=4^W10.9XXA
 ;;^UTILITY(U,$J,358.3,3446,2)
 ;;=^5059592
 ;;^UTILITY(U,$J,358.3,3447,0)
 ;;=W10.0XXA^^28^254^19
 ;;^UTILITY(U,$J,358.3,3447,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3447,1,3,0)
 ;;=3^Fall,Escalator,Init Encntr
 ;;^UTILITY(U,$J,358.3,3447,1,4,0)
 ;;=4^W10.0XXA
 ;;^UTILITY(U,$J,358.3,3447,2)
 ;;=^5059580
 ;;^UTILITY(U,$J,358.3,3448,0)
 ;;=W10.2XXA^^28^254^20
 ;;^UTILITY(U,$J,358.3,3448,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3448,1,3,0)
 ;;=3^Fall,Incline,Init Encntr
 ;;^UTILITY(U,$J,358.3,3448,1,4,0)
 ;;=4^W10.2XXA
 ;;^UTILITY(U,$J,358.3,3448,2)
 ;;=^5059586
 ;;^UTILITY(U,$J,358.3,3449,0)
 ;;=W10.1XXA^^28^254^21
 ;;^UTILITY(U,$J,358.3,3449,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3449,1,3,0)
 ;;=3^Fall,Sidewalk/Curb,Init Encntr
 ;;^UTILITY(U,$J,358.3,3449,1,4,0)
 ;;=4^W10.1XXA
 ;;^UTILITY(U,$J,358.3,3449,2)
 ;;=^5059583
 ;;^UTILITY(U,$J,358.3,3450,0)
 ;;=W06.XXXA^^28^254^7
 ;;^UTILITY(U,$J,358.3,3450,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3450,1,3,0)
 ;;=3^Fall from Bed,Init Encntr
 ;;^UTILITY(U,$J,358.3,3450,1,4,0)
 ;;=4^W06.XXXA
 ;;^UTILITY(U,$J,358.3,3450,2)
 ;;=^5059559
 ;;^UTILITY(U,$J,358.3,3451,0)
 ;;=W07.XXXA^^28^254^8
 ;;^UTILITY(U,$J,358.3,3451,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3451,1,3,0)
 ;;=3^Fall from Chair,Init Encntr
 ;;^UTILITY(U,$J,358.3,3451,1,4,0)
 ;;=4^W07.XXXA
 ;;^UTILITY(U,$J,358.3,3451,2)
 ;;=^5059562
 ;;^UTILITY(U,$J,358.3,3452,0)
 ;;=W05.2XXA^^28^254^11
 ;;^UTILITY(U,$J,358.3,3452,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3452,1,3,0)
 ;;=3^Fall from Non-Moving Motorized Scooter,Init Encntr
 ;;^UTILITY(U,$J,358.3,3452,1,4,0)
 ;;=4^W05.2XXA
 ;;^UTILITY(U,$J,358.3,3452,2)
 ;;=^5059556
 ;;^UTILITY(U,$J,358.3,3453,0)
 ;;=W05.1XXA^^28^254^12
 ;;^UTILITY(U,$J,358.3,3453,1,0)
 ;;=^358.31IA^4^2
