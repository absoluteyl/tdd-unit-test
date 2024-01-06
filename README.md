# TDD Unit Test

網球比賽的計分程式

初始的分數：0:0

Henry | Jack | Score() | Remark
--- | --- | --- | ---
0 | 0 | Love All | 兩人同分就會是 All, 0分就是 Love
1 | 0 | Fifteen Love | 1分就是 Fifteen
0 | 1 | Love Fifteen | 1分就是 Fifteen
1 | 1 | Fifteen All | 1分就是 Fifteen
2 | 3 | Thirty Forty | 2分就是 Thirty, 3分就是 Forty
4 | 1 | Henry Win | 4分且分數差2以上就是 Win
3 | 3 | Deuce | 3分平手開始就是 Deuce
3 | 4 | Jack adv. | Deuce 後分數差1就是 adv.
3 | 5 | Jack Win | Deuce 後分數差2就是 Win
10 | 10 | Deuce | >= 3分且分數相同就是 Deuce
