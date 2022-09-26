//
//  ContentView.swift
//  MetaBallAnimation
//
//  Created by Ahmed Nagy on 26/09/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		 NavigationView {
			 Home()
				 .preferredColorScheme(.dark)
		 }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
