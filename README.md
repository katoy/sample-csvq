http://jusyo.jp/csv/new.php
から download した csv_zenkoku.zip  を解凍して、nkf -w で utf-8 にしたものを zenkoku.csv とした。

```
 $ csvq "select * from zenkoku order by 郵便番号 limit 5"
 $ csvq "select 郵便番号,都道府県,市区町村,町域,町域補足,京都通り名,字丁目 from zenkoku where 郵便番号='100-0001'"
 $ csvq "select 郵便番号,都道府県,市区町村,町域,町域補足,京都通り名,字丁目 from zenkoku where 郵便番号 like '100-%'"

```

https://officedic.com/excel-vba-maketool-sample2/ から download した xlsx を csv に変換して sample.csv とした。

注文日,注文番号,商品,単価,販売数量,売上金額

```
 $ csvq "select * from sample order by 注文日 limit 5"
 $ csvq "select * from sample where 注文日='2016/1/1'"
 $ csvq "select sum(売上金額) from sample where 注文日='2016/1/1'"
 ## 日次集計
 $ csvq "select 注文日,sum(売上金額) from sample group by 注文日 order by 注文日 limit 5"
 ## 月次集計
 $ csvq "select DATETIME_FORMAT(注文日, '%Y-%m') as 年月, 売上金額 from sample limit 5"
 $ csvq "select sum(売上金額) from sample where 注文日 like '2016/1/%'"
 $ csvq "select 年月,sum(売上金額) from (select DATETIME_FORMAT(注文日, '%Y-%m') as 年月, 売上金額 from sample) group by 年月 order by 年月"


samle.csv が 10 万行データだが、日次集計、月次集計など 一瞬ででた。  
- 1.sh
- csv1.gif


## 参考情報

- https://qiita.com/mithrandie/items/146564e748ee235709c0
  csvqについてのいろいろ

