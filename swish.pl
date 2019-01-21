% Student exercise profile
:- set_prolog_flag(occurs_check, error).        % disallow cyclic terms
:- set_prolog_stack(global, limit(8 000 000)).  % limit term space (8Mb)
:- set_prolog_stack(local,  limit(2 000 000)).  % limit environment space

/* base area printing
 * @params X: current x chords
 * @params Y: current y chords
 * @params H: total height
 * @params W: total width
 * */

write_area(X, Y, H, W) :- 
    X < W,
    Y < H -> 
    (     
    	  write('['),
          write(X),
          write(','), 
          write(Y),
          write('],'),
          Z is X+1, 
   	      write_area(Z, Y, H, W)
    ) ;
    (   
    	  Y < H ->
          Z is Y+1,
          C is X-W,
          nl,  
          write_area(C, Z, H, W)
    ).
    