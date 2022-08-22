//
//  SideTapView.swift
//  primitive-shape
//
//  Created by Clarence on 24/08/22.
//

import SwiftUI

struct SideTapView: View {
    var body: some View {
        VStack {
            GSViewControllerRepresentable { side in
                print(side)
                // Perform additional logic here
            }
            Button("Hi") {
                
            }
        }
    }
}

struct SideTapView_Previews: PreviewProvider {
    static var previews: some View {
        SideTapView()
    }
}
