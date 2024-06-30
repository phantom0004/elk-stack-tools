# Sample Elasticsearch Queries

## 1. Search All Documents
GET /_search
{
  "query": {
    "match_all": {}
  }
}

## 2. Search Documents by Field
GET /apache-logs/_search
{
  "query": {
    "match": {
      "response": "200"
    }
  }
}

## 3. Aggregation Query
GET /apache-logs/_search
{
  "size": 0,
  "aggs": {
    "status_codes": {
      "terms": {
        "field": "response.keyword"
      }
    }
  }
}

## 4. Date Range Query
GET /apache-logs/_search
{
  "query": {
    "range": {
      "@timestamp": {
        "gte": "now-1d/d",
        "lt": "now/d"
      }
    }
  }
}
