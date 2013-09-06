-module(shopList).

-export([shopList/1]).

shopList(List) -> [{Item, (Quantity * Price)} || {Item, Quantity, Price} <- List].

% List = [{book, 2, 5}, {chair, 1, 50}, {football, 5, 7}].
% shopList:shopList(List).
