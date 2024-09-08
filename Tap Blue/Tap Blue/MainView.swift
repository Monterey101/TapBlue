//
//  ContentView.swift
//  Tap Blue
//
//  Created by Kristian Kocic on 13/4/2023.
//

import SwiftUI

struct MainView: View {
    
    func GetColor() -> Color {
        let Roll = Int.random(in: 1...2)
        if Roll == 2 {
            return .blue
        }
        return .red
    }
    
    func CheckHighScore() {
        if points > HighScore {
            HighScore = points
        }
    }
    
    @State var RealColour: Color = .blue
    @State var Colour: Color = .gray
    @State var Size = 0.6
    @State var guess: Color = .white
    @State var Guessed: Bool = false
    @State var points: Int = 0
    @AppStorage ("highScore") var HighScore: Int = 0
    @State var PointsColour: Color = .gray
    
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack {
                    HStack {
                        Spacer()
                        NavigationLink {
                            SettingsView(Highscore: HighScore)
                        } label: {
                            Image(systemName: "gearshape.fill").foregroundStyle(Color(.gray))
                        }
                            .scaleEffect(2)
                    }.padding([.top, .trailing], 30)
                    Spacer()
                }.zIndex(1).foregroundColor(PointsColour)
                
                VStack {
                    HStack {
                        if points >= HighScore {
                            Image(systemName: "crown.fill")
                                .foregroundColor(.orange)
                        }
                        Text("\(points)")
                            .font(.system(size: 50))
                            .foregroundColor(PointsColour)
                    }.padding([.top, .bottom], 75)
                    Spacer()
                }.zIndex(2)
                
                VStack {
                    
                    Spacer()
                    
                    
                    ZStack {
                        
                        Circle()
                            .fill(Colour)
                            .scaleEffect(Size)
                            .zIndex(1)
                        
                        Text("Blue?")
                            .bold()
                            .foregroundColor(.white)
                            .font(.system(size: 50))
                        
                    }.zIndex(1)
                    
                    HStack {
                        
                        Button {
                            guess = .red
                            Guessed = true
                            withAnimation(.default) {
                                Size = 3
                                PointsColour = .white
                                Colour = RealColour
                            }
                            if guess == RealColour {
                                points += 1
                            } else {
                                points = 0
                            }
                            CheckHighScore()
                        } label : {
                            ButtonView(Lname: "Red", Colour: .red)
                        }
                        
                        Button {
                            guess = .blue
                            Guessed = true
                            withAnimation(.default) {
                                Size = 3
                                PointsColour = .white
                                Colour = RealColour
                            }
                            if guess == RealColour {
                                points += 1
                            } else {
                                points = 0
                            }
                            CheckHighScore()
                        } label : {
                            ButtonView(Lname: "Blue", Colour: .blue)
                        }
                    }
                    Spacer()
                }
                
                if Guessed {
                    VStack {
                        Spacer()
                        
                        if guess == RealColour {
                            MessageView(win: true, revealed: RealColour)
                        } else {
                            MessageView(win: false, revealed: RealColour)
                        }
                        
                        Button {
                            withAnimation {
                                Guessed = false
                                guess = .white
                                Size = 0.6
                                Colour = .gray
                                PointsColour = .gray
                                RealColour = GetColor()
                            }
                        } label: {
                            Text("Play Again")
                                .bold()
                                .frame(width: 207, height: 50)
                                .background(.white)
                                .foregroundColor(.blue)
                                .cornerRadius(25)
                            
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

struct ButtonView: View {
    
    var Lname: String
    var Colour: Color
    
    var body: some View {
        Text(Lname)
            .bold()
            .frame(width: 100, height: 50)
            .background(Colour)
            .foregroundColor(.white)
            .cornerRadius(25)
    }
}

struct MessageView: View {
    
    var win: Bool
    var revealed: Color
    
    var body: some View {
        
        ZStack {
            Circle()
                .fill(win ? .green : .white).opacity(win ? 1 : 0)
                .scaleEffect(0.3)
            
            Text(win ? "+1" : "Uh-oh...")
                .bold()
                .foregroundColor(.white)
                .font(.system(size: 50))
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
