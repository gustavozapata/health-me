//
//  CardDetailsView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 24/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct CardDetailsView: View {
    
    @State var cardNumber = ""
    @State var cardHolder = ""
    @State var cardExpiresMonth = ""
    @State var cardExpiresYear = ""
    @State var cardCVV = ""
    @State var isFlipped = false
    
    @ObservedObject private var keyboard = KeyboardResponder()
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    VStack {
                        Header(title: "Payment", subtitle: "Enter your payment details")
                    }
                    
                    //Image("card").resizable().aspectRatio(contentMode: .fit).frame(width: 300)
                    
                    CreditCard(cardNumber: $cardNumber, cardHolder: $cardHolder, cardExpiresMonth: $cardExpiresMonth, cardExpiresYear: $cardExpiresYear, cardCVV: $cardCVV, isFlipped: $isFlipped)
                    
                    //Form
                    VStack {
                        VStack(alignment: .leading, spacing: 7) {
                            Text("CARD NUMBER").fontWeight(.bold).font(.system(size: 15))
                            TextField("", text: $cardNumber, onEditingChanged: { (editedText) in
                                if self.cardNumber.count > 3 && self.cardNumber.count < 6 {
                                    //IF CARD NUM IS MORE THAN 4 -> ADD A SPACE
                                }
                            }).keyboardType(.numberPad).frame(height: 42)
                                .padding([.leading, .trailing], 4)
                                .cornerRadius(16)
                                .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color(red: 97/255, green: 137/255, blue: 240/255), lineWidth: 2))
                        }.padding(.bottom, 6)
                        VStack(alignment: .leading, spacing: 7) {
                            Text("CARD HOLDER").fontWeight(.bold).font(.system(size: 15))
                            TextField("", text: $cardHolder).frame(height: 42)
                                .padding([.leading, .trailing], 4)
                                .cornerRadius(16)
                                .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color(red: 97/255, green: 137/255, blue: 240/255), lineWidth: 2))
                        }.padding(.bottom, 6)
                        HStack {
                            VStack(alignment: .leading, spacing: 7) {
                                Text("EXPIRES").fontWeight(.bold).font(.system(size: 15))
                                HStack {
                                    TextField("MONTH", text: $cardExpiresMonth).frame(width: 60, height: 42).keyboardType(.numberPad).font(.system(size: 15, weight: .bold)).foregroundColor(Color(red: 119/255, green: 119/255, blue: 119/255))
                                        .padding([.leading, .trailing], 4)
                                        .cornerRadius(16)
                                        .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color(red: 97/255, green: 137/255, blue: 240/255), lineWidth: 2))
                                    TextField("YEAR", text: $cardExpiresYear).keyboardType(.numberPad).frame(width: 60, height: 42)
                                        .font(.system(size: 15, weight: .bold)).foregroundColor(Color(red: 119/255, green: 119/255, blue: 119/255))
                                        .padding([.leading, .trailing], 4)
                                        .cornerRadius(16)
                                        .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color(red: 97/255, green: 137/255, blue: 240/255), lineWidth: 2))
                                }
                            }
                            Spacer()
                            VStack(alignment: .leading, spacing: 7)  {
                                Text("CVV").fontWeight(.bold).font(.system(size: 15))
                                TextField("", text: $cardCVV, onEditingChanged: { (editingChange) in
                                    if editingChange {
                                        self.isFlipped = true
                                        print("focus added")
                                    } else {
                                        self.isFlipped = false
                                        print("focus removed")
                                    }
                                }).keyboardType(.numberPad).frame(width: 75,height: 42)
                                    .padding([.leading, .trailing], 4)
                                    .cornerRadius(16)
                                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color(red: 97/255, green: 137/255, blue: 240/255), lineWidth: 2))
                            }
                            
                        }.padding(.bottom, 30)
                        
                        //BookTestButton()
                        NavigationLink(destination: ReviewView()){
                            Text("Next").padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30)).background(Color.white).cornerRadius(22).font(.system(size: 20, weight: .bold))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 22)
                                        .stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 67/255, blue: 66/255), Color(red: 255/255, green: 150/255, blue: 1/255), Color(red: 1/255, green: 167/255, blue: 167/255), Color(red: 1/255, green: 135/255, blue: 144/255), Color(red: 239/255, green: 55/255, blue: 11/255)]), startPoint: .leading, endPoint: .trailing), lineWidth: 4)
                            ).font(.system(size: 17, weight: .semibold)).foregroundColor(Color.primary)
                        }
                        
                        Text("You won’t be charged. Next to review page").font(.system(size: 14)).foregroundColor(Color.gray).padding(.top, 15)
                        
                    }.padding(25)
                    
                }.padding(.bottom, keyboard.currentHeight)
                    .edgesIgnoringSafeArea(.bottom)
                    .animation(.easeOut(duration: 0.16))
            }
            .navigationBarTitle("Book Test")
        }
    }
}

struct CardDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailsView()
    }
}


final class KeyboardResponder: ObservableObject {
    private var notificationCenter: NotificationCenter
    @Published private(set) var currentHeight: CGFloat = 0
    
    init(center: NotificationCenter = .default) {
        notificationCenter = center
        notificationCenter.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        notificationCenter.removeObserver(self)
    }
    
    @objc func keyBoardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            currentHeight = keyboardSize.height
        }
    }
    
    @objc func keyBoardWillHide(notification: Notification) {
        currentHeight = 0
    }
}
