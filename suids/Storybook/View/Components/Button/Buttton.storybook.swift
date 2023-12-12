//
//  Buttton.storybook.swift
//  suids
//
//  Created by samuelematias on 12/12/23.
//

import SwiftUI

struct Buttton_storybook: View {
    @State private var showModal = false
    
    let CircleButtonPrimary = TokenButton(circleButtonType: .primary, buttonIcon: "plus-icon")
    let CircleButtonSupport = TokenButton(circleButtonType: .support, buttonIcon: "plus-icon")
    let IconButton = TokenButton(buttonIcon: "share-icon")
    let CapsuleButton = TokenButton(capsuleText: "Send")
    let TextButton = TokenButton(buttonText: "Terms of use")
    
    var body: some View {
        
        ScrollView() {
            
            Spacer()
            
            Text("Button")
                .font(Font.Typography.sizingFont(font: .main, size: .title))
                .foregroundColor(Color.Token.textTheme)
            
            Spacer()
             
            Button(action: {
                self.showModal = true
            }) {
                TokenButtonLabel(name: "plus-icon", iconSize: .medium)
            }
            .accessibility(identifier: "CustomButton")
            .buttonStyle(TokenButtonStyle(iconSize: .medium, backgroundColor: .theme))
            .sheet(isPresented: $showModal) {
                SheetView()
            }
            
            Button(action: {
                self.showModal = true
            }) {
                self.CircleButtonPrimary.buttonLabel
            }
            .accessibility(identifier: "CircleButtonPrimary")
            .buttonStyle(self.CircleButtonPrimary.buttonStyle)
            .sheet(isPresented: $showModal) {
                SheetView()
            }

            Button(action: {
                self.showModal = true
            }) {
                self.CircleButtonSupport.buttonLabel
            }
            .accessibility(identifier: "CircleButtonSupport")
            .buttonStyle(self.CircleButtonSupport.buttonStyle)
            .sheet(isPresented: $showModal) {
                SheetView()
            }
            
            Button(action: {
                self.showModal = true
            }) {
                self.IconButton.buttonLabel
            }
            .accessibility(identifier: "IconButton")
            .buttonStyle(self.IconButton.buttonStyle)
            .sheet(isPresented: $showModal) {
                SheetView()
            }

            Button(action: {
                self.showModal = true
            }) {
                self.CapsuleButton.buttonLabel
            }
            .accessibility(identifier: "CapsuleButton")
            .buttonStyle(self.CapsuleButton.buttonStyle)
            .sheet(isPresented: $showModal) {
                SheetView()
            }

            Button(action: {
                self.showModal = true
            }) {
                self.TextButton.buttonLabel
            }
            .accessibility(identifier: "TextButton")
            .buttonStyle(self.TextButton.buttonStyle)
            .sheet(isPresented: $showModal) {
                SheetView()
            }
            
            
        }
        .padding()
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
           .accessibility(identifier: "modalCloseButton")
         }
         .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
         .padding()
        
        VStack (alignment: .center){
            Text("Button Component")
                .font(.title)
                .padding(.top)
            Spacer()
        }
    }
}

struct Buttton_storybook_Previews: PreviewProvider {
    static var previews: some View {
        Buttton_storybook()
    }
}
