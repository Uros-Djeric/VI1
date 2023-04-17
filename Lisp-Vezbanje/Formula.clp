(watch all)

(defrule pitanje-tim
    (declare (salience 100))
    =>(printout t "Kom timu pripada vozac? U opticaju su Mercedes, Ferrari, "
        "McLaren, Red Bull: ")(assert (tim(read)))
    )


(defrule pitanje-drzava
    (declare (salience 95))
    =>(printout t "Iz koje je drzave vozac? U opticaju su Engleska, Nemacka, "
        "Finska, Spanija, Australija: ")(assert(drzava(read)))
    )

(defrule pitanje-brTrka
    (declare (salience 90))
    =>(printout t "U koliko je trka ucestvovao vozac? ")(assert(brTrka(read)))
    )



(defrule pitanje-podijumi
    (declare (salience 85))
    =>(printout t "Koliko je podijuma osvojio vozac? ")(assert(podijum(read)))
    )

(defrule pitanje-datum
    (declare (salience 80))
    =>(printout t "Kada se vozac rodio?(Postujuci format 1.januar 1999.) ")
    (assert(datumR(read)))
    )

(defrule id
    (declare(salience 75))
    =>(printout t "Koji je broj na automobilu vozaca u pitanju? ")
    (assert(id(read)))
    )

(defrule Lewis-Hamilton
    (tim MERCEDES)
    (drzava ENGLESKA)
    (brTrka 210)
    (podijum 119)
    (datumR 7.januar)
    (id 44)
    => (assert(vozac LewisHamilton))(assert(brTrka 210))(assert(podijum 119))
    )
(defrule Sebastian-Vettel
    (tim FERRARI)
    (drzava NEMACKA)
    (brTrka 201)
    (podijum 101)
    (datumR 3.jul)
    (id 5)
    => (assert(vozac Sebastian-Vettel))(assert(brTrka 201))(assert(podijum 101))
    )
(defrule Valtteri-Botas
    (tim REDBULL)
    (drzava FINSKA)
    (brTrka 100)
    (podijum 23)
    (datumR 28.avgust)
    (id 77)
    => (assert(vozac Valtteri-Botas))(assert(brTrka 100))(assert(podijum 23))
    )




(defrule pronadjen
    (vozac ?name)
    (brTrka ?tr)
    (podijum ?p)
    
    =>(printout t "Pronadjen vozac: "?name " koji je ucestvovao u: "?tr " trka i"
        " od kojih je osvojio: "?p "trka" crlf)
    (printout t "Procenat podijuma je: ")
    (format t "%.2f"(* 100(/ ?p ?tr)))
    (printout t "%"crlf)
    )
(defrule nije-pronadjen
    (declare (salience -100))
    (not (vozac ?))=>(printout t "Vozac nije pronadjen!")
    )

(reset)
(run)
