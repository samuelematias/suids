//
//  StorybookItem.swift
//  suids
//
//  Created by samuelematias on 12/12/23.
//

import Foundation
import SwiftUI

struct StorybookItem: Identifiable {
    let id = UUID()
    let componentName: String
    let view: AnyView
}
