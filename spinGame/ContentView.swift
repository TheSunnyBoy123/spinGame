//adding test
//  ContentView.swift
//  spinGame
//
//  Created by Rajesh Patel on 05/10/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var credits = 1000
    private var bet = 5
    @State private var curColor = 0
    
    
    var frontColor = [#colorLiteral(red: 0.3568627451, green: 0.5176470588, blue: 0.6941176471, alpha: 1), #colorLiteral(red: 0.4078431373, green: 0.2784313725, blue: 0.5764705882, alpha: 1), #colorLiteral(red: 0.6784313725, green: 0.937254902, blue: 0.8196078431, alpha: 1), #colorLiteral(red: 0.8901960784, green: 0.6235294118, blue: 0.5529411765, alpha: 1), #colorLiteral(red: 0, green: 0.1254901961, blue: 0.2470588235, alpha: 1)]
    var backColor = [#colorLiteral(red: 0.9882352941, green: 0.4666666667, blue: 0.4156862745, alpha: 1), #colorLiteral(red: 0.8901960784, green: 0.6235294118, blue: 0.5529411765, alpha: 1), #colorLiteral(red: 0, green: 0.1254901961, blue: 0.2470588235, alpha: 1), #colorLiteral(red: 0.4078431373, green: 0.2784313725, blue: 0.5764705882, alpha: 1), #colorLiteral(red: 0.6784313725, green: 0.937254902, blue: 0.8196078431, alpha: 1)]
    @State private var backgrounds = [Color.white, Color.white, Color.white]
    @State private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = [0, 0, 0]
    
    var body: some View {
        
        
        ZStack{
            Rectangle()
                .foregroundColor(Color(frontColor[curColor]))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Rectangle()
                .foregroundColor(Color(backColor[curColor]))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            
            VStack{
                Spacer()
                HStack{
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.white)
                    
                    Text("Jackpot Game")
                        .bold()
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.white)
                    
                }.scaleEffect(2)
                
                Spacer()
                
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.25))
                    .cornerRadius(20)
                
                Spacer()
                
                HStack{
                    Spacer()
                    
                    cardView(symbol: $symbols[numbers[0]], background: $backgrounds[0])
                    cardView(symbol: $symbols[numbers[1]], background: $backgrounds[1])
                    cardView(symbol: $symbols[numbers[2]], background: $backgrounds[2])
                    
                    Spacer()
                }
                
                Spacer()
                
                Button(action: {
                    
                    self.backgrounds = self.backgrounds.map{ _ in Color.white
                    }
                    
                    self.numbers = self.numbers.map({ _ in
                        Int.random(in: 0...self.symbols.count-1)
                    })
                    
                    
                    
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2]{
                        self.credits += self.bet * 10
                        

                        self.backgrounds[0] = Color.green
                        self.backgrounds[1] = Color.green
                        self.backgrounds[2] = Color.green
                    }
                    else{
                        self.credits -= self.bet
                    }
                }, label: {
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding([.leading, .trailing], 30)
                        .background(Color.pink)
                        .cornerRadius(20)
                })
                Button(action: {
                    if(self.curColor == backColor.count-1){
                        self.curColor = 0
                    }
                    else{
                        self.curColor += 1
                    }
                    
                }, label: {
                    Text("Change Color Theme")
                        .bold()
                        .foregroundColor(.white)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 10)
                        .background(Color(backColor[curColor]))
                })
                .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone X"))
        }
    }
}
