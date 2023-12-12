//
//  StorybookList.swift
//  suids
//
//  Created by samuelematias on 12/12/23.
//

import SwiftUI

struct StorybookList: View {  
    let items: [StorybookItem] = [
        StorybookItem(componentName: "Button", view: AnyView(Buttton_storybook()))
    ]
    
    var body: some View {
        NavigationSplitView {
            Spacer()
            List(items) { item in
                NavigationLink(destination: StorybookListItemDetail(item: item)) {
                    StorybookListItem(item: item)
                }.listRowBackground(Color.Token.buttonTheme)
            }
            .scrollContentBackground(.hidden)
            .navigationTitle("Components")
        } detail: {
            Text("Select a Component")
        }
    }
}

struct StorybookList_Previews: PreviewProvider {
    static var previews: some View {
        StorybookList()
    }
}
