-module(hello).
-export([add/2, hello/0, greet_and_add_two/1, hello/1]).

add(A,B) ->
	A + B.

%% Shows greetings.
%% io:format/1 is the standard function used to output text.
hello() ->
	io:format("Hello, world!~n").

hello(X) ->
	io:format("Hello, ~s~n", [X]).

greet_and_add_two(X) ->
	hello(),
	add(X,2).
