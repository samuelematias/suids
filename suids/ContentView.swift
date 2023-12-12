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
        
        VStack(alignment: .center, spacing: 24) {
            
            Spacer()
            
            Text("Buttons")
                .font(Font.Typography.sizingFont(font: .main, size: .title))
                .foregroundColor(Color.Token.textTheme)
            
            Spacer()
             
            Button(action: {
                self.showModal = true
            }) {
                TokenButtonLabel(name: "plus-icon", iconSize: .medium)
            }
            .buttonStyle(TokenButtonStyle(iconSize: .medium, backgroundColor: .theme))
            .sheet(isPresented: $showModal) {
                SheetView()
            }
            
            Button(action: {
                self.showModal = true
            }) {
                self.CircleButtonPrimary.buttonLabel
            }
            .buttonStyle(self.CircleButtonPrimary.buttonStyle)
            .sheet(isPresented: $showModal) {
                SheetView()
            }

            Button(action: {
                self.showModal = true
            }) {
                self.CircleButtonSupport.buttonLabel
            }
            .buttonStyle(self.CircleButtonSupport.buttonStyle)
            .sheet(isPresented: $showModal) {
                SheetView()
            }
            
            Button(action: {
                self.showModal = true
            }) {
                self.IconButton.buttonLabel
            }
            .buttonStyle(self.IconButton.buttonStyle)
            .sheet(isPresented: $showModal) {
                SheetView()
            }

            Button(action: {
                self.showModal = true
            }) {
                self.CapsuleButton.buttonLabel
            }
            .buttonStyle(self.CapsuleButton.buttonStyle)
            .sheet(isPresented: $showModal) {
                SheetView()
            }

            Button(action: {
                self.showModal = true
            }) {
                self.TextButton.buttonLabel
            }
            .buttonStyle(self.TextButton.buttonStyle)
            .sheet(isPresented: $showModal) {
                SheetView()
            }
            
            Spacer()
        }
    }
}

struct SheetView: View {
   @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
           Button {
              dismiss()
           } label: {
               Image(systemName: "xmark.circle")
                 .font(.largeTitle)
                 .foregroundColor(.gray)
           }
         }
         .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
         .padding()
    }
}

//#if DEBUG
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .environment(\.font, Font.Typography.mainFont)
//            .environment(\.colorScheme, .light)
//            .background(Color.Token.backgroundDefault)
//    }
//}
//#endif
