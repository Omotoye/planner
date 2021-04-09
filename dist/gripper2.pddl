(define (domain gripper2)

    (:requirements :strips :typing :negative-preconditions)

    (:types
        location object gripper - objects
        room corridor - location
        heavy light - object
        left right - gripper
    )

    (:predicates
        (carry-light ?g - gripper ?object - light)
        (carry-heavy ?g1 ?g2 - gripper ?object - heavy)
        (gripper-empty ?g - gripper)
        (at-robby ?l - room)
        (at-corridor ?l - corridor)
        (at-room ?obj - object ?l - room)
    )

    (:action move-to-room
        :parameters (?c - corridor ?r - room)
        :precondition (and (at-corridor ?c) (not (at-robby ?r)))
        :effect (and (at-robby ?r) (not (at-corridor ?c)))
    )

    (:action move-to-corridor
        :parameters (?r - room ?c - corridor)
        :precondition (and (at-robby ?r) (not (at-corridor ?c)))
        :effect (and (at-corridor ?c) (not (at-robby ?r)))
    )

    (:action pick-light
        :parameters (?g - gripper ?obj - light ?r - room)
        :precondition (and (at-robby ?r) (at-room ?obj ?r) (gripper-empty ?g))
        :effect (and (not (gripper-empty ?g)) (carry-light ?g ?obj))
    )

    (:action drop-light
        :parameters (?g - gripper ?r - room ?obj - light)
        :precondition (and (carry-light ?g ?obj) (at-robby ?r))
        :effect (and (not (carry-light ?g ?obj)) (at-room ?obj ?r) (gripper-empty ?g))
    )

    (:action pick-heavy
        :parameters (?g1 - right ?g2 - left ?obj - heavy ?r - room)
        :precondition (and (at-robby ?r) (at-room ?obj ?r) (gripper-empty ?g1) (gripper-empty ?g2))
        :effect (and (not (gripper-empty ?g1)) (not (gripper-empty ?g2)) (carry-heavy ?g1 ?g2 ?obj))
    )

    (:action drop-heavy
        :parameters (?g1 - right ?g2 - left ?r - room ?obj - heavy)
        :precondition (and (carry-heavy ?g1 ?g2 ?obj) (at-robby ?r))
        :effect (and (not (carry-heavy ?g1 ?g2 ?obj)) (at-room ?obj ?r) (gripper-empty ?g1) (gripper-empty ?g2))
    )

)