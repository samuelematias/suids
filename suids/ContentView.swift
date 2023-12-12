//
//  ContentView.swift
//  suids
//
//  Created by samuelematias on 12/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showModal = false
    
    let CircleButtonPrimary = TokenButton(circleButtonType: .primary, buttonIcon: "plus-icon")
    let CircleButtonSupport = TokenButton(circleButtonType: .support, buttonIcon: "plus-icon")
    let IconButton = TokenButton(buttonIcon: "share-icon")
    let CapsuleButton = TokenButton(capsuleText: "Send")
    let TextButton = TokenButton(buttonText: "Terms of use")
    
    var body: some View {
        StorybookList()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.font, Font.Typography.mainFont)
            .background(Color.Token.backgroundDefault)
    }
}
#endif
