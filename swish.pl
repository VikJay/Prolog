% Student exercise profile
:- set_prolog_flag(occurs_check, error).        % disallow cyclic terms
:- set_prolog_stack(global, limit(8 000 000)).  % limit term space (8Mb)
:- set_prolog_stack(local,  limit(2 000 000)).  % limit environment space

/*	base object 
 * @params A: type. 1 - fox, 2 - chicken
 * @params B: M - male, F - female
 * @params C: age. 
 * @params D: ovulation time. For female type only!
 * @params E: position on area
 * */
object(A, B, C, D, E) :-
    ((  isFox(A) -> write('fox'), nl) ;
    (   isChicken(A) -> write('chicken'), nl ; false)),
    ((  isMale(B) -> write('male'),  nl) ;
    (   isFemale(B) -> write('female'), nl ; false)),
    (   checkAge(C, 10) -> true /*write('good age'), nl*/ ; false /*write('bad age'), nl*/ ),
    (   checkOTime(D, 2) -> true /*write('good otime'), nl*/ ; false /*write('bad otime'), nl*/ ),
    E = [X|Y],
    (   X >= 0, X < 10) -> (  true /*write('good X'), nl*/ ) ; false,
    (   Y >= 0, Y < 10) -> (  true /*write('good Y'), nl*/ ) ; false, 
    true.

isFox('F').
isChicken('C').
isMale('M').
isFemale('F').
checkAge(A, MAX) :-
    A >= 0 ->  
    (	A < MAX ->  true ; false) ;
    fail.
checkOTime(A, MAX) :-
    A >= 0 ->  
    (   A < MAX ->  true ; false) ;
    fail.


/* base area printing
 * @params X: current x chords
 * @params Y: current y chords
 * @params H: total height
 * @params W: total width
 * */
write_area(X, Y, Height, Width) :- 
    X < Width,
    Y < Height -> 
    (     
    	  write('['),
          write(X),
          write(','), 
          write(Y),
          write('],'),
          Z is X+1, 
   	      write_area(Z, Y, Height, Width)
    ) ;
    (   
    	  Y < Height ->
          Z is Y+1,
          C is X-Width,
          nl,  
          write_area(C, Z, Height, Width)
    ).
    