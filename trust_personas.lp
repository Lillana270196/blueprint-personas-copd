% Patient profile and context
patient(maria).
has_condition(maria, copd).
pollution(high).
user_response(maria, ignored).
emotional_state(maria, neutral).

% Trust inference rules
trust_level(maria, low) :- user_response(maria, ignored).
trust_level(maria, high) :- user_response(maria, followed).
trust_level(maria, medium) :-
    patient(maria),
    not trust_level(maria, low),
    not trust_level(maria, high).

% Consistency constraints
:- trust_level(maria, low), trust_level(maria, high).
:- trust_level(maria, low), trust_level(maria, medium).
:- trust_level(maria, medium), trust_level(maria, high).

% Context-aware recommendation
recommendation(maria, stay_indoors) :-
    has_condition(maria, copd),
    pollution(high).

% Adaptive tone generation
tone(maria, empathetic) :- trust_level(maria, low).
tone(maria, confident) :- trust_level(maria, high).
tone(maria, neutral) :- trust_level(maria, medium).