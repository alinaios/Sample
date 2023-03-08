# Sample
 
User searches a TV show from a list https://api.tvmaze.com/ and previews the details


### Frameworks

SwiftUI + Combine

### Scenarios (Acceptance Criteria)

``` 
Given application has internet connection
When user launches the application
User can preview list of tv shows with predefined search query
```

``` 
Given application has NO internet connection
When user launches the application
User recieves no internet connection message and possibility to retry
```

``` 
Given application has internet connection
When user launches the application
User can preview list of tv shows with predefined search query
When user taps any specific show
User is navigated to preview show details
```

``` 
Given application has NO internet connection
When user taps any specific show
User is shown a message about no internet connection
```
