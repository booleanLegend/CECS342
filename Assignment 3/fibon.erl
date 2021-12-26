-module(fibon).
-export([fib/1, fib3serial/1, fibThread/2, fib3parallel/1, quicksort/1]).

fib(0) -> 1;
fib(1) -> 1;
fib(N) when N>1 -> fib(N-1) + fib(N-2);
fib(_) -> undefined.

fib3serial(N) -> [fib(N), fib(N), fib(N)].

fibThread(SendTo, N) ->
    Answer = fib(N),
    SendTo ! {self(), Answer}.

fib3parallel(N) ->
    P1 = spawn(?MODULE, fibThread, [self(), N]),
    P2 = spawn(?MODULE, fibThread, [self(), N]),
    P3 = spawn(?MODULE, fibThread, [self(), N]),
    awaitfibs(3, []).

awaitfibs(ThreadsLeft, Results) ->
    receive
        {From, FibN} when ThreadsLeft =:= 1 ->
            [FibN|Results];
        {From, FibN} ->
            awaitfibs(ThreadsLeft -1, [FibN|Results])
    end.

quicksort([]) -> [];
quicksort([Pivot|Rest]) ->
    {Smaller, Larger} = partition(Pivot,Rest,[],[]),
    quicksort(Smaller) ++ [Pivot] ++quicksort(Larger).

partition(_,[], Smaller, Larger) -> {Smaller, Larger};
partition(Pivot, [H|T], Smaller, Larger) ->
    if H =< Pivot -> partition(Pivot, T, [H|Smaller], Larger);
        H > Pivot -> partition(Pivot, T, Smaller, [H|Larger])
        end.
