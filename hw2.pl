/* Homework Assignment 2
   Programming Languages
   CS471, Spring 2023
   Binghamton University */

/* Problem 1a: */

vertical(line(point(X,_),point(X,_))).
horizontal(line(point(_,Y),point(_,Y))).

/* ANSWER BELOW
Clauses:
   vertical(line(point(X,_),point(X,_))).
   horizontal(line(point(_,Y),point(_,Y))).

Predicates:
   vertical/1
   horizontal/1

Rules:
   No rules are present from the code

Facts:
   vertical(line(point(X,_),point(X,_))).
   horizontal(line(point(_,Y),point(_,Y))).

Atoms:
   vertical
   horizontal
   line
   point

Variables:
   X
   Y

Data Structure Constructors:
   line(point(X,_),point(X,_))
   line(point(_,Y),point(_,Y)) */

/**********************************************************************/
/* Problem 1b: */

numeral(0).
numeral(succ(X)) :- numeral(X).

add(0,Y,Y).
add(succ(X),Y,succ(Z)) :- add(X,Y,Z).

/* ANSWER BELOW
Clauses:
   numeral(0).
   numeral(succ(X)) :- numeral(X).
   add(0, Y, Y).
   add(succ(X), Y, succ(Z)) :- add(X, Y, Z).

Predicates:
   numeral/1
   add/3

Rules:
   numeral(succ(X)) :- numeral(X).
   add(succ(X), Y, succ(Z)) :- add(X, Y, Z).

Facts:
   numeral(0).
   add(0, Y, Y).

Atoms:
   succ
   numeral
   add

Variables:
   X
   Y
   Z

Data Structure Constructors:
   succ(X) */

/**********************************************************************/
/* Problem 2: */

/* Definition for my_first/2 */
my_first(X, [X|_]).

/* Definition for my_last/2 */
my_last(X, [X]).
my_last(X, [_|Tail]) :- my_last(X, Tail).

/* Problem 2 Test: */
%:- my_first(a, [a]). % SUCCEED
%:- my_first(3, [3, 2, 1]). % SUCCEED
%:- my_first(3, [4, 3, 2, 1]) -> fail ; true. % FAIL
%:- my_last(a, [a]). % SUCCEED
%:- my_last(1, [3, 2, 1]). % SUCCEED
%:- my_last(1, [3, 2, 1, 0]) -> fail ; true. % FAIL

/**********************************************************************/
/* Problem 3: */

init(All, BLst) :-
    append(BLst, [_], All).

/* Problem 3 Test: */
% :- init([1], []).       % SUCCEED
% :- init([1,2,3], [1,2]).% SUCCEED
% :- init([1,2], [1,2]) -> fail ; true.  % FAIL
% :- init([1,2], [2]) -> fail ; true.  % FAIL

/**********************************************************************/
/* Problem 4:*/

is_decreasing([]).  % empty list 
is_decreasing([_]). % single-element list

is_decreasing([X, Y | Rest]) :-
    X >= Y,           
    is_decreasing([Y | Rest]).


/* Problem 4 Test: */
%:- is_decreasing([]).            % SUCCEED
%:- is_decreasing([10]).          % SUCCEED
%:- is_decreasing([10,9]).        % SUCCEED
%:- is_decreasing([10,9,7]).      % SUCCEED
%:- is_decreasing([10,9,7,7,2]).  % SUCCEED
%:- is_decreasing([1,1,1,1,1]).   % SUCCEED

%:- is_decreasing([10,9,7,9]) -> fail ; true.    % FAIL
%:- is_decreasing([2,3,1]) -> fail ; true.       % FAIL
%:- is_decreasing([1,2,3]) -> fail ; true.       % FAIL
%:- is_decreasing([7,19])-> fail ; true.        % FAIL

/**********************************************************************/
/* Problem 5: */

element_at(X, [X|_], 0).
element_at(X, [_|Ys], N) :- N > 0, N1 is N - 1, element_at(X, Ys, N1).


/* Problem 5 Test: */
%:- element_at(3,[1,2,3],2).   % SUCCEED
%:- element_at(1,[1,2,3],0).   % SUCCEED

%:- element_at(1,[1,2,3],1) -> fail ; true.     % FAIL

/**********************************************************************/
/* Problem 6: */

insert_at(3,[1,2,3],2,[1,2,3,3]).

insert_at(E, Y, 0, [E|Y]).
insert_at(E, [H|Y], N, [H|Z]) :-
    N > 0,
    N1 is N - 1,
    insert_at(E, Y, N1, Z).


/* Problem 6 Test: */
%:- insert_at(3,[1,2,3],2,[1,2,3,3]).  % SUCCEED
%:- insert_at(1,[1,2,3],0,[1,1,2,3]).  % SUCCEED
%:- insert_at(a,[1,2,3],1,[1,a,2,3]).  % SUCCEED

%:- insert_at(1,[1,2,3],0,[1,2,3]) -> fail ; true.    % FAIL

/**********************************************************************/
/* Problem 7 : */

delete_at(E, Y, N, Z) :-
    insert_at(E, Z, N, Y).


