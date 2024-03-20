// swift-tools-version:5.9
import PackageDescription

let package = Package(
	name: "KeyboardShortcuts",
	defaultLocalization: "en",
	platforms: [
		.macOS(.v10_15)
	],
	products: [
		.library(
			name: "KeyboardShortcuts",
			targets: [
				"KeyboardShortcuts"
			]
		)
	],
	targets: [
		.target(
			name: "KeyboardShortcuts",
      resources: [.copy("PrivacyInfo.xcprivacy")]
		),
		.testTarget(
			name: "KeyboardShortcutsTests",
			dependencies: [
				"KeyboardShortcuts"
			]
		)
	]
)
