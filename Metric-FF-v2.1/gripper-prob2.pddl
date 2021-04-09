(define (problem gripper-prob2)
    (:domain gripper2)
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