w(X,Y) :-
  write('w X: '), write(X), nl,
  write('w Y: '), write(Y), nl.

z(IN, OUT) :-
  OUT = out(IN).

zz(IN, out(IN)).

bt_assert(X) :-
   assert(X).
bt_assert(X) :-
   retract(X),
   fail.

data(one).
data(two).
data(three).

cut_a(X) :-
   data(X).
cut_a(done).

cut_b(X) :-
   data(X),
   !.
cut_b(done).

cut_c(X, Y) :-
   data(X),
   !,
   data(Y).
cut_c(done, done).

is_data_1(X) :-
   data(X),
   write('is data'), nl.
is_data_1(X) :-
   write('not data'), nl.

is_data_2(X) :-
   data(X),
   !,
   write('is data'), nl.
is_data_2(X) :-
   write('not data'), nl.
   
is_data_3(X) :-
   data(X),
   write('is data'), nl.
is_data_3(X) :-
   not data(X),
   write('not data'), nl.

factorial_1(1, 1).
factorial_1(N, F) :-
  N > 1,
  NN is N - 1,
  factorial_1(NN,FF),
  F is N * FF.
  
factorial_2(N, F) :-
   factorial_2(N, 1, F).

factorial_2(1, F, F).
factorial_2(N, SoFar, F) :-
   N > 1,
   SoFar2 is SoFar * N,
   NN is N - 1,
   factorial_2(NN, SoFar2, F).

aa(X, X).

bb([], X, X).

cc(X, a(X)).

dd([H|T], T).

ee([A|X], Y, [A|Z]).

ff(A, [A|_]).

ff(A, [_|Z]) :-
   ff(A, Z).

gg([], Z, Z).
gg([A|X], Y, [A|Z]) :-
   gg(X,Y,Z).

p(a,b).
p(a,c).
p(b,e).
p(b,f).
p(b,d).
p(c,d).
p(d,g).
p(e,f).

r(A,B) :-
   p(A,B).
r(A,B) :-
   p(B,A).

member(A, [A|_]).
member(A, [_|Z]) :- member(A,Z).

reverse(F, B) :- reverse(F, [], B).

reverse([], B, B).
reverse([A|X], SoFar, Z) :- reverse(X, [A|SoFar], Z).

path(X,Y,P) :-
   path(X,Y,[X],R),
   reverse(R, P).

path(X,Y,SoFar,[Y|SoFar]) :-
   r(X,Y).
path(X, Z, SoFar, P) :-
   r(X, Y),
   Y \= Z,
   not member(Y, SoFar),
   path(Y, Z, [Y|SoFar], P).

father(michael, diego).
mother(ana, diego).
parent(ana, diego).

find(Relation, P1, P2) :-
   X =.. [Relation, P1, P2],
   call(X).

relationship(R, X, Y) :-
   member(R, [mother, father, parent]),
   C =.. [R, X, Y],
   call(C).
   
