# Who Am I

Example using [SFSafariViewController][1] to access previously stored cookies from
the Safari web browser. Useful in determining who a new user is after they've
installed your application.

This technique hides the presentation of the Safari view controller since the URL
immediatly redirects back to the app.

## Setup

1. Serve up `index.html` on `http://localhost:8000` using python: `python -m SimpleHTTPServer`
2. Visit `http://localhost:8000?set=mysecretcookie` to set an initial cookie.
3. Build and run the app in Xcode and you should see the token populate pretty quickly after loading.

## Research

1. [How iOS 9's Safari View Controller could completely change your app’s onboarding experience][2]
2. [SFSafariViewController and OAuth – the Instagram example][3]
3. [Clearing cookies in SFSafariViewController?][4]

[1]:https://developer.apple.com/reference/safariservices/sfsafariviewcontroller
[2]:https://library.launchkit.io/how-ios-9-s-safari-view-controller-could-completely-change-your-app-s-onboarding-experience-2bcf2305137f
[3]:http://strawberrycode.com/blog/sfsafariviewcontroller-and-oauth-the-instagram-example/
[4]:https://forums.developer.apple.com/message/105133#105133
