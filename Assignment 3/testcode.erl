-module(testcode).
-export([reverse/1]).

%first([H|_]) -> H.
%next([_|T]) -> T.

reverse(List) ->
	getLast(List).
getLast([H|Rest]) -> getLast(Rest) ++H.