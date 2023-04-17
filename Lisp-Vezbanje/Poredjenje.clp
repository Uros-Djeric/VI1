(defrule gepard
 (noge 4)
 (letac ne)
 (plivac ne)
 (tezina ?t & :(and (>= ?t 28) (<= ?t 65)))
 (porodica macka)
 (boja crna da) (boja bela da) (boja zuta da)
 (tackice-pruge tackice)
 =>
 (assert (prepoznat gepard))
 )

(defrule gepard
    (noge 4)
    (leti ne)
    (pliva ne)
    (tezina ?kg & : (and ( >= ?kg 28 )( <= ?kg 65 )))
    (porodica macka)
    (boja crna da)(boja bela da)(boja zuta da)
    (boja braon ne)(boja zelena ne)
    (izgled tackice da)(izgled pruge ne)
    => (assert(prepoznat gepard))
    
    )