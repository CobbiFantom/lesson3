-module(lesson3_task01).

-export([first_word/1]).

first_word(Bin) ->
    first_word(Bin, <<>>).


first_word(<<$\s, _/binary>>, Acc) ->
    Acc;
first_word(<<X/utf8, Bin/binary>>, Acc) ->
    first_word(Bin, <<Acc/binary, X>>);
first_word(<<>>,Acc) ->
    Acc.
