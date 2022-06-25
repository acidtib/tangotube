ActiveJob::TrafficControl.client = Searchkick.redis

class Searchkick::BulkReindexJob
  concurrency 3
end

Searchkick.client_options = {
  url: ENV["ELASTICSEARCH_URL"],
  retry_on_failure: true,
  transport_options:
    { request: { timeout: 10000 } }
}

