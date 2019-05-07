=begin
# 小文字が変数
msg = "hello world"
puts  msg

msg = "hello world again"
puts  msg

VERSION = 1.1 #大文字が定数
puts VERSION

p 4.8.class
p 4.8.methods
p Rational(2,5) + Rational(3,4)
p 2/5r + 3/4r

p 52.6.round #四捨五入
p 52.6.floor #切り捨て
p 52.6.ceil #切り上げ

puts "hello\n w\torld" #\nが改行 \tがタブ開け
puts 'hello\n w\torld'

puts "price #{3000 * 4}"

name = "ito"
puts "hello #{name}"

puts "hello" + "world"
puts "hello\n" * 10

name = "ito"
puts name.upcase #大文字を返す
puts name

puts name.upcase! #大文字を返したうえで元の変数を大文字に書き換える
puts name

#?は真偽値を返す
puts name.empty? #変数が空かどうか
puts name.include?("T") #変数にTが含まれているか

colors =["red","blue","yellow"]

p colors[0]
p colors[-1] #末尾
p colors[0..2] #0~2まで
p colors[0...2] #0~2の直前まで
p colors[5] #nilはnullとほぼ同じ

colors[0] = "pink" #書き換え
colors[1..2] = ["white","black"] #複数を書き換え
colors.push("gold") #末尾に追加
colors << "silver" #pushと同じ

p colors

p colors.size #要素数
p colors.sort #ソート

#key(文字列)とvalue(値)をペアにまとめる
#ito 200
#toyota 150

scores = {"ito" => 200, "toyota" => 150}
scores = {:ito => 200, :toyota => 150} # : シンボルオブジェクト
scores = {ito: 200, toyota: 150} # : シンボルオブジェクト

p scores[:ito]
scores[:toyota] = 300
p scores

p scores.size
p scores.keys
p scores.values
p scores.has_key?(:ito)

#オブジェクトの変換
x = 50
y = "3"

p x + y.to_i #整数変換
p x + y.to_f #浮動小数点変換

p x.to_s + y #文字列変換

score = {ito:200, toyota: 500}

p score.to_a #配列変換
p score.to_a.to_h #ハッシュ変換

puts %Q(hello) #""と同じ
puts %(hello) #""と同じ
puts %q(hello) #''と同じ

