
; ********** Problem ***************
; there are four rooms
; the robot is initially in room one
; there are two objects (one light and one heavy) located in room2
; there are two objects (one light and one heavy) located in room3

; ********** Goal ****************
; Carry all the objects to room4 

(define (problem gripper-prob)
    (:domain gripper)
    (:objects
        room1 room2 room3 room4 - room
        corridor - corridor
        heavy1 heavy2 - heavy
        light1 light2 - light
        right - right
        left - left
    )

    (:init
        (at-robby room1)
        (gripper-empty right)
        (at-room light1 room2)
        (at-room light2 room3)
        (at-room heavy2 room3)
        (at-room heavy1 room2)
        (gripper-empty left)
    )

    (:goal
        (and
            (at-room heavy1 room4)
            (at-room light1 room4)
            (at-room heavy2 room4)
            (at-room light2 room4)
        )
    )
)