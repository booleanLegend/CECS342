% creates the main module
-module(main).

% includes the following functions used in the program
%% the /# refers to the amount of parameters
%% all functions and statements end with a "."
-export([recursiveCall/4, helper/1, test/0]).


% recursive function
recursiveCall(stu1, stu2, stu3, turns) ->
	% if all students have the same amount as each other
	if stu1 == stu2 andalso stu1 == stu3 ->
		% writes the end of the game 
        io:write("Everyone is happy because all students have the same amount of candy and we can stop playing this dumb game.~n");
		
    % if the students don't have the same amount
	%% the "else" statement, now this is annoying
    true ->
		% mentioning the aformentioned
        io:write("Students are unhappy because someone has more than the rest in the group.~n"),

        % halves student 1's candy amount
        stu1Half = stu1 div 2,
		% outputs student 1's half amount
		% man pages say ~p for nicer formatting, will try later....
        io:format("Student 1 gives: ", [stu1Half], "~n"),

		% should be the same as above right?
		% halves student 2's candy amt
        stu2Half = stu2 div 2,
		% outputs student 2's half amount
        io:format("Student 2 gives: ", [stu2Half], "~n"),

		% same thing i guess
		% halves student 3's candy amt
        stu3Half = stu3 div 2,
		% outputs student 3's half amount
        io:format("Student 3 gives: ", [stu3Half], "~n"),


        % Students gives half to kid on the right
		% after the whistle, student 1 now has this...
        stu1_After_Whistle = stu1Half + stu3Half,
		% outputs what they have now 
        io:format("Whistle blows!~nStudent 1 now has: ", [stu1_After_Whistle], "~n"),

		% same thing goes for student 2
        stu2_After_Whistle = stu2Half + stu1Half,
		% outputs what student 2 now has
        io:format("Student 2 now has: ", [stu2_After_Whistle], "~n"),

		% same thing for student 3
        stu3_After_Whistle = stu3Half + stu2Half,
		% ouputs what student 3 now has
        io:format("Student 3 now has: ", [stu3_After_Whistle], "~n"),

        
		% if student 1 doesn't have an even amt, they get one more from the "teacher", helper function
        stu1FinalAmt = helper(stu1_After_Whistle),
		% outputs the student 1's final amt
        io:format("Student 1 ends up with: ", [stu1FinalAmt], "~n"),
        stu2FinalAmt = helper(stu2_After_Whistle),
        io:format("Student 2 ends up with: ", [stu2FinalAmt], "~n"),
        stu3FinalAmt = helper(stu3_After_Whistle),
        io:format("Student 3 ends up with: ", [stu3FinalAmt], "~n"),
        io:format("~n"),

        % The game continues to the next turn.
        recursiveCall(stu1FinalAmt, stu2FinalAmt, stu3FinalAmt, turns + 1)
    end.
	% i wonder if here i have to put another "." 


% helper function
helper(currentStuAmt) ->
	% checks if value passed in is even getting remaninder and comparing to 0
	%% if it is continues with the function, really it stops b/c there isn't anything else
	%% otherwise, it adds one to a new variable and erlang returns it
	%% this lang is weird, i actually miss ruby now
	if currentStuAmt rem 2 =:= 0 ->
		continues;
	true ->
		finalAmt = currentStuAmt + 1
	end.


% the tester function, just calling recursiveCall so i don't have to do it in the cmdline
test() ->
	recursiveCall(2, 4, 6, 1). 