#!/bun/bash
wc sample.csv
csvq "select * from sample order by 注文日 limit 3"
csvq "select sum(売上金額) from sample where 注文日='2016/1/1'"
## 日次集計
csvq "select 注文日,sum(売上金額) from sample group by 注文日 order by 注文日 limit 3"
## 月次集計
csvq "select DATETIME_FORMAT(注文日, '%Y-%m') as 年月, 売上金額 from sample limit 3"
csvq "select sum(売上金額) from sample where 注文日 like '2016/1/%'"
csvq "select 年月,sum(売上金額) from (select DATETIME_FORMAT(注文日, '%Y-%m') as 年月, 売上金額 from sample) group by 年月 order by 年月" | head -6

