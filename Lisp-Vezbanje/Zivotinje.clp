(watch all)



(defrule pitanje-broj-nogu
    (declare (salience 100))
    => (printout t "Unesite broj nogu ")(assert (noge (read)))
    )





(defrule pitanje-leti
    (declare (salience 99))
    => (printout t "Da li leti? (da/ne) ")(assert (leti (read)))
    )

(defrule pitanje-pliva
    (declare (salience 98))
    => (printout t "Da li pliva? (da/ne)")(assert (pliva (read)))
    )

(defrule pitanje-tezina
    (declare (salience 97))
    => (printout t "Koliko je teska (kg)?")(assert (tezina (read)))
    )

;(defrule pitanje-porodica
  ;  (declare (salience 96))
  ;  => (printout t "Kojoj porodici pripada zivotinja(macka/konj/ptica/gmizavac)?")
 ;   (assert (porodica (read)))
  ;  )
(defrule pitanje-krzno
    (declare (salience 96))
    (not (porodica ptica))
    (not (porodica konj))
    (not (porodica gmizavac))
    =>(printout t "Da li zivotinja ima krzno?(da/ne) ")
    (assert(krzno (read))
    ))
(defrule pitanje-kljun
    (declare (salience 95))
    (not (porodica macka))
    (not (porodica konj))
    (not (porodica gmizavac))
    =>(printout t "Da li zivotinja ima kljun?(da/ne) ")
    (assert(kljun (read))
    ))
(defrule pitanje-kopito
    (declare (salience 94))
    (not (porodica macka))
    (not (porodica ptica))
    (not (porodica gmizavac))
    =>(printout t "Da li zivotinja ima kopita?(da/ne) ")
    (assert(kopito (read))
    ))
    
(defrule porodica-macka
    (declare (salience 96))
    (krzno da)=> (assert(porodica macka))    
    )
(defrule porodica-ptica
    (declare (salience 96))
    (kljun da)=> (assert(porodica ptica))    
    )
(defrule porodica-konj
    (declare (salience 96))
    (kopito da)=> (assert(porodica konj))    
    )
(defrule porodica-gmizavac
    (kopito ne)(kljun ne)(krzno ne) => (assert (porodica gmizavac))
    
    )
(defrule pitanje-crna
    (declare (salience 93))
    => (printout t "Da li zivotinja ima crnu boju na sebi? (da/ne)")
    (assert (boja crna (read)))
    )

(defrule pitanje-bela
    (declare (salience 92))
    => (printout t "Da li zivotinja ima belu boju na sebi? (da/ne)")
    (assert (boja bela (read)))
    )

(defrule pitanje-zuta
    (declare (salience 91))
    => (printout t "Da li zivotinja ima zutu boju na sebi? (da/ne)")
    (assert (boja zuta(read)))
    )

(defrule pitanje-braon
    (declare (salience 90))
    => (printout t "Da li zivotinja ima braon boju na sebi? (da/ne)")
    (assert (boja braon (read)))
    )

(defrule pitanje-zelena
    (declare (salience 89))
    => (printout t "Da li zivotinja ima zelenu boju na sebi? (da/ne)")
    (assert (boja zelena(read)))
    )

(defrule pitanje-tackice
    (declare (salience 88))
    => (printout t "Da li zivotinja ima tackice? (da/ne) ")
    (assert (izgled tackice(read)))
    )

(defrule pitanje-pruge
    (declare (salience 87))
    => (printout t "Da li zivotinja ima pruge? (da/ne) ")
    (assert (izgled pruge(read)))
    )

(defrule gepard
    (noge 4)
    (leti ne)
    (pliva ne)
    (tezina ?kg & :(and (>= ?kg 28) (<= ?kg 65)))
    (porodica macka)
    (boja crna da) (boja bela da) (boja zuta da)
    (izgled tackice da)(izgled pruge ne)
    =>
    (assert (prepoznat gepard))
    )

(defrule tigar
    (noge 4)
    (leti ne)
    (pliva da)
    (tezina ?kg & :(and (>= ?kg 300) (<= ?kg 365)))
    (porodica macka)
    (boja crna da) (boja bela da) (boja zuta da)
    (izgled tackice ne)(izgled pruge da)
    =>
    (assert (prepoznat tigar))
    )

(defrule zebra
    (noge 4)
    (leti ne)
    (pliva ne)
    (tezina ?kg & :(and (>= ?kg 200) (<= ?kg 450)))
    (porodica konj)
    (boja crna da) (boja bela da) (boja zuta ne)(boja braon ne) (boja zelena ne)
    (izgled tackice ne)(izgled pruge da)
    =>
    (assert (prepoznat zebra))
    )

(defrule noj
    (noge 2)
    (leti ne)
    (pliva ne)
    (tezina ?kg & :(and (>= ?kg 63) (<= ?kg 145)))
    (porodica ptica)
    (boja crna da) (boja bela da) (boja zuta ne)
    (izgled tackice ne)(izgled pruge ne)
    =>
    (assert (prepoznat noj))
    )

(defrule pingvin
    (noge 2)
    (leti ne)
    (pliva da)
    (tezina ?kg & :(and (>= ?kg 5) (<= ?kg 7)))
    (porodica ptica)
    (boja crna da) (boja bela da) (boja zuta ne)(boja braon ne)(boja zelena ne)
    (izgled tackice ne)(izgled pruge ne)
    =>
    (assert (prepoznat pingvin))
    )

(defrule orao
    (noge 2)
    (leti da)
    (pliva ne)
    (tezina ?kg & :(and (>= ?kg 2.4) (<= ?kg 4.1)))
    (porodica ptica)
    (boja crna ne) (boja bela ne) (boja zuta ne)(boja braon da)(boja zelena ne)
    (izgled tackice ne)(izgled pruge ne)
    =>
    (assert (prepoznat orao))
    )

(defrule zmija
    (noge 0)
    (leti ne)
    (pliva da)
    (tezina ?kg & :(and (>= ?kg 5.5) (<= ?kg 20)))
    (porodica gmizavac)
    (boja crna ne) (boja bela ne) (boja zuta ne)
    (or
        (and(boja braon ne)(boja zelena da))
        (and(boja braon da)(boja zelena ne))
        )
    (izgled tackice ne)(izgled pruge da)
    =>
    (assert (prepoznat zmija))
    )


    

(defrule ispis-prepoznat
    (prepoznat ?zivotinja)=>
    (printout t "Prepoznata je zivotinja: "?zivotinja crlf)
    )

(defrule nije-prepoznat
    (declare (salience -100))
    (not (prepoznat ?)) => (printout t "Nije pronadjena zivotinja!" crlf)
    )



(reset)
(run)
