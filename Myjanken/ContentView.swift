//
//  ContentView.swift
//  Myjanken
//
//  Created by 宮川卓也 on 2021/06/21.
//

import SwiftUI

struct ContentView: View {
    //@Stateを指定しているので値を更新できる状態変数名として宣言されている
    //データ型は数値の0を代入しているのでInt型になる
    @State var answerNumber = 0
    
    var body: some View {
        //背景グラデーション模様のために
        ZStack {
            self.backGroundColor().edgesIgnoringSafeArea(.all)
            
            
            
            VStack {
                //スペースを追加
                Spacer()  //高さを指定したい時は.frame(heighet:〇〇)を記載
                if answerNumber == 0 {
                    Text("これからじゃんけんをします！")
                        //                    .padding(.bottom)  //下辺に余白を設定
                        .padding(EdgeInsets(top:0, leading:16, bottom:80,trailing: 16))
                } else if answerNumber == 1 {
                    //もし数字が1だったらグー画像を指示
                    Image("gu")
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                    Spacer()
                    //じゃんけんの種類を指定
                    Text("GU")
                        .padding(EdgeInsets(top:0, leading:16, bottom:80,trailing: 16))
                } else if answerNumber == 2 {
                    //もし数字が2だったらチョキ画像を指示
                    Image("choki")
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                    Spacer()
                    Text("CHOKI")
                        .padding(EdgeInsets(top:0, leading:16, bottom:80,trailing: 16))
                } else {
                    //もし数字が1、２のどちらでもなかったらパー画像を指示
                    Image("pa")
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                    Spacer()
                    Text("PA")
                        .padding(EdgeInsets(top:0, leading:16, bottom:80,trailing: 16))
                }
                
                //じゃんけんをするボタン
                Button(action:{
                    //ボタンがタップされた時の動き
                    //                print("タップされたーよ！")
                    //次のじゃんけんへ  比較演算子ではなく代入であることに注意
                    //                answerNumber = answerNumber + 1
                    //                answerNumber = Int.random(in:1...3)
                    
                    //新しいじゃんけんの結果を一時的に格納する変数を設ける
                    var newAnswerNumber = 0
                    
                    // ランダムに結果を出すが、前回の結果と異なる場合のみ採用
                    //repeatは繰り返しを意味する
                    repeat {
                        //1.2.3 の変数をランダムに演出(乱数)
                        newAnswerNumber = Int.random(in:1...3)
                        
                        //前回と同じ結果の時は、再生成させる　異なる時だけrepeatを抜ける
                    } while answerNumber == newAnswerNumber //繰り返す条件を記載
                    
                    //新しいじゃんけんの結果を格納 ここでは代入
                    answerNumber = newAnswerNumber
                }){
                    //Buttonに表示する文字を指定
                    Text("じゃんけんする！")
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .font(.title)
                        .background(Color.black.opacity(0.7))
                        .foregroundColor(Color.white)
                }  //じゃんけんをするボタン　ここまで
            }
        }
    }
    
    /// 背景グラデーションを作成する
    private func backGroundColor() -> LinearGradient {
        // 左上から右下にポイントを設定する。
        let start = UnitPoint.init(x: 0, y: 0) // 左上(始点)
        let end = UnitPoint.init(x: 1, y: 1) // 右下(終点)
        
        // 「Color」は以前の「UIColor」からの変換もできるぞ！ 助かる。
        let colors = Gradient(colors: [Color(UIColor.blue), Color(UIColor.green)])
        
        let gradientColor = LinearGradient(gradient: colors, startPoint: start, endPoint: end)
        
        return gradientColor
    }
    
}//stract ContentView: ここまで

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
