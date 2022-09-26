//
//  Home.swift
//  MetaBallAnimation
//
//  Created by Ahmed Nagy on 26/09/2022.
//

import SwiftUI

struct Home: View {
	
	@State var dragOffset: CGSize = .zero
	var body: some View {
		// MARK: - Single MetaBall Animation
		NavigationView {
			VStack {
				singleMetaBall()
			}
		}.navigationTitle("MetaBall Animation")
	}
	
	@ViewBuilder
	func singleMetaBall() -> some View {
		Rectangle()
			.fill(.linearGradient(colors: [.orange, .yellow, .purple, .green], startPoint: .top, endPoint: .bottom))
			.mask {
				Canvas { context, size in
					context.addFilter(.alphaThreshold(min: 0.5, color: .white))
					// MARK: This blur raduis determine the amount of elasticity between two elements
					context.addFilter(.blur(radius: 40))
					
					// MARK: Drawing Layer
					context.drawLayer { ctx in
						// MARK: Placing Symbols
						for index in [1, 2] {
							if let resolvedView = context.resolveSymbol(id: index) {
								ctx.draw(resolvedView, at: CGPoint(x: size.width / 2, y: size.height / 2 - 75))
							}
						}
					}
				} symbols: {
					ball()
						.tag(1)
					
					ball(offset: dragOffset)
						.tag(2)
				}
			}
		
			.gesture(
				DragGesture()
					.onChanged({ value in
						dragOffset = value.translation
					}).onEnded({ _ in
						withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
							dragOffset = .zero
						}
					}))
	}
	
	@ViewBuilder
	func ball(offset: CGSize = .zero) -> some View {
		Circle()
			.fill(.white)
			.frame(width: 150, height: 150)
			.offset(offset)
	}
}

struct Home_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}



