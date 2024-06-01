#!/bin/bash
#flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
flutter pub get && dart run build_runner build

openapi-generator-cli generate -i http://localhost:8080/v3/api-docs -g dart -o /Users/mac/AndroidStudioProjects/kenmack/kenmack_api

openapi-generator-cli generate -i http://104.248.3.252:8080/v3/api-docs -g dart -o /Users/mac/AndroidStudioProjects/kenmack/kenmack_api

openapi-generator-cli generate -i http://164.92.72.50:8081/v3/api-docs -g dart -o /Users/mac/AndroidStudioProjects/kenmack/kenmack_api

openapi-generator-cli generate -i http://stage.datride.com/api-docs -g dart -o /Users/mac/AndroidStudioProjects/kenmack/datride_api
openapi-generator-cli generate -i http://localhost:3000/api-docs -g dart -o /Users/mac/AndroidStudioProjects/kenmack/datride_api

#flutter pub run build_runner build --delete-conflicting-outputs