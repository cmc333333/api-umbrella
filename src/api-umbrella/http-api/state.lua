local cjson = require "cjson"

local response = {
  file_config_version = ngx.shared.active_config:get("file_version"),
  db_config_version = ngx.shared.active_config:get("db_version"),
  db_config_last_fetched_at = ngx.shared.active_config:get("db_config_last_fetched_at"),
  api_users_last_fetched_at = ngx.shared.api_users:get("last_fetched_at"),
  distributed_rate_limits_last_pulled_at = ngx.shared.stats:get("distributed_last_pulled_at"),
  distributed_rate_limits_last_pushed_at = ngx.shared.stats:get("distributed_last_pushed_at"),
  upstreams_last_changed_at = ngx.shared.active_config:get("upstreams_last_changed_at"),
}

ngx.say(cjson.encode(response))
