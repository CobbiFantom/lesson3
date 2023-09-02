-module(lesson3_task02).
-export([words/1]).

words(Bin) ->
    words(Bin,<<>>,[]).
words(<<>>,Acc, List) ->
    reverse([Acc|List]);
words(<<$\s, Rest/binary>>, Acc,List) ->
    words(Rest, <<>> ,[Acc|List]);
words(<<X, Rest/binary>>,Acc,List) -> 
    words(Rest, <<Acc/binary, X>>,List).

reverse(L) ->
    reverse(L,[]).
reverse([],Acc) ->
    Acc;
reverse([H|T],Acc) ->
    reverse(T,[H|Acc]).
