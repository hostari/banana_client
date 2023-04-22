require "json"
require "http/client"

class Banana
  BASE_URL = URI.parse("https://api.banana.dev")

  def self.client : HTTP::Client
    HTTP::Client.new(BASE_URL)
  end

  START_PATH = "/start/v4"

  def self.start(client : HTTP::Client, input : String)
    headers = HTTP::Headers.new
    headers.add("Content-Type", "application/json")

    res = client.post(
      START_PATH, headers: headers, body: input
    )

    StartResult.from_json(res.body)
  end

  CHECK_PATH = "/check/v4"

  def self.check(client : HTTP::Client, input : String)
    headers = HTTP::Headers.new
    headers.add("Content-Type", "application/json")

    res = client.post(
      CHECK_PATH, headers: headers, body: input
    )

    CheckResult.from_json(res.body)
  end
end

require "./banana/**"
