import SwiftUI
import KeyboardShortcuts

@main
struct AppMain: App {
	var body: some Scene {
		WindowGroup {
			MainScreen()
				.task {
					AppState.shared.createMenus()
				}
		}
    .commands {
      CommandMenu("Test Command") {
        Button("Shortcut 1") {
        }
        .keyboardShortcut(for: .testShortcut1)

        Button("Shortcut 2") {
        }
        .keyboardShortcut(for: .testShortcut2)
      }
    }
	}
}
