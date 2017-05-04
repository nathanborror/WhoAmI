# Who Am I

Example using [SFSafariViewController][1] to access previously stored cookies from
the Safari web browser. Useful in determining who a new user is after they've
installed your application.

This technique hides the presentation of the Safari view controller since the URL
immediatly redirects back to the app.

## Setup

Serve up `index.html` on `http://localhost:8000` using python:

    $ python -m SimpleHTTPServer

Build and run the app in Xcode and you should see the token populate pretty 
quickly after loading.

## Research

1. [How iOS 9's Safari View Controller could completely change your app’s onboarding experience][2]
2. [SFSafariViewController and OAuth – the Instagram example][3]

[1]:https://developer.apple.com/reference/safariservices/sfsafariviewcontroller
[2]:https://library.launchkit.io/how-ios-9-s-safari-view-controller-could-completely-change-your-app-s-onboarding-experience-2bcf2305137f
[3]:http://strawberrycode.com/blog/sfsafariviewcontroller-and-oauth-the-instagram-example/
