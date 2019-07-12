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

また、数値の出力は以下のように行う

```ruby
data3 = 123

# 文字列型に変換
puts data3.to_s
```

### 例題

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
hash = {status: :single, name: "Suguru"}
```

値を得るには以下のようにする

``` ruby
puts hash[:status] #=> :single
puts hash[:name] #=> "Suguru"
```

### 例題

``` ruby
kinuta = {
  gender: :male,
  given_name: "Tetsuzo",
  family_name: "Kinuta"
}
```

変数 `kinuta` を使って `I am Kinuta Tetsuzo` と出力してみよう

## データのネスト

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

``` ruby
# 更にネスト
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


