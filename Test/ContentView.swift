//
//  ContentView.swift
//  Test
//
//  Created by 류기현 on 7/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var number = 10
    // @State : 변수의 변화를 화면에 적용시킬 수 있음
    
    var body: some View {
//        ZStack {    // 수직 : VStack, 수평 : HStack, 앞뒤 : ZStack
//            Rectangle()
//                .fill(.green)
//                .frame(width: 200, height: 200)
//                .zIndex(1)  // .zIndex(1) : ZStack에서 사용 가능우선순위 1 숫자가 클 수록 우선순위가 높아짐
//
//            Rectangle()
//                .fill(.red)
//                .frame(width: 200, height: 200)
//                .zIndex(2)
//        }
//        
//        VStack {
//            Text("안녕하세요")
//                .font(.title)
//                .foregroundStyle(.blue)
//        }
        
        VStack {
            Text("숫자 : \(number)")
            
            HStack {
                Button(action: {
                    number -= 1
                }, label: {
                    Text("-")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.white)
//                        .padding(20)     // 순서 중요! -> .background 아래로 들어가게 되면 적용 X
                        .frame(width: 70, height: 70)   // 순서 중요! -> .background 아래로 들어가게 되면 적용 X
                        .background(.blue)
                })
                
                Button(action: {
                    number += 1
                }, label: {
                    Text("+")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.white)
                        .frame(width: 70, height: 70)
                        .background(.blue)
                })
            }
        }
        
    }
}

#Preview {
    ContentView()
}