puts "he\"llo"
puts 'he\'llo'
puts %(he"llo)
puts %q(he'llo)

p ["red", "blue"]
p ['red', 'blue']
p %W(red,blue) #配列
p %w(red,blue) #配列


#書式付きで値を埋め込む
p "name: %s" % "ito"
p "name: %10s" % "ito" #右寄せ
p "name: %-10s" % "ito" #左寄せ

p "id: %d, rate: %f" % [355, 3.284] #値が複数の場合は配列で渡す
p "id: %05d, rate: %10.2f" % [355, 3.284]

printf("name: %s\n", "ito")
printf("id: %d, rate: %.2f\n", 298, 4.17)

p sprintf("name: %s\n", "ito") #sprintfは文字列を返す
p sprintf("id: %d, rate: %.2f\n", 298, 4.17)

#if
score = gets.to_i #入力した文字列を変換

if score > 80 then
    puts "great!!"
elsif score > 60
    puts "good!!"
else
    puts "so so ..."
end

# puts "great!" if score > 80

#case

signal = gets.chomp #改行取り除くメソッド

case signal
when "red"
    puts "stop"
when "green", "blue"
    puts "go"
when "yellow"
    puts "caution"
else
    puts "wrong signal"
end

#while
i = 0
while i<10 do
    puts "#{i}: hello"
    i += 1
end

#times
10.times do |i|
    puts "#{i}: hello"
end
10.times { |i| puts "#{i}: hello"}

#for
for i in 15..20 do
    p i
end

for color in ["red","blue"] do
    p color
end

for name, score in {ito:200, toyota:100} do
    puts "#{name}: #{score}"
end

#each
(15..20).each do |i|
    p i
end

["red","blue"].each do |color|
    p color
end

{ito:200, toyota:100}.each do |name, score|
    puts "#{name}: #{score}"
end


#loop
i = 0
loop do
    p i
    i += 1
end 

#break ループを抜ける条件
#next ループを一回スキップ
10.times do |i|
    if i == 7 then
        #break
        next
    end
    p i
end

#メソッド
#本来はクラスに定義する
def sayHi(name = "toyota") #()内が引数
    #puts "hi #{name}"
    return "hi #{name}" #文字列そのものを返す
end

#sayHi("ito")
sayHi "ito"
sayHi
p sayHi

#クラス,アクセサ
class User #クラス名は必ず大文字から

    # attr_accessor :name #getterとsetter両方自動生成
    # attr_reder :name #gettterだけ生成
    # setter:name =(value) nameをセットするためのメソッド
    # getter:name　nameにアクセスするためのメソッドを自動生成

    def initialize(name) #newインスタンスが呼ばれたときに呼ばれるメソッド
        @name = name #インスタンス内で値が保持されるインスタンス変数は先頭に@を付ける

    end

    def sayHi
        # self #メソッドを受け取っているインスタンスを表すオブジェクト
        # self.name -> @name getterが設定されていればインスタンス変数が取得される
        puts "hi I am #{@name}" #インスタンス変数はインスタンス内であれば使うことが可能
        # puts "hi I am #{self.name}"
        # push "hi I am #{name}" #selfを省略
    end
end

ito = User.new("ito")
ito.name = "miku"
p ito.name
ito.sayHi #メソッドを受け取っているオブジェクトをレシーバーと呼ぶ

# mob = User.new("mob")
# mob.sayHi


#クラスメソッド、クラス変数

class User

    @@count = 0 #クラス変数には@@

    VERSION = 1.1

    def initialize(name)
        @@count += 1
        @name = name
    end

    def sayHi
        puts "hi i am #{@name}" #これはインスタンスメソッド
    end

    def self.info
        puts "#{VERSION}: User class , #{@@count} instances"
    end

    ito = User.new("ito")
    nan = User.new("nan")
    toyota = User.new("toyota")
    User.info

end
p User::VERSION #クラスの外での使い方


#クラス継承
class User

    def initialize(name)
        @name = name
    end

    def sayHi
        puts "hi i am #{@name}"
    end

end

#User:親,superクラス
#AdminUser:子,subクラス
class AdminUser < User

    def sayhello
        puts "hello from #{@name}"
    end

    #override(子クラスでの書き換え)
    def sayHi
        puts "hi from admin"
    end

end
tom = AdminUser.new("tom")
tom.sayHi
tom.sayhello

#アクセス権
#public
#protected
#private:レシーバーを指定できない

class User
    
    def sayHi
        puts "hi"
        sayprivate #必ずself省略
    end

    private

        def sayprivate
            puts "private"
        end

end

class AdminUser < User

    def sayhello
        puts "hello"
        sayprivate
    end

    def sayprivate
        puts "private from Admin"
    end

end

#User.new.sayprivateにはアクセスできない
User.new.sayHi
AdminUser.new.sayhello

#module..メソッドや定数をまとめれるものだが、インスタンスを作ったり継承したりできない
#関連するメソッドや定数をまとめてグループ化に便利
#名前空間として使う

def movie_encode
end

def movie_export
end

module Movie

    VERSION = 1.1

    def self.encode
        puts "encoding..."
    end

    def self.export
        puts "exporting..."
    end

end

Movie.encode
Movie.export
p Movie::VERSION

#module
#ミックスインについて
#継承関係にない複数のクラスに同じ機能を提供

module Debug

    def info #selfを付けないことにより単にインスタンスメソッドになり、他のクラスのインスタンスメソッドとしてため込むことが出来る。これをミックスインと
        puts "#{self.class} debug info"
    end
end

class Player
    include Debug
end

class Monster
    include Debug
end

Player.new.info
Monster.new.info

=end

#例外処理

class MyError < StandardError; end #自分で作った例外
#rubyの標準的なエラーのクラス:StandardError

x = gets.to_i

begin
    if x == 3
        raise MyError
    end
    p 100 / x
rescue MyError
    puts "not 3"
rescue => ex #発生した例外をオブジェクト(今回はex)に入れる
    p ex.message #エラーメッセージ表示
    p ex.class #クラス名表示
    puts "stopped"
ensure
    puts "--END--"
end