/* Problem 7 Test: */
%:- delete_at(3,[1,2,3,3],2,[1,2,3]).  % SUCCEED
%:- delete_at(1,[1,1,2,3],0,[1,2,3]).  % SUCCEED
%:- delete_at(a,[1,a,2,3],1,[1,2,3]).  % SUCCEED

%:- delete_at(1,[1,2,3],0,[1,2,3]) -> fail ; true.    % FAIL

/**********************************************************************/
/* Problem 8: */

zip([], [], []).
zip([X|Xs], [Y|Ys], [(X,Y)|Zs]) :-
    zip(Xs, Ys, Zs).


/* Problem 8 Test: */
%:- zip([1,2,3],[a,b,c],[(1,a),(2,b),(3,c)]). % SUCCEED
%:- zip([],[],[]).                      % SUCCEED
%:- zip([1],[2],[(1,2)]).               % SUCCEED

%:- zip([1],[2],[(2,3)]) -> fail ; true.               % FAIL
%:- zip([1],[2,3],[(1,2)]) -> fail ; true.             % FAIL

/**********************************************************************/
/* Problem 9: */

zip2([], _, []).
zip2(_, [], []).
zip2([X|Xs], [Y|Ys], [(X,Y)|Zs]) :-
    zip2(Xs, Ys, Zs).


/* Problem 9 Test: */
%:- zip2([1,2,3],[a,b,c],[(1,a),(2,b),(3,c)]). % SUCCEED
%:- zip2([],[a,b,c],[]).                  % SUCCEED
%:- zip2([1,3],[],[]).                    % SUCCEED
%:- zip2([1,3],[2],[(1,2)]).              % SUCCEED

%:- zip2([1],[2],[(2,3)]) -> fail ; true.                 % FAIL
%:- zip2([1],[a,b],[(1,a),(1,b)]) -> fail ; true.         % FAIL

/**********************************************************************/
/* Problem 10: */

greater_than(succ(_), 0).
greater_than(succ(X), succ(Y)) :-
    greater_than(X, Y).


/* Problem 10 Test: */
% :- greater_than(succ(succ(succ(0))),succ(0)).        % SUCCEED

% :- greater_than(succ(succ(0)),succ(succ(succ(0)))) -> fail ; true.  % FAIL

/**********************************************************************/
/* Problem 11: */

subtract(X, 0, X) :- numeral(X).
subtract(succ(X), succ(Y), Z) :- subtract(X, Y, Z).

/* Problem 11 Test: */
% :- subtract(succ(succ(0)), succ(0), succ(0)).       % SUCCEED
% :- subtract(succ(succ(0)), 0, succ(succ(0))).       % SUCCEED
% :- subtract(succ(succ(0)), succ(succ(0)), 0).       % SUCCEED

% :- subtract(succ(succ(0)), 0, 0) -> fail ; true.             % FAIL
% :- subtract(succ(succ(0)), succ(0), succ(succ(0))) -> fail ; true. % FAIL

/**********************************************************************/
/* Problem 12: */

has_subseq([], []).
has_subseq([X|Xs], [X|Ys]) :-
    has_subseq(Xs, Ys).
has_subseq([_|Xs], Ys) :-
    has_subseq(Xs, Ys).
has_subseq(_, []).

/* Problem 12 Test: */
%:- has_subseq([a,g,b,d],[g,b]).     % SUCCEED
%:- has_subseq([1,2,3,4],[2,4]).     % SUCCEED
%:- has_subseq([1,2,3,4],[2,3]).     % SUCCEED
%:- has_subseq([1,2,3,4],[]).        % SUCCEED

%:- has_subseq([1,2,3,4],[2,5]) -> fail ; true.     % FAIL
%:- has_subseq([1,2,3,4],[4,3]) -> fail ; true.     % FAIL

/**********************************************************************/
/* Problem 13: */

bubblesort(X, Y) :-
    bubble(X, Z),
    !,
    bubblesort(Z, Y).
bubblesort(X, X).

bubble([X, Y | Part], [Y, X | Part]) :-
    X > Y.
    
bubble([Z | Part1], [Z | Part2]) :-
    bubble(Part1, Part2).


/* Problem 13 Test: */
%:- bubblesort([],[]).     % SUCCEED
%:- bubblesort([4, 3, 2, 1],[1, 2, 3, 4]).     % SUCCEED
%:- bubblesort([4, 3, 2, 1, 4],[1, 2, 3, 4, 4]).     % SUCCEED

%:- bubblesort([4, 3, 2, 1],[1, 2, 4, 3]) -> fail ; true.     % FAIL

/**********************************************************************/
/* Problem 14: */

merge_lists([], B, B).
merge_lists(A, [], A).

merge_lists([A|As], [B|Bs], [A|M]) :-
    A =< B,
    merge_lists(As, [B|Bs], M).

merge_lists([A|As], [B|Bs], [B|M]) :-
    A > B,
    merge_lists([A|As], Bs, M).

merge(A, B, M) :-
    merge_lists(A, B, M).


/* Problem 14 Test: */
%:- merge([10,3,2],[11,5,2],[2,2,3,5,10,11]).       % SUCCEED
%:- merge([0],[],[0]).                               % SUCCEED
%:- merge([],[3],[3]).                               % SUCCEED

%:- merge([3,4],[3],[3]) -> fail ; true.             % FAIL