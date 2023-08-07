//
//  ScoreView.swift
//  Quiz
//
//  Created by Saeed Jassim on 27/07/2023.
//

import SwiftUI

struct ScoreView: View {
    
    var score: Int
    var totalQuestion: Int
    
    var body: some View {
        VStack {
            Text("You got")
                .bold()
                .font(.title)
            Text("\(score)/\(totalQuestion)")
                .font(.title2)
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 3, totalQuestion: 4)
    }
}
