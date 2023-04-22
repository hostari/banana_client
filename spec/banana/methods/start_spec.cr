require "../../spec_helper"

describe Banana do
  it "adds an inference call to the queue and returns a StartResult" do
    input = {
      "id"          => "xyz",            # **optional -** some uuid to identify the payload
      "created"     => 1682803630,       # **optional -** the current Unix timestamp in seconds
      "apiKey"      => "your-auth-key",  # **required -** your api key, for authorization
      "modelKey"    => "your-model-key", # **required -** the key giving you access to this model
      "startOnly"   => false,            # **optional -** boolean flag to tell backend to return a callID immediately, without awaiting results. Defaults to false.
      "modelInputs" => {
        "weight" => "1", #  ... # **required -** the json passed to the model inference server
      },
    }

    WebMock.stub(:post, "https://api.banana.dev/start/v4")
      .to_return(status: 200, body: File.read("spec/support/start_with_call_id.json"), headers: {"Content-Type" => "application/json"})

    client = Banana.client
    result = Banana.start(client, input.to_json)
    result.should be_a(Banana::StartResult)
  end
  it "adds an inference call to the queue and returned StartResult has an id" do
    input = {
      "id"          => "xyz",
      "created"     => 1682803630,
      "apiKey"      => "your-auth-key",
      "modelKey"    => "your-model-key",
      "startOnly"   => false,
      "modelInputs" => {
        "weight" => "1",
      },
    }

    WebMock.stub(:post, "https://api.banana.dev/start/v4")
      .to_return(status: 200, body: File.read("spec/support/start_with_call_id.json"), headers: {"Content-Type" => "application/json"})

    client = Banana.client
    result = Banana.start(client, input.to_json)
    result.id.should eq("xyz")
  end
  it "adds an inference call to the queue and returned StartResult has a message" do
    input = {
      "id"          => "xyz",
      "created"     => 1682803630,
      "apiKey"      => "your-auth-key",
      "modelKey"    => "your-model-key",
      "startOnly"   => false,
      "modelInputs" => {
        "weight" => "1",
      },
    }

    WebMock.stub(:post, "https://api.banana.dev/start/v4")
      .to_return(status: 200, body: File.read("spec/support/start_with_call_id.json"), headers: {"Content-Type" => "application/json"})

    client = Banana.client
    result = Banana.start(client, input.to_json)
    result.message.should eq("success")
  end
  it "adds an inference call to the queue and returned StartResult has a created timestamp" do
    input = {
      "id"          => "xyz",
      "created"     => 1682803630,
      "apiKey"      => "your-auth-key",
      "modelKey"    => "your-model-key",
      "startOnly"   => false,
      "modelInputs" => {
        "weight" => "1",
      },
    }

    WebMock.stub(:post, "https://api.banana.dev/start/v4")
      .to_return(status: 200, body: File.read("spec/support/start_with_call_id.json"), headers: {"Content-Type" => "application/json"})

    client = Banana.client
    result = Banana.start(client, input.to_json)
    result.created.should be_a(Time)
  end
  it "adds an inference call to the queue and returned StartResult has an api version" do
    input = {
      "id"          => "xyz",
      "created"     => 1682803630,
      "apiKey"      => "your-auth-key",
      "modelKey"    => "your-model-key",
      "startOnly"   => false,
      "modelInputs" => {
        "weight" => "1",
      },
    }

    WebMock.stub(:post, "https://api.banana.dev/start/v4")
      .to_return(status: 200, body: File.read("spec/support/start_with_call_id.json"), headers: {"Content-Type" => "application/json"})

    client = Banana.client
    result = Banana.start(client, input.to_json)
    result.api_version.should be_a(String)
  end
  it "adds an inference call to the queue and returned StartResult has a call_id" do
    input = {
      "id"          => "xyz",
      "created"     => 1682803630,
      "apiKey"      => "your-auth-key",
      "modelKey"    => "your-model-key",
      "startOnly"   => false,
      "modelInputs" => {
        "weight" => "1",
      },
    }

    WebMock.stub(:post, "https://api.banana.dev/start/v4")
      .to_return(status: 200, body: File.read("spec/support/start_with_call_id.json"), headers: {"Content-Type" => "application/json"})

    client = Banana.client
    result = Banana.start(client, input.to_json)
    result.call_id.should be_a(String)
  end
  it "adds an inference call to the queue and returned StartResult has a finished flag" do
    input = {
      "id"          => "xyz",
      "created"     => 1682803630,
      "apiKey"      => "your-auth-key",
      "modelKey"    => "your-model-key",
      "startOnly"   => false,
      "modelInputs" => {
        "weight" => "1",
      },
    }

    WebMock.stub(:post, "https://api.banana.dev/start/v4")
      .to_return(status: 200, body: File.read("spec/support/start_with_call_id.json"), headers: {"Content-Type" => "application/json"})

    client = Banana.client
    result = Banana.start(client, input.to_json)
    result.finished.should eq(true)
  end
end
