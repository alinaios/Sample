# Sample

User searches a TV show from a list https://api.tvmaze.com/ and previews the details

```
SwiftUI + Combine
Xcode Version 14.2
```

### Architectural Overview
![Feed Loader-3](https://user-images.githubusercontent.com/85871814/223987603-b375f36d-5556-4405-91b8-c2a66d8908b5.jpg)


### API contract of TV shows

```
200 RESPONSE      
### API Payload
[
    {
        "score": 0.9086446,
        "show": {
            "id": 139,
            "url": "https://www.tvmaze.com/shows/139/girls",
            "name": "Girls",
            "type": "Scripted",
            "language": "English",
            "genres": [
                "Drama",
                "Romance"
            ],
            "status": "Ended",
            "runtime": 30,
            "averageRuntime": 30,
            "premiered": "2012-04-15",
            "ended": "2017-04-16",
            "officialSite": "http://www.hbo.com/girls",
            "schedule": {
                "time": "22:00",
                "days": [
                    "Sunday"
                ]
            },
            "rating": {
                "average": 6.7
            },
            "weight": 97,
            "network": {
                "id": 8,
                "name": "HBO",
                "country": {
                    "name": "United States",
                    "code": "US",
                    "timezone": "America/New_York"
                },
                "officialSite": "https://www.hbo.com/"
            },
            "webChannel": null,
            "dvdCountry": null,
            "externals": {
                "tvrage": 30124,
                "thetvdb": 220411,
                "imdb": "tt1723816"
            },
            "image": {
                "medium": "https://static.tvmaze.com/uploads/images/medium_portrait/31/78286.jpg",
                "original": "https://static.tvmaze.com/uploads/images/original_untouched/31/78286.jpg"
            },
            "summary": "<p>This Emmy winning series is a comic look at the assorted humiliations and rare triumphs of a group of girls in their 20s.</p>",
            "updated": 1611310521,
            "_links": {
                "self": {
                    "href": "https://api.tvmaze.com/shows/139"
                },
                "previousepisode": {
                    "href": "https://api.tvmaze.com/episodes/1079686"
                }
            }
        }
    },
...]
```


### Scenarios (Acceptance Criteria)

```  
:white_check_mark: Given application has internet connection
When user launches the application
User can preview list of tv shows with predefined search query
```

``` 
:white_check_mark: Given application has NO internet connection
When user launches the application
User recieves no internet connection message and possibility to retry
```

``` 
:white_check_mark: Given application has internet connection
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
