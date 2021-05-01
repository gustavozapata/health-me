//
//  PrivacyView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 11/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct PasscodeView: View {
    @ObservedObject var account: AccountViewModel = .account
    @State var pass = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Enter Passcode").font(.system(size: 18, weight: .medium))
                HStack(spacing: 20) {
                    Group {
                        if pass.count > 0 {
                            Circle().fill(Color.green)
                        } else {
                            Circle().stroke(Color.green, lineWidth: 2)
                        }
                        if pass.count > 1 {
                            Circle().fill(Color.green)
                        } else {
                            Circle().stroke(Color.green, lineWidth: 2)
                        }
                        if pass.count > 2 {
                            Circle().fill(Color.green)
                        } else {
                            Circle().stroke(Color.green, lineWidth: 2)
                        }
                        if pass.count > 3 {
                            Circle().fill(Color.green)
                        } else {
                            Circle().stroke(Color.green, lineWidth: 2)
                        }
                    }.frame(width: 15, height: 15)
                }
            }.padding(.bottom, 30)
            VStack(spacing: 60) {
                HStack(spacing: 65) {
                    Text("1").font(.system(size: 25))
                        .background(Circle().stroke(Color.black, lineWidth: 1).frame(width: 60, height: 60))
                        .onTapGesture {
                            pass = pass + "1"
                            checkPasscode()
                        }
                    Text("2").font(.system(size: 25))
                        .background(Circle().stroke(Color.black, lineWidth: 1).frame(width: 60, height: 60))
                        .onTapGesture {
                            pass = pass + "2"
                            checkPasscode()
                        }
                    Text("3").font(.system(size: 25))
                        .background(Circle().stroke(Color.black, lineWidth: 1).frame(width: 60, height: 60))
                        .onTapGesture {
                            pass = pass + "3"
                            checkPasscode()
                        }
                }
                HStack(spacing: 65) {
                    Text("4").font(.system(size: 25))
                        .background(Circle().stroke(Color.black, lineWidth: 1).frame(width: 60, height: 60))
                        .onTapGesture {
                            pass = pass + "4"
                            checkPasscode()
                        }
                    Text("5").font(.system(size: 25))
                        .background(Circle().stroke(Color.black, lineWidth: 1).frame(width: 60, height: 60))
                        .onTapGesture {
                            pass = pass + "5"
                            checkPasscode()
                        }
                    Text("6").font(.system(size: 25))
                        .background(Circle().stroke(Color.black, lineWidth: 1).frame(width: 60, height: 60))
                        .onTapGesture {
                            pass = pass + "6"
                            checkPasscode()
                        }
                }
                HStack(spacing: 65) {
                    Text("7").font(.system(size: 25))
                        .background(Circle().stroke(Color.black, lineWidth: 1).frame(width: 60, height: 60))
                        .onTapGesture {
                            pass = pass + "7"
                            checkPasscode()
                        }
                    Text("8").font(.system(size: 25))
                        .background(Circle().stroke(Color.black, lineWidth: 1).frame(width: 60, height: 60))
                        .onTapGesture {
                            pass = pass + "8"
                            checkPasscode()
                        }
                    Text("9").font(.system(size: 25))
                        .background(Circle().stroke(Color.black, lineWidth: 1).frame(width: 60, height: 60))
                        .onTapGesture {
                            pass = pass + "9"
                            checkPasscode()
                        }
                }
                HStack(spacing: pass.count > 0 ? 83 : 80) {
                    Spacer()
                    Text("0").font(.system(size: 25))
                        .background(Circle().stroke(Color.black, lineWidth: 1).frame(width: 60, height: 60))
                        .onTapGesture {
                            pass = pass + "0"
                            checkPasscode()
                        }
                    Text(pass.count > 0 ? "Delete" : "Cancel").padding(.trailing, 30).onTapGesture {
                        if pass.count > 0 {
                            pass = String(pass.dropLast())
                        } else {
                            account.showPassSetup = false
                        }
                    }
                }
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity).padding()
        }.padding(.top, 40)
    }
    
    func checkPasscode() {
        if pass.count > 3 {
            if UserDefaults.standard.object(forKey: "passcode") != nil { /// if localStorage exists
                if pass == UserDefaults.standard.string(forKey: "passcode"){ /// checking the passcode to allow access
                    account.showApp = true
                    account.isUnlocked = true
                } else {
                    pass = ""
                }
            } else { /// localStorage doesn't exist
                UserDefaults.standard.set(pass, forKey: "passcode") /// setting up the passcode
                account.showPassSetup = false
            }
        }
    }
}

struct PasscodeView_Previews: PreviewProvider {
    static var previews: some View {
        PasscodeView()
    }
}
