(define (domain SetCover)

    (:requirements
        :strips
        :typing
        :adl
    )
    
    (:types
        set
        elem
    )

    (:predicates
        (contains ?s - set ?e - elem)
        (selected ?s - set)
        (covered ?e - elem)
    )

    (:action select-set
        :parameters (?s - set)
        :precondition (not (selected ?s))
        :effect (and (selected ?s)
                     (forall (?e - elem)
                        (when (contains ?s ?e) (covered ?e))
                     ) 
                )
    )
)