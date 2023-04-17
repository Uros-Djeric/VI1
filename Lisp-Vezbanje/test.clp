(watch all)
(reset)


(deftemplate nov-auto "template za nov auto"
    
    (slot model)
    (slot cena)
    (slot garancija)
    )


(deftemplate polovan-auto "template za polovan auto"
    
    (slot model)
    (slot cena)
    (slot kilometraza)
    )

(defrule pogodan-novi-auto (nov-auto (model ?m)(cena ?c&:(< ?c 20000))
        (garancija ?g&:(>= ?g 3)))=>(assert (pogodan-auto ?m nov)))

(defrule pogodan-polovan-auto
    (polovan-auto (model ?m)(cena ?c&:(< ?c 10000))
        (kilometraza ?k&:(< ?k 100000)))
    =>(assert(pogodan-auto ?m polovan)))

(defrule ispis (pogodan-auto ?m ?starost ) => (printout t "Prodadjen je pogodan auto: " ?m" i on je : " ?starost crlf)
    )

(assert (polovan-auto (model Yugo)(cena 1000)(kilometraza 250000)))
(assert (polovan-auto (model Punto)(cena 2500)(kilometraza 80000)))
(assert (polovan-auto (model Astra)(cena 12500)(kilometraza 45000)))

(assert (nov-auto (model "Fiat Tipo")(cena 15999)(garancija 5)))
(assert (nov-auto (model "Nissan Qashqai")(cena 25000)(garancija 5)))
(assert (nov-auto (model "Lada Niva")(cena 12399)(garancija 2)))

(defrule unos-polovnog (korisnik-unosi polovan)
    =>(printout t "Unesite polovan auto redom model, cena, kilometraza" crlf)(assert (polovan-auto (model (read))(cena (read))(kilometraza (read)))))

(defrule unos-novog (korisnik-unosi nov)
    =>(printout t "Unesite nov auto redom model, cena, kilometraza" crlf)(assert (nov-auto (model (read))(cena (read))(garancija (read)))))

(defrule koji-unosim
    =>(printout t "Da li unosite nov ili polovan auto?" crlf)(assert (korisnik-unosi (read)))
    )

(run)
