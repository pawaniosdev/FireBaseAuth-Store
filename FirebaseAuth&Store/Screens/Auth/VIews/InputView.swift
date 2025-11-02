//
//  InputView.swift
//  FirebaseAuth&Store
//
//  Created by Pawan kumar Verma on 18/10/25.
//

import SwiftUI

struct InputView: View {
    var placholder: String
    var isSecureField: Bool = false
    @Binding var text: String
    
    var body: some View {
        if isSecureField {
            SecureField(placholder, text: $text)
        } else {
            TextField(placholder, text: $text)
        } 
        Divider()
    }
}

#Preview {
    InputView(placholder: "type here...", text: .constant(""))
}
