(define (domain generator)
    (:requirements :fluents :durative-actions :adl :typing )

    (:types
        generator tank
    )

    (:predicates
        (generator-ran)
        (available ?t - tank)
        (using ?t - tank ?g - generator)
        (safe ?g - generator)
    )

    (:functions
        (fuelLevel ?g - generator)
        (capacity ?g - generator)
        (fuelIntank ?t - tank)
        (target ?g - generator)
    )

    (:durative-action generate
        :parameters (?g - generator)
        :duration (= ?duration (target ?g))
        :condition (and (over all (>= (fuelLevel ?g) 0)) (over all (safe ?g))
        
        )
        :effect (and
            (decrease (fuelLevel ?g) (* #t 1))
            (at end (generator-ran)))
    )

    (:action refuel
        :parameters (?g - generator ?t - tank)
        :precondition (and (not (using ?t ?g)) (available ?t))
        :effect (and (using ?t ?g) (not (available ?t)))
    )

    (:process refuelling
        :parameters (?g - generator ?t - tank)
        :precondition (and (using ?t ?g))
        :effect (and
            (increase (fuelLevel ?g) (* #t 2))
            (decrease (fuelIntank ?t) (* #t 2)))
    )

    (:event tankEmpty
        :parameters (?g - generator ?t -tank)
        :precondition (and (using ?t ?g) (<= (fuelInTank ?t) 0))
        :effect (and (not (using ?t ?g)))
    )

    (:event generatorOverflow
        :parameters (?g - generator)
        :precondition (and (> (fuelLevel ?g) (capacity ?g)) (safe ?g))
        :effect (and (not (safe ?g)))
    )
)