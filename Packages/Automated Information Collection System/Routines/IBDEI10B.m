IBDEI10B ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,16745,2)
 ;;=^259106
 ;;^UTILITY(U,$J,358.3,16746,0)
 ;;=N41.1^^88^853^70
 ;;^UTILITY(U,$J,358.3,16746,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16746,1,3,0)
 ;;=3^Prostatitis,Chronic
 ;;^UTILITY(U,$J,358.3,16746,1,4,0)
 ;;=4^N41.1
 ;;^UTILITY(U,$J,358.3,16746,2)
 ;;=^186931
 ;;^UTILITY(U,$J,358.3,16747,0)
 ;;=N41.4^^88^853^71
 ;;^UTILITY(U,$J,358.3,16747,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16747,1,3,0)
 ;;=3^Prostatitis,Granulomatous
 ;;^UTILITY(U,$J,358.3,16747,1,4,0)
 ;;=4^N41.4
 ;;^UTILITY(U,$J,358.3,16747,2)
 ;;=^52938
 ;;^UTILITY(U,$J,358.3,16748,0)
 ;;=N41.3^^88^853^72
 ;;^UTILITY(U,$J,358.3,16748,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16748,1,3,0)
 ;;=3^Prostatocystitis
 ;;^UTILITY(U,$J,358.3,16748,1,4,0)
 ;;=4^N41.3
 ;;^UTILITY(U,$J,358.3,16748,2)
 ;;=^270418
 ;;^UTILITY(U,$J,358.3,16749,0)
 ;;=N70.93^^88^853^73
 ;;^UTILITY(U,$J,358.3,16749,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16749,1,3,0)
 ;;=3^Salpingitis & Oophoritis,Unspec
 ;;^UTILITY(U,$J,358.3,16749,1,4,0)
 ;;=4^N70.93
 ;;^UTILITY(U,$J,358.3,16749,2)
 ;;=^5015808
 ;;^UTILITY(U,$J,358.3,16750,0)
 ;;=R39.16^^88^853^77
 ;;^UTILITY(U,$J,358.3,16750,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16750,1,3,0)
 ;;=3^Straining to Void
 ;;^UTILITY(U,$J,358.3,16750,1,4,0)
 ;;=4^R39.16
 ;;^UTILITY(U,$J,358.3,16750,2)
 ;;=^5019346
 ;;^UTILITY(U,$J,358.3,16751,0)
 ;;=N53.9^^88^853^74
 ;;^UTILITY(U,$J,358.3,16751,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16751,1,3,0)
 ;;=3^Sexual Dysfunction,Male,Unspec
 ;;^UTILITY(U,$J,358.3,16751,1,4,0)
 ;;=4^N53.9
 ;;^UTILITY(U,$J,358.3,16751,2)
 ;;=^5015769
 ;;^UTILITY(U,$J,358.3,16752,0)
 ;;=R37.^^88^853^75
 ;;^UTILITY(U,$J,358.3,16752,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16752,1,3,0)
 ;;=3^Sexual Dysfunction,Unspec
 ;;^UTILITY(U,$J,358.3,16752,1,4,0)
 ;;=4^R37.
 ;;^UTILITY(U,$J,358.3,16752,2)
 ;;=^5019339
 ;;^UTILITY(U,$J,358.3,16753,0)
 ;;=N43.40^^88^853^76
 ;;^UTILITY(U,$J,358.3,16753,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16753,1,3,0)
 ;;=3^Spermatocele of Epididymis,Unspec
 ;;^UTILITY(U,$J,358.3,16753,1,4,0)
 ;;=4^N43.40
 ;;^UTILITY(U,$J,358.3,16753,2)
 ;;=^5015701
 ;;^UTILITY(U,$J,358.3,16754,0)
 ;;=N44.8^^88^853^78
 ;;^UTILITY(U,$J,358.3,16754,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16754,1,3,0)
 ;;=3^Testis Noninflammatory Disorder,Other
 ;;^UTILITY(U,$J,358.3,16754,1,4,0)
 ;;=4^N44.8
 ;;^UTILITY(U,$J,358.3,16754,2)
 ;;=^5015706
 ;;^UTILITY(U,$J,358.3,16755,0)
 ;;=N44.00^^88^853^79
 ;;^UTILITY(U,$J,358.3,16755,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16755,1,3,0)
 ;;=3^Torsion of Testis,Unspec
 ;;^UTILITY(U,$J,358.3,16755,1,4,0)
 ;;=4^N44.00
 ;;^UTILITY(U,$J,358.3,16755,2)
 ;;=^334199
 ;;^UTILITY(U,$J,358.3,16756,0)
 ;;=R36.9^^88^853^82
 ;;^UTILITY(U,$J,358.3,16756,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16756,1,3,0)
 ;;=3^Urethral Discharge,Unspec
 ;;^UTILITY(U,$J,358.3,16756,1,4,0)
 ;;=4^R36.9
 ;;^UTILITY(U,$J,358.3,16756,2)
 ;;=^5019338
 ;;^UTILITY(U,$J,358.3,16757,0)
 ;;=N36.9^^88^853^83
 ;;^UTILITY(U,$J,358.3,16757,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16757,1,3,0)
 ;;=3^Urethral Disorder,Unspec
 ;;^UTILITY(U,$J,358.3,16757,1,4,0)
 ;;=4^N36.9
 ;;^UTILITY(U,$J,358.3,16757,2)
 ;;=^5015677
 ;;^UTILITY(U,$J,358.3,16758,0)
 ;;=N35.9^^88^853^84
 ;;^UTILITY(U,$J,358.3,16758,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16758,1,3,0)
 ;;=3^Urethral Stricture,Unspec
 ;;^UTILITY(U,$J,358.3,16758,1,4,0)
 ;;=4^N35.9
 ;;^UTILITY(U,$J,358.3,16758,2)
 ;;=^5015671
 ;;^UTILITY(U,$J,358.3,16759,0)
 ;;=N34.1^^88^853^86
 ;;^UTILITY(U,$J,358.3,16759,1,0)
 ;;=^358.31IA^4^2
