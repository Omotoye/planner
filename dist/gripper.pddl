; A robot with two grippers can move around a set of rooms and collect objects
; Some objects are heavy and some are light
; heavy objects require the robot to use both grippers.
; light objects can be carried using only one gripper
; the robot can carry only one heavy object or two light objects
; the rooms are numbered from 1 to n 
; the rooms are connected with a corridor
; the robot can move back and forth to any room through the corridor
; a room may contain object or be empty.
; the robot must be in a rooom to collect an object in it
; the object must be dropped in the room to be considered there

; formalize action to move from one room to another
; and collect or drop objects

; ********** Problem ***************
; there are four rooms
; the robot is initially in room one
; there are two objects (one light and one heavy) located in room2
; there are two objects (one light and one heavy) located in room3

; ********** Goal ****************
; Carry all the objects to room4 

; OBJECTS: 
; * robot ->(gripper->(left, right))
; * location ->(room , corridor)
; * object ->(heavy, light)

; PROPERTIES:
; * object: 
; * can be pick
; * can be dropped 
; * can be at room

;Header and description

(define (domain gripper)

    ;remove requirements that are not needed
    (:requirements :strips :typing :negative-preconditions)

    (:types
        location object gripper - objects
        left right - gripper
        room corridor - location
        heavy light - object
    )

    (:predicates
        (carry-light ?g - gripper ?object - light)
        (carry-heavy ?g1 - left ?g2 - right ?object - heavy)
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

    (:action pick-right
        :parameters (?g - right ?obj - light ?r - room)
        :precondition (and (at-robby ?r) (at-room ?obj ?r) (gripper-empty ?g))
        :effect (and (not (gripper-empty ?g)) (carry-light ?g ?obj))
    )

    (:action move-to-corridor
        :parameters (?r - room ?c - corridor)
        :precondition (and (at-robby ?r) (not (at-corridor ?c)))
        :effect (and (at-corridor ?c) (not (at-robby ?r)))
    )

    (:action drop-light
        :parameters (?g - gripper ?r - room ?obj - light)
        :precondition (and (carry-light ?g ?obj) (at-robby ?r))
        :effect (and (not (carry-light ?g ?obj)) (at-room ?obj ?r) (gripper-empty ?g))
    )

    (:action pick-left
        :parameters (?g - left ?obj - light ?r - room)
        :precondition (and (at-robby ?r) (at-room ?obj ?r) (gripper-empty ?g))
        :effect (and (not (gripper-empty ?g)) (carry-light ?g ?obj))
    )

    (:action pick-heavy
        :parameters (?g1 - left ?g2 - right ?obj - heavy ?r - room)
        :precondition (and (at-robby ?r) (at-room ?obj ?r) (gripper-empty ?g1) (gripper-empty ?g2))
        :effect (and (not (gripper-empty ?g1)) (not (gripper-empty ?g2)) (carry-heavy ?g1 ?g2 ?obj))
    )

    (:action drop-heavy
        :parameters (?g1 - left ?g2 - right ?r - room ?obj - heavy)
        :precondition (and (carry-heavy ?g1 ?g2 ?obj) (at-robby ?r))
        :effect (and (not (carry-heavy ?g1 ?g2 ?obj)) (at-room ?obj ?r) (gripper-empty ?g1) (gripper-empty ?g2))
    )

)