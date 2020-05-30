//
//  TextView.swift
//  Form365
//
//  Created by Karthick Selvaraj on 29/05/20.
//  Copyright © 2020 Karthick Selvaraj. All rights reserved.
//

import SwiftUI
import UIKit

struct TextView: UIViewRepresentable {
 
    @Binding var text: String
 
    func makeCoordinator() -> Coordinator {
        Coordinator($text)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
 
        textView.autocapitalizationType = .sentences
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true
        textView.delegate = context.coordinator
        textView.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        return textView
    }
 
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
}

class Coordinator: NSObject, UITextViewDelegate {
    var text: Binding<String>
 
    init(_ text: Binding<String>) {
        self.text = text
    }
 
    func textViewDidChange(_ textView: UITextView) {
        self.text.wrappedValue = textView.text
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Sample")
    }
}
