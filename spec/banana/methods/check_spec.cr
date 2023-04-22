require "../../spec_helper"

describe Banana do
  it "checks the status of the ongoing job and returns a CheckResult" do
    input = {
      "id"       => "xyz",            # **optional -** some uuid to identify the payload
      "created"  => 123123123123,     # **optional -** the current Unix timestamp in seconds
      "apiKey"   => "your-auth-key",  # **required -** your api key, for authorization
      "longPoll" => true,             # **suggested -** a flag telling the REST call wait on the server for results, up to 50s
      "callID"   => "call_abcabcabc", # **required -** the async task ID to fetch results for
    }

    WebMock.stub(:post, "https://api.banana.dev/check/v4")
      .to_return(status: 200, body: File.read("spec/support/check.json"), headers: {"Content-Type" => "application/json"})

    client = Banana.client
    result = Banana.check(client, input.to_json)
    result.should be_a(Banana::CheckResult)
  end
  it "checks the status of the ongoing job and returned CheckResult has an id" do
    input = {
      "id"       => "xyz",
      "created"  => 123123123123,
      "apiKey"   => "your-auth-key",
      "longPoll" => true,
      "callID"   => "call_abcabcabc",
    }

    WebMock.stub(:post, "https://api.banana.dev/check/v4")
      .to_return(status: 200, body: File.read("spec/support/check.json"), headers: {"Content-Type" => "application/json"})

    client = Banana.client
    result = Banana.check(client, input.to_json)
    result.id.should eq("xyz")
  end
  it "checks the status of the ongoing job and returned CheckResult has a message" do
    input = {
      "id"       => "xyz",
      "created"  => 123123123123,
      "apiKey"   => "your-auth-key",
      "longPoll" => true,
      "callID"   => "call_abcabcabc",
    }

    WebMock.stub(:post, "https://api.banana.dev/check/v4")
      .to_return(status: 200, body: File.read("spec/support/check.json"), headers: {"Content-Type" => "application/json"})

    client = Banana.client
    result = Banana.check(client, input.to_json)
    result.message.should eq("success")
  end
  it "checks the status of the ongoing job and returned CheckResult has a created timestamp" do
    input = {
      "id"       => "xyz",
      "created"  => 123123123123,
      "apiKey"   => "your-auth-key",
      "longPoll" => true,
      "callID"   => "call_abcabcabc",
    }

    WebMock.stub(:post, "https://api.banana.dev/check/v4")
      .to_return(status: 200, body: File.read("spec/support/check.json"), headers: {"Content-Type" => "application/json"})

    client = Banana.client
    result = Banana.check(client, input.to_json)
    result.created.should be_a(Time)
  end
  it "checks the status of the ongoing job and returned CheckResult has an api version" do
    input = {
      "id"       => "xyz",
      "created"  => 123123123123,
      "apiKey"   => "your-auth-key",
      "longPoll" => true,
      "callID"   => "call_abcabcabc",
    }

    WebMock.stub(:post, "https://api.banana.dev/check/v4")
      .to_return(status: 200, body: File.read("spec/support/check.json"), headers: {"Content-Type" => "application/json"})

    client = Banana.client
    result = Banana.check(client, input.to_json)
    result.api_version.should be_a(String)
  end
end
