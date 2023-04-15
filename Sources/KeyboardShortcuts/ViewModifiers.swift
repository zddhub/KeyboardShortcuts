import SwiftUI

@available(macOS 12, *)
extension View {
	/**
	Register a listener for keyboard shortcut events with the given name.

	You can safely call this even if the user has not yet set a keyboard shortcut. It will just be inactive until they do.

	The listener will stop automatically when the view disappears.

	- Note: This method is not affected by `.removeAllHandlers()`.
	*/
	@MainActor
	public func onKeyboardShortcut(_ shortcut: KeyboardShortcuts.Name, perform: @escaping (KeyboardShortcuts.EventType) -> Void) -> some View {
		task {
			for await eventType in KeyboardShortcuts.events(for: shortcut) {
				perform(eventType)
			}
		}
	}

	/**
	Register a listener for keyboard shortcut events with the given name and type.

	You can safely call this even if the user has not yet set a keyboard shortcut. It will just be inactive until they do.

	The listener will stop automatically when the view disappears.

	- Note: This method is not affected by `.removeAllHandlers()`.
	*/
	@MainActor
	public func onKeyboardShortcut(_ shortcut: KeyboardShortcuts.Name, type: KeyboardShortcuts.EventType, perform: @escaping () -> Void) -> some View {
		task {
			for await _ in KeyboardShortcuts.events(type, for: shortcut) {
				perform()
			}
		}
	}

  @MainActor
  public func keyboardShortcut(for name: KeyboardShortcuts.Name) -> some View {
    modifier(ShortcutViewModifier(for: name))
  }

  public func onKeyboardShortcut(for name: KeyboardShortcuts.Name) -> some View {
      if let shortcut = name.shortcut {
          if let keyEquivalent = shortcut.toKeyEquivalent() {
              return AnyView(self.keyboardShortcut(keyEquivalent, modifiers: shortcut.toEventModifiers()))
          }
      }
      return AnyView(self)
  }
}
