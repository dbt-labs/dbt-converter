{% docs src_twitter %}
**Status:** Inactive

Twitter data is replicated via a custom Singer tap ([see tap-twitter-search repo](https://github.com/dbt-labs/tap-twitter-search). Via this tap, we are using [Twitter's Search API](https://developer.twitter.com/en/docs/twitter-api/tweets/search/api-reference/get-tweets-search-recent) to extract Tweets & Users who've attached specified hashtags in their tweets.

In this case, we track the below hashtags:
- #dbtcoalesce

{% enddocs %}
