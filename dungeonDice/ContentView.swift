//
//  ContentView.swift
//  dungeonDice
//
//  Created by Jonathan Wheeler Jr. on 2/19/23.
//

import SwiftUI

struct ContentView: View {
    enum Dice: Int, CaseIterable {
        case four = 4
        case six = 6
        case eight = 8
        case ten = 10
        case twelve = 12
        case twenty = 20
        case hundred = 100
        
        func roll() -> Int {
            return Int.random(in: 1...self.rawValue)
        }
    }
    
    @State private var resultMessage = ""
    
    var body: some View {
        VStack {
            Text("Dungeon Dice")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.red)
            
            Spacer()
            
            Text(resultMessage)
                .font(.largeTitle)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .frame(height: 150)
            
            Spacer()
            
            ForEach(Dice.allCases, id: \.self) { die in
                Button("\(die.rawValue)-sided") {
                    resultMessage = "You rolled a \(die.roll()) on a \(die.rawValue)-sided dice."
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
