IBDEI36B ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,53283,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53283,1,3,0)
 ;;=3^Polyneuropathy, unspecified
 ;;^UTILITY(U,$J,358.3,53283,1,4,0)
 ;;=4^G62.9
 ;;^UTILITY(U,$J,358.3,53283,2)
 ;;=^5004079
 ;;^UTILITY(U,$J,358.3,53284,0)
 ;;=G81.90^^245^2677^7
 ;;^UTILITY(U,$J,358.3,53284,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53284,1,3,0)
 ;;=3^Hemiplegia, unspecified 
 ;;^UTILITY(U,$J,358.3,53284,1,4,0)
 ;;=4^G81.90
 ;;^UTILITY(U,$J,358.3,53284,2)
 ;;=^5004120
 ;;^UTILITY(U,$J,358.3,53285,0)
 ;;=G81.91^^245^2677^6
 ;;^UTILITY(U,$J,358.3,53285,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53285,1,3,0)
 ;;=3^Hemiplegia, affecting right dominant side
 ;;^UTILITY(U,$J,358.3,53285,1,4,0)
 ;;=4^G81.91
 ;;^UTILITY(U,$J,358.3,53285,2)
 ;;=^5004121
 ;;^UTILITY(U,$J,358.3,53286,0)
 ;;=G81.92^^245^2677^5
 ;;^UTILITY(U,$J,358.3,53286,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53286,1,3,0)
 ;;=3^Hemiplegia, affecting left dominant side
 ;;^UTILITY(U,$J,358.3,53286,1,4,0)
 ;;=4^G81.92
 ;;^UTILITY(U,$J,358.3,53286,2)
 ;;=^5004122
 ;;^UTILITY(U,$J,358.3,53287,0)
 ;;=H26.9^^245^2678^1
 ;;^UTILITY(U,$J,358.3,53287,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53287,1,3,0)
 ;;=3^Cataract, unspec
 ;;^UTILITY(U,$J,358.3,53287,1,4,0)
 ;;=4^H26.9
 ;;^UTILITY(U,$J,358.3,53287,2)
 ;;=^5005363
 ;;^UTILITY(U,$J,358.3,53288,0)
 ;;=H40.9^^245^2678^2
 ;;^UTILITY(U,$J,358.3,53288,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53288,1,3,0)
 ;;=3^Glaucoma, unspec
 ;;^UTILITY(U,$J,358.3,53288,1,4,0)
 ;;=4^H40.9
 ;;^UTILITY(U,$J,358.3,53288,2)
 ;;=^5005931
 ;;^UTILITY(U,$J,358.3,53289,0)
 ;;=H54.7^^245^2678^6
 ;;^UTILITY(U,$J,358.3,53289,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53289,1,3,0)
 ;;=3^Visual loss, unspec
 ;;^UTILITY(U,$J,358.3,53289,1,4,0)
 ;;=4^H54.7
 ;;^UTILITY(U,$J,358.3,53289,2)
 ;;=^5006368
 ;;^UTILITY(U,$J,358.3,53290,0)
 ;;=H57.11^^245^2678^5
 ;;^UTILITY(U,$J,358.3,53290,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53290,1,3,0)
 ;;=3^Ocular pain, right eye
 ;;^UTILITY(U,$J,358.3,53290,1,4,0)
 ;;=4^H57.11
 ;;^UTILITY(U,$J,358.3,53290,2)
 ;;=^5006382
 ;;^UTILITY(U,$J,358.3,53291,0)
 ;;=H57.12^^245^2678^4
 ;;^UTILITY(U,$J,358.3,53291,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53291,1,3,0)
 ;;=3^Ocular pain, left eye
 ;;^UTILITY(U,$J,358.3,53291,1,4,0)
 ;;=4^H57.12
 ;;^UTILITY(U,$J,358.3,53291,2)
 ;;=^5006383
 ;;^UTILITY(U,$J,358.3,53292,0)
 ;;=H57.13^^245^2678^3
 ;;^UTILITY(U,$J,358.3,53292,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53292,1,3,0)
 ;;=3^Ocular pain, bilateral
 ;;^UTILITY(U,$J,358.3,53292,1,4,0)
 ;;=4^H57.13
 ;;^UTILITY(U,$J,358.3,53292,2)
 ;;=^5006384
 ;;^UTILITY(U,$J,358.3,53293,0)
 ;;=K21.9^^245^2679^10
 ;;^UTILITY(U,$J,358.3,53293,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53293,1,3,0)
 ;;=3^GERD w/o Esophagitis
 ;;^UTILITY(U,$J,358.3,53293,1,4,0)
 ;;=4^K21.9
 ;;^UTILITY(U,$J,358.3,53293,2)
 ;;=^5008505
 ;;^UTILITY(U,$J,358.3,53294,0)
 ;;=K29.70^^245^2679^13
 ;;^UTILITY(U,$J,358.3,53294,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53294,1,3,0)
 ;;=3^Gastritis w/o Bleeding,Unspec
 ;;^UTILITY(U,$J,358.3,53294,1,4,0)
 ;;=4^K29.70
 ;;^UTILITY(U,$J,358.3,53294,2)
 ;;=^5008552
 ;;^UTILITY(U,$J,358.3,53295,0)
 ;;=K52.9^^245^2679^14
 ;;^UTILITY(U,$J,358.3,53295,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53295,1,3,0)
 ;;=3^Gastroenteritis & Colitis Noninfective,Unspec
 ;;^UTILITY(U,$J,358.3,53295,1,4,0)
 ;;=4^K52.9
 ;;^UTILITY(U,$J,358.3,53295,2)
 ;;=^5008704
 ;;^UTILITY(U,$J,358.3,53296,0)
 ;;=K82.9^^245^2679^11
 ;;^UTILITY(U,$J,358.3,53296,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53296,1,3,0)
 ;;=3^Gallbladder Disease,Unspec
