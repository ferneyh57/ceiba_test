generate: 
		flutter pub run build_runner build --delete-conflicting-outputs

build_apk: 
		flutter build apk --release