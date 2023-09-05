-module(lesson3_task03).

-export([split/2]).

split(Bin,Delimiter) -> 
    split(Bin,list_to_binary(Delimiter),<<>>,[]).

split(<<>>,_,Acc,List) ->
    reverse([<<Acc/binary>>|List]);
split(Bin,Delimiter,Acc,List) ->
    DelSize = (byte_size(Delimiter)),
  case Bin of
    <<Delimiter:DelSize/binary, Rest/binary>> -> 
        split(Rest,Delimiter,<<>>,[<<Acc/binary>>|List]);
    <<X, Rest/binary>> -> 
        split(Rest,Delimiter,<<Acc/binary, X>>,List);
    _ -> 
        split(Bin,Delimiter,Acc,List)
  end.

reverse(L) ->
    reverse(L,[]).
reverse([],Acc) -> 
    Acc;
reverse([H|T],Acc) ->
    reverse(T,[H|Acc]).
