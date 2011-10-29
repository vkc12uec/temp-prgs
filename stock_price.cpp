/*
Given an array of stock prices from day 0 to N-1 of a company X, we have to find the max
loss that is possible. Loss occurs if stock is bought at higher price and sold at lower price.
Ex: 1 2 3 7 5 8 9 4 6 10 12 (algo and code including main)
Max Loss is 9 - 4 = 5 (Possible losses are 8-4 = 4, 7-5 = 2 etc). Max difference between
stock price is 12 - 1 = 11 but max loss is 9 -4 = 5
*/

// algo: O(n2):
//       from position i, considerig a[i] to be max, find that min on its right which will
//       give you lowest min ....
