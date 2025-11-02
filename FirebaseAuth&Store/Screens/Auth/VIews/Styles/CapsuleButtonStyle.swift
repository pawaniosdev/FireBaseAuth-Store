//
//  CapsuleButtonStyle.swift
//  FirebaseAuth&Store
//
//  Created by Pawan kumar Verma on 18/10/25.
//
import SwiftUI

struct CapsuleButtonStyle: ButtonStyle {
    var bgColor: Color = .teal
    var fontColor: Color = .white
    var hasStroke: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .font(.subheadline)
            .foregroundStyle(fontColor)
            .frame(height: hasStroke ? 50 : 55)
            .frame(maxWidth: .infinity)
            .background (
                Capsule().foregroundStyle(bgColor)
            )
            .scaleEffect( configuration.isPressed ? 0.95: 1)
            .overlay {
                if hasStroke {
                    Capsule()
                        .stroke()
                        .foregroundStyle(.gray)
                        
                }
            }
    }
    
}
