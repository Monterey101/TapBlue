//
//  SettingsView.swift
//  Tap Blue
//
//  Created by Kristian Kocic on 15/4/2023.
//

import SwiftUI

struct SettingsView: View {
    
    @State var Highscore: Int
    
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Text("High Score: ")
            HStack {
                Image(systemName: "crown.fill")
                    .foregroundColor(.orange)
                Text("\(Highscore)")
            }
            Spacer()
            Spacer()
            Spacer()
        }.font(.system(size: 40))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(Highscore: 6)
    }
}
