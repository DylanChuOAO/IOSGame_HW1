//
//  ContentView.swift
//  HW1
//
//  Created by User08 on 2021/3/8.
//

import SwiftUI

var Question1:[String] =
    ["天下第一關(猜台灣地名)",
                    "天昏地暗(猜台灣地名)",
                    "仙女下凡(猜台灣地名)",
                    "四分五裂(猜台灣地名)",
                    "四季如春(猜台灣地名)",
                    "失敗之子(猜台灣地名)",
                    "兩地相隔、以木為媒(猜台灣地名)",
                    "兩好球三壞球(猜台灣地名)",
                    "忠孝仁愛信義和平(猜台灣地名)",
                    "退潮(猜台灣地名)",
                    "被拋棄的女人(猜台灣地名)",
                    "陰陽湖泊(猜台灣地名)",
                    "開張大吉(猜台灣地名)",
                    "飯桌少雙筷(猜台灣地名)",
                    "雙火雙水(猜台灣地名)",
                    "樹木高聳入天(猜台灣地名)",
                    "這裡無文盲(猜台灣地名)",
                    "你我他疊一起(猜台灣地名)",
                    "成績改錯了(猜台灣地名)",
                    "沃野千里(猜台灣地名)"]

var Answer:[String] = ["頭城","烏日","七美","九份","恆春","成功","板橋","南投","八德","汐止",
                       "野柳","日月潭","新店","基隆","淡水","雲林","士林","三重","追分","豐原"]
var Sequence:[Int] =
    [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]

struct ContentView: View {
    @State private var AnswearShow = false
    @State private var number = 0
    @State private var showingAlert = false
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack{
                Text("地理隨堂考 第" + String(number+1) + "題")
                    .font(.title).foregroundColor(.red).multilineTextAlignment(.center).padding()
                Spacer()
            }.background(Image("NewYear"))
            
            Text(Question1[Sequence[number]]).padding()
            
            HStack{
                
                Button(action: {
                    AnswearShow = true
                },label: {
                    Text("偷看答案")
                
                }).padding()
                if AnswearShow == true {
                    Text(Answer[Sequence[number]])
                        .font(.title).foregroundColor(.red).multilineTextAlignment(.center).padding()
                }
                
            }
            
            Image("cow")
            .resizable()
            .scaledToFit()
          
            HStack{
                Button(action: {
                  
                    if(number > 8){
                        showingAlert = true
                        Sequence.shuffle()
                        number = 0
                    }else{
                        number = number + 1
                        AnswearShow = false
                    }
                  
                },label: {
                    Text("下一題")
                        .font(.title)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(10.0)
                        
                }).padding(30)
                
                Button(action: {
                    Sequence.shuffle()
                    number = 0
                    AnswearShow = false
                },label: {
                    Text("再來一次")
                        .font(.title)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10.0)
                }).alert(isPresented: $showingAlert) { () -> Alert in
                    let answer = "還想再玩嗎?再來10題!"
                    return Alert(title: Text(answer))
                }.padding(30)
            }
            
        }.onAppear(perform: {
            Sequence.shuffle()
        })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
