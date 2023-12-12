//
//  StorybookListItem.swift
//  suids
//
//  Created by samuelematias on 12/12/23.
//

import SwiftUI

struct StorybookListItem: View {
    let item: StorybookItem

    var body: some View {
        Text(item.componentName)
            .font(Font.Typography.sizingFont(font: .main, size: .body))
    }
}

struct StorybookListItem_Previews: PreviewProvider {
    static var previews: some View {
        let previewItem = StorybookItem(componentName: "Texto de Exemplo", view: AnyView(Text("Texto de Exemplo")))
        
        StorybookListItem(item: previewItem)
    }
}
