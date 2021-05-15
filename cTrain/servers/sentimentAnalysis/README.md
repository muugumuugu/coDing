# server for an API that handles sentiment analysis

analyses text for mood using [afinn's sentiment-analysis word list](http://www2.imm.dtu.dk/pubdb/pubs/6010-full.html), and a additional database with words/scores customizable and expandable by user

>Launches @ http://localhost:4000/

>Hosted @ https://sentimentapi-codingtrain.glitch.me/

routes:

| root url | status  |
|--- | ---| 
| http://localhost:4000| local|
| https://sentimentapi-codingtrain.glitch.me| WWW |

+ /search/word
    + searches for a word in the overall db and gives its score
+ /add/word/score
    + adds word to db, if it is a repeat, score given here will over ride
+ /all
    + spits out customized word-score set.
+ /analyze
    + analyzes given text.

