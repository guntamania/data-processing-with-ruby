# データ処理編

Rubyでデータ処理やっていこう。

## データ出力

データの出力は以下のようにできる。

``` ruby
# "Hello, World" と出力したい
data1 = "Hello"
data2 = "World"

# 加法演算子で連結
puts data1 + ", " + data2

# プレースホルダで表現
puts "#{data1}, #{data2}"
```

## データ型

データには型がある。
以下は同じ `100` を表すが、データの型が違う

``` ruby
data1 = 100
data2 = '100'
```

データの型が違うと、インタプリタの解釈も変わる。

``` ruby
# 整数型
result_int = 10 + 15
puts result_int
# 文字列型
result_str = "10" + "15"
puts result_str
```

以下は両方数字を表すが、整数と小数の違いがある。

``` ruby
# 整数型
puts 100 / 3
# 浮動小数点型
puts 100.0 / 3.0
```

## 変換

``` ruby
str = "100"
puts str.to_i # これで小数点型になる
```

## 例題

以下を使って `I am 32 yeas old` と出力してみよう

```
i_am = "I am"
yrs  = 32
old  = "years old"
```

# 配列

配列は以下のように表すことができる

``` ruby
arr = ["apple", "banana", "cherry"]
```

値を得るには以下のようにする

```
puts arr[0] #=> "apple"
puts arr[1] #=> "banana"
```

# ハッシュ

ハッシュ（連想配列）は以下のように表すことができる

``` ruby
hash = {status: :single, name: "Tokuyama"}
```

値を得るには以下のようにする

``` ruby
puts hash[:status] #=> :single
puts hash[:name] #=> "Tokuyama"
```

### 例題

``` ruby
okada = {
  gender: :male,
  given_name: "Tetsuji",
  family_name: "Okada"
}
```

変数 `okada` を使って `I am Okata Tetsuji` と出力してみよう

## 豆知識

`pp` メソッドで整形したデータを出力できる。
最終のプロダクトには使われることはあまりないが、
デバッグ中では便利。

``` ruby
okada = {
  gender: :male,
  given_name: "Tetsuji",
  family_name: "Okatda"
}

pp okada # ruby は引数が1個のときのみ()を省略できる
         # 省略しない場合は pp(okada)
```

# データ操作

データの操作や加工について学ぼう

## シンボルと文字列

rubには文字列型のほかにシンボルというデータ型が存在する。

``` ruby
p "mojiretsu" # 文字列型
p 'mojiretsu' # 上に同じだが、プレースホルダが使えない
p :mojiretsu  # シンボル
```

使いみちとしては、ハッシュのキーにつかわれる

```
# キーに文字列型を使う場合
hash1 = {"Author" => "Tezuka Osamu", "Book" => "ジャングル大帝"}
# キーにシンボルを使う場合
hash2 = {:Author => "Tezuka Osamu", :Book => "ジャングル大帝"}
# シンボル型を使うときの略記法
hash3 = {Author: "Tezuka Osamu", Book: "ジャングル大帝"}

p hash1["Author"] # => ”Tezuka Oasamu"
p hash2[:Author] # => ”Tezuka Oasamu"
p hash3[:Author] # => ”Tezuka Oasamu"
```

値側にもつかわれる
``` ruby
otoko = {gender: :man, status: :single}
onnna = {gender: :woman, status: :married}
```
自由な文字列ではなく、定数的なものに使われる。

## select

データのフィルタリングができる

``` ruby
arr = ["Inu", "Saru", "Kiji"]
arr.select{|kerai| kerai.length > 3}
```

## map

データの加工に使われる

``` ruby
arr = ["Inu", "Saru", "Kiji"]
p arr.map{|kerai| kerai.length} #=> 3,4,4
p arr.map{|kerai| kerai.upcase} # => INU, SARU, KIJI
```

## inject

データの集計等に使われる

``` ruby
arr = [1,2,3,4,5]
arr.inject{|memo, val| memo + val} #=> 15
# 略記法。合計するときに使うことが多いので、以下で覚えておくのもあり
arr.inject(:+) #=> 15
```
文字列の連結にも使われる
``` ruby
arr = ["Inu", "Saru", "Kiji"]
arr.inject{|memo, val| memo + "|" + val} #=> "Inu|Saru|Kiji"
# 略記はない
```

# データのネスト

配列、ハッシュテーブルはネスト（入れ子）にすることができる。

