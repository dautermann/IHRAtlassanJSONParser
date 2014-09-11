
So here's a universal app that does my interpretation of what you were asking for.

1)  I reach into a JSON file ("ticketurljson") which is currently parked in the application bundle.  I've designed it so somebody could potentially bury "Ticket URLs" deep within the JSON and they should still be found.

2)  And once I have ticket URLS, we end up at a "ticket collection view" (yeah, probably not perfectly named but I did this across a little while in the middle of the night).  The number of rows equals the number of URLs found.

3)  Clicking on a row performs a push segue and passes along the Jira ticket we're interested in finding out more about.

4)  The data for which gets dumped into a UITextView.

Lots of in-line commenting and possible cleaning up I could do here, or another direction I might do for fun is to re-implement all this in Swift (as I'm working feverishly to get up to speed on the new language, even though I'm loaded down with keeping up to date with everything new in iOS 8, Yosemite, deprecated API's to consider updating, like UIAlertView to UIAlertController, etc.).

You know how it is....

Thanks for reading

Michael Dautermann
415-637-0694
