(define (domain Rover)

    (:requirements :strips :adl :typing)

    (:types waypoint rock)

    (:predicates
        (contains ?w - waypoint ?r - rock)
        (sampled ?r - rock)
        (on ?w - waypoint)
        (is-base ?w - waypoint)
        (data-sent ?r - rock)
        (can-reach ?w1 - waypoint ?w2 - waypoint)
    )

    (:action move
        :parameters (?w1 - waypoint ?w2 - waypoint)
        :precondition (and (on ?w1) 
                           (can-reach ?w1 ?w2))
        :effect (and (not (on ?w1)) 
                     (on ?w2))
    )
    
    (:action sample-rock
        :parameters (?w - waypoint ?r - rock)
        :precondition (and (on ?w)
                           (contains ?w ?r)
                           (not (sampled ?r)))
        :effect (sampled ?r)
    )
    
    (:action transmit-data
    :parameters (?w - waypoint ?r - rock)
    :precondition (and (on ?w) 
                       (is-base ?w)
                       (sampled ?r)
                       (not (data-sent ?r)))
    :effect (data-sent ?r)
    )

)