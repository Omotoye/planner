(define (problem run-generator)
    (:domain generator)
    (:objects
        gen - generator
        tank1 tank2 - tank
    )
    (:init
        (= (target gen) 100)
        (= (fuelLevel gen) 60)
        (= (capacity gen) 60)
        (= (fuelInTank tank1) 25)
        (= (fuelInTank tank2) 15)
        (available tank1)
        (available tank2)
        (safe gen)
    )

    (:goal
        (generator-ran)
    )
)