``` ruby
# ネスト
messages = [
  {id: 0, message: "Hello",   status: :sent},
  {id: 1, message: "M or F?", status: :sent},
  {id: 2, message: "F*ck",    status: :filtered},
  {id: 3, message: "Seeya",   status: :sent},
  {id: 4, message: "My god",  status: :deleted},
]
```

### 例題1

pp で出力してみよう。

### 例題2

`id` が `2` の `message` を出力してみる。

```
pp messages[2][:message]
```

### 例題3

`message` をすべて出力してみる

```
pp messages.map{|mes| mes[:message]}
```

### 豆知識

## 更にネスト

``` ruby
chat_data = [
  { room_id: 0, 
    chat_log: [
      {id: 0, message: "Hello",   status: :sent},
      {id: 1, message: "M or F?", status: :sent},
      {id: 2, message: "F*ck",    status: :filtered},
      {id: 3, message: "Seeya",   status: :sent},
      {id: 4, message: "My god",  status: :deleted},
    ],
	status: :archived },
   { room_id: 1, 
     chat_log: [
       {id: 0, message: "Hi?",             status: :sent},
       {id: 1, message: "Where R u from?", status: :sent},
       {id: 2, message: "Canada",          status: :sent},
       {id: 3, message: "Which part?",     status: :sent},
     ], 
	 status: :active}
   { room_id: 0, 
     chat_log: [
       {id: 0, message: "Hola?",                 status: :sent},
       {id: 1, message: "Wha?",                  status: :sent},
       {id: 2, message: "muy buenos",            status: :sent},
       {id: 3, message: "Doesnt make sence..",   status: :sent},
     ],
	 status: :active}
]
```

### 例題

`messages` の `message` をすべて出力してみよう

# ファイルオープン

より実践に近づくため、外部ファイルを読み込んでみよう。

## 読み込みモードでファイルを開く

`File.open()` を用いてファイルを開くことができる。
```
File.open("some.txt", "r")
```

``` ruby
file = File.open("hello.txt", "r")
file.each do |line|
  puts line
end
file.close
```

使った後はきちんと `close` すること。

## csv ファイルを読む

基本は同じ。
ここでは、文字コードを指定する
(SJISをUTFｰ8で表示する）。

``` ruby
file = File.open("c01.csv", mode = "rt:sjis:utf-8")
file.each do |line|
  puts line
end
file.close
```

これをデータとして扱うには、 `パース` という作業が必要になる。
文字列をデータ構造化して扱うことをデシリアライズという。

Rubyでは便利なライブラリが標準搭載されているので、つかってみよう。

``` ruby
require 'csv'
require 'pp'
data = CSV.read("c01.csv", mode = "rt:sjis:utf-8")
pp data
```

この例だと単純にcsvの内容を配列化しているだけである。
場合によってはハッシュが便利な場合がある。
ハッシュ化してみよう。

``` ruby
require 'csv'
require 'pp'

data = CSV.read("c01.csv", encoding: 'sjis:UTF-8', headers:true)
          .map{|d| d.to_hash}

pp data
```

## データ加工

では、データ加工してみよう。

### select文

平成のデータだけ抜き出す

``` ruby
# coding: utf-8
require 'csv'
require 'pp'

data = CSV.read("c01.csv", encoding: 'sjis:UTF-8', headers:true).map{|d| d.to_hash}
pp data.select{|d| d["元号"] == "平成"}
```

2000年から2005年のデータを抜き出す

``` ruby
# coding: utf-8
require 'csv'
require 'pp'

data = CSV.read("c01.csv", encoding: 'sjis:UTF-8', headers:true).map{|d| d.to_hash}
pp data.select{|d| d["西暦（年）"].to_i >= 2000 && d["西暦（年）"].to_i <= 2005 }
```

### inject文

ちょっとむずい

``` ruby
# coding: utf-8
require 'csv'
require 'pp'

pp CSV
  .read("c01.csv", encoding: 'sjis:UTF-8', headers:true) # 読み込み
  .map{|d| d.to_hash} # ハッシュ化
  .select{|row| row["都道府県コード"].to_i > 0} # 都道府県のデータだけ抜き出す
  .select{|row| row["西暦（年）"].to_i == 2000} # 西暦が2000年のものを抜き出す
  .map{|row| row["人口（総数）"].to_i} # 人口だけの配列に加工
  .inject(:+) # 加算
```




