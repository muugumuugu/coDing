https://www.reddit.com/r/subreddit.json

--------

There are a couple of fields that you can use in order to fetch the next page on JSON.
You could either retrieve the 'name' of the last post, or instead of parsing the whole block, you can retrieve the last couple of fields from the JSON that reddit gives you.
There are a couple of fields that you can easily use to navigate pages forwards and backwards, they're conveniently called 'after' and 'before'
Having that value, you can mount your URL with it, which in this case is http://www.reddit.com/.json?count=25&after=t3_3gi42o