//
//  StorybookListItemDetail.swift
//  suids
//
//  Created by samuelematias on 12/12/23.
//

import SwiftUI

struct StorybookListItemDetail: View {
    let item: StorybookItem

    var body: some View {
        item.view
    }
}

struct StorybookListItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        let previewItem = StorybookItem(componentName: "Texto de Exemplo", view: AnyView(Text("Texto de Exemplo")))
        
        StorybookListItemDetail(item: previewItem)
    }
}
