//
//  ContentView.swift
//  suids
//
//  Created by samuelematias on 12/12/23.
//

import SwiftUI

struct ContentView: View {   
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
