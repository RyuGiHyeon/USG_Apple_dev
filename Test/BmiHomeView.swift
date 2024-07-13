//
//  BmiHomeView.swift
//  Test
//
//  Created by 류기현 on 7/11/24.
//

import SwiftUI

struct BmiHomeView: View {
    
    @State var height:String = ""
    @State var weight:String = ""
    @State var name:String = ""
    @State var bmi:Double = 0.0
    
    func calBmi(height:String, weight:String) -> Double {
        let h = Double(height) ?? 1.0
        let w = Double(weight) ?? 0.0
        
        return w / (h * h) * 10000
    }
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    Text("키")
                        .frame(width: 45)
                    
                    Spacer()
                    
                    TextField("cm 단위로 작성", text: $height)
                        .keyboardType(.decimalPad)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                }.frame(width: 300, height: 50)
                
                HStack {
                    
                    Spacer()
                    
                    Text("몸무게")
                        .frame(width: 45)
                    
                    Spacer()
                    
                    TextField("kg 단위로 작성", text: $weight)
                        .keyboardType(.decimalPad)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                }.frame(width: 300, height: 50)
                
                HStack {
                    
                    Spacer()
                    
                    Text("이름")
                        .frame(width: 45)
                    
                    Spacer()
                    
                    TextField("홍길동", text: $name)
                        .keyboardType(.default)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                }.frame(width: 300, height: 50)
                
                Spacer()
                
                NavigationLink {
                    BmiResult(bmi: $bmi, name: $name)
                        .onAppear(perform: {
                            bmi = calBmi(height: height, weight: weight)
                        })
                    
                } label: {
                    Text("결과 보기")
                        .bold()
                        .foregroundStyle(.blue)
                }
            }
        }
    }
}

struct BmiResult: View {
    
    @Binding var bmi:Double
    @Binding var name:String
    var result:String = "비만" // 저체중, 정상, 과제충, 1단계 비만, 2단계 비만, 3단계 비만
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                Spacer()
                
                HStack {
                    Text("BMI")
                        .frame(width: 45)
                    
                    Spacer()
                    
                    let formattedBmi = String(format: "%.1f", bmi)

                    Text("\(formattedBmi)")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color(red: 0.76, green: 0.76, blue: 0.76), lineWidth: 0.35)
                                .frame(width: 230, height: 33.6)
                        )
                }.frame(width: 300, height: 50)
                
                VStack {
                    
                    switch bmi {
                    case 10..<18.5:
                        Text("\(name), 당신은 저체중 입니다!")
                        
                        Image("underweight")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 400)
                        
                        Text("건강을 위해 조금 더 드셔야 할 것 같아요!")
                    
                    case 18.5..<24.9:
                        Text("\(name), 당신은 정상체중 입니다!")
                        
                        Image("normal")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 400)

                        Text("현재 체중을 잘 유지하고 계시네요!")
                    
                    case 25..<29.9:
                        Text("\(name), 당신은 과체중 입니다!")
                        
                        Image("overweight")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 400)
                        
                        Text("조금 더 운동하고 식단에 신경 쓰면 좋을 것 같아요!")
                        
                    case 30..<34.9:
                        Text("\(name), 당신은 1단계 비만 입니다!")
                        
                        Image("obese")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 400)
                        
                        Text("건강을 위해 운동을 시작해보시면 좋겠어요!")
                        
                    case 35..<100:
                        Text("\(name), 당신은 2단계 비만 입니다!")
                        
                        Image("extremelyObese")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 400)
                        
                        Text("건강을 위해 꼭 체중 관리를 시작하세요!")
                        
                    default:
                        Text("잘못된 값 입니다!")
                        
                        Image("fault")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 400)
                        
                        Text("입력 값을 확인하고 다시 입력해주세요!")
                    }
                    
                }
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("저장")
                        .bold()
                        .foregroundStyle(.blue)
                })
            }
        }
    }
}

#Preview {
//    BmiResult(bmi: .constant(20.0), name: .constant("류기현"))
    BmiHomeView()
}

