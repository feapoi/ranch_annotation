%%%-------------------------------------------------------------------
%%% @author Thoe
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 二月 2019 10:07
%%%-------------------------------------------------------------------
-module(start).
-author("Thoe").

%% API
-export([start/0,
    stop/0]).
start() ->
    ok = application:start(crypto),
    ok = application:start(asn1),
    ok = application:start(public_key),
    ok = application:start(ssl),
    ok = application:start(ranch).

stop() ->
    ok.

