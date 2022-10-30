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
      CommandMenu("Test Commands") {
        Button("Shortcut 5") {
        }
        .keyboardShortcut(for: .testShortcut5)

        Button("Shortcut 6") {
        }
        .keyboardShortcut(for: .testShortcut6)
      }
    }
	}
}
