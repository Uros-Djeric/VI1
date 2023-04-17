(watch all)


(defrule broj-nogu
    (declare (salience 100))
    =>(printout t "Koliko zivotinja ima nogu?" )(assert(noge(read)))
    )

(defrule pitanje-leti
    (declare (salience 95))
    =>(printout t "Da li zivotinja leti? (da/ne)" )(assert(leti(read)))
    )

(defrule pitanje-pliva
    (declare (salience 90))
    =>(printout t "Da li zivotinja pliva? (da/ne)" )(assert(pliva(read)))
    )

(defrule pitanje-tezina
    (declare (salience 85))
    =>(printout t "Koliko kilograma ima zivotinja?" )(assert(tezina(read)))
    )


(defrule pitanje-krzno
    (declare (salience 84))
    (not (porodica ptica))(not (porodica gmizavac))(not (porodica konj))
    =>(printout t "Da li zivotinja ima krzno?(da/ne)")(assert(krzno (read)))
    )
(defrule pitanje-kljun
    (declare (salience 83))
    (not (porodica macka))(not (porodica gmizavac))(not (porodica konj))
    =>(printout t "Da li zivotinja ima kljun?(da/ne)")(assert(krzno (read)))
    )
(defrule pitanje-kopito
    (declare (salience 82))
    (not (porodica ptica))(not (porodica gmizavac))(not (porodica macka))
    =>(printout t "Da li zivotinja ima kopita?(da/ne)")(assert(krzno (read)))
    )


(defrule porodica-macka
    (declare (salience 81))
    (krzno da)=>(assert(porodica macka))
    )
(defrule porodica-konj
    (declare (salience 80))
    (kopito da)=>(assert(porodica konj))
    )
(defrule porodica-ptica
    (declare (salience 79))
    (kljun da)=>(assert(porodica ptica))
    )
(defrule porodica-gmizavac
    (declare (salience 78))
    (krzno ne)(kljun ne)(kopito ne)=>(assert(porodica gmizavac))
    )
;(defrule pitanje-porodica
;    (declare (salience 80))
;    =>(printout t "Kojoj porodici zivotinja pripada?(macka,konj,ptica,gmizavac)")
;    (assert(porodica(read)))
;    )



;-------------------------- Boje pocetak ----------------------------------------;
(defrule pitanje-crna
    (declare (salience 75))
    =>(printout t "Da li zivotinja ima crnu boju na sebi?(da/ne)")
    (assert(boja crna(read)))
    )
(defrule pitanje-bela
    (declare (salience 70))
    =>(printout t "Da li zivotinja ima belu boju na sebi?(da/ne)")
    (assert(boja bela(read)))
    )

(defrule pitanje-zuta
    (declare (salience 65))
    =>(printout t "Da li zivotinja ima zutu boju na sebi?(da/ne)")
    (assert(boja zuta(read)))
    )
(defrule pitanje-braon
    (declare (salience 60))
    =>(printout t "Da li zivotinja ima braon boju na sebi?(da/ne)")
    (assert(boja braon(read)))
    )
(defrule pitanje-zelena
    (declare (salience 55))
    =>(printout t "Da li zivotinja ima zelenu boju na sebi?(da/ne)")
    (assert(boja zelena(read)))
    )
;-------------------------- Boje kraj ----------------------------------------;

(defrule pitanje-pruge
    (declare (salience 50))
    =>(printout t "Da li zivotinja ima pruge na sebi?(da/ne)")
    (assert(izgled pruge(read)))
    )
(defrule pitanje-tackice
    (declare (salience 45))
    =>(printout t "Da li zivotinja ima tackice na sebi?(da/ne)")
    (assert(izgled tackice(read)))
    )

(defrule gepard
    (noge 4)
    (leti ne)
    (pliva ne)
    (tezina ?kg&:(and(>= ?kg 28)(<= ?kg 65)))
    (porodica macka)
    (boja crna da)(boja bela da)(boja zuta da)(boja braon ne)(boja zelena ne)
    (izgled pruge ne)(izgled tackice da)
    =>(assert(prepoznat gepard))
    )

(defrule noj
    (noge 2)
    (leti ne)
    (pliva ne)
    (tezina ?kg&:(and(>= ?kg 63)(<= ?kg 145)))
    (porodica ptica)
    (boja crna da)(boja bela da)(boja zuta ne)(boja braon ne)(boja zelena ne)
    (izgled pruge ne)(izgled tackice da)
    =>(assert(prepoznat noj))
    )

(defrule zebra
    (noge 4)
    (leti ne)
    (pliva ne)
    (tezina ?kg&:(and(>= ?kg 200)(<= ?kg 450)))
    (porodica konj)
    (boja crna da)(boja bela da)(boja zuta ne)(boja braon ne)(boja zelena ne)
    (izgled pruge da)(izgled tackice ne) => (assert(prepoznat zebra))
    )

(defrule zmija
    (noge 0)
    (leti ne)
    (pliva da)
    (tezina ?kg&:(and(>= ?kg 5.5)(<= ?kg 20)))
    (boja crna ne)(boja bela ne)(boja zuta ne)
    (or
        (and(boja braon ne)(boja zelena da))
        (and(boja braon da)(boja zelena ne))
    )
    (izgled pruge da)(izgled tackice ne)
   	=>(assert(prepoznat zmija))
    )


(defrule nije-prepoznata
    (declare (salience -100))
    (not (prepoznat ?))=>(printout t "Zivotinja nije prepoznata!" crlf)
    )
(defrule ispis-prepoznate
    (prepoznat ?zivotinja)=>
    (printout t "Prepoznata je zivotinja: "?zivotinja crlf)
    )


(reset)
(run)
