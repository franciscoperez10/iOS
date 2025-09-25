//
//  AuthorsView.swift
//  TP_IOS_Francisco_Roberto
//
//  Created by MultiLab PRT 03 on 23/09/2025.
//

import SwiftUI

struct AuthorsView: View {
    var body: some View {
        ZStack {
            Image("authorsBackground")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            
            VStack {
                Text("Copyright:")
                    .foregroundStyle(.black)
                Text("Francisco Perez & Roberto Couto®")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .padding()
                    .multilineTextAlignment(.center)
                Text("Autoavaliação: Francisco: 19,7")
                Text("Autoavaliação: Roberto: 19,7")
                Spacer()
        
                Text("September 2025")
                    .foregroundStyle(.black)
                Text("All rights reserved")
                    
            }
        }
        
    }
}

#Preview {
    AuthorsView()
}
