# Google Assistant for iOS

Google Assistant for iOS is an app that implements the Google Assistant SDK that was recently released.
Due to the 500 calls per day limitation, this won't go on the App Store.

# Installation
You'll need Xcode and a Mac.

• Clone this repository

• Run 'pod install'

• Open 'Google Assistant.xcworkspace' in Xcode

• Select the topmost row in the file selection panel, and change the bundle identifier to something unique, then set a team in the 'Signing' section.

• Select the Info tab at the top, then select URL Types at the end of the list, and put your redirect URL where it says SET_URL_HERE.

• Edit GooglePlatformConstants.h and set your Client ID and your redirect URL

• Run the app.

# Get your client ID

• Head to "https://console.cloud.google.com/project"

• Click "New Project", name it whatever you want, and click Create.

• Wait for the circle in the top right to finish spinning, it might take a couple of minutes.

• Go to "https://console.cloud.google.com/apis/api/embeddedassistant.googleapis.com/overview", make sure your project is selected, and click Enable at the top

• Go to Credentials, select "OAuth consent screen" at the top, and fill in whatever name you want, then hit save.

• Click "Create credentials" and select "OAuth client ID", select "iOS application", and type in a name (e.g "Google Assistant for iOS").

• Type the bundle identifier you typed in Xcode above, and hit create.

• Tap the pencil (edit) button, you should see your client ID and redirect URL that you need in the steps above.

# Known bugs
• Google's SDK sends responses in audio chunks, so it's impossible to know when exactly a response has ended. Due to the (broken?) design of my app, this means that responses might be split into two visual messages.

• Token extension is broken for some reason, you might have to re-login after a while.

• Bubbles are off center (see https://github.com/jessesquires/JSQMessagesViewController/issues/2074)
