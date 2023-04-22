class Banana::StartResult
  include JSON::Serializable

  getter id : String

  getter message : String

  @[JSON::Field(converter: Time::EpochConverter)]
  getter created : Time

  @[JSON::Field(key: "apiVersion")]
  getter api_version : String

  @[JSON::Field(key: "callID")]
  getter call_id : String

  getter finished : Bool

  @[JSON::Field(key: "modelOutputs")]
  getter model_outputs : Array(JSON::Any)?
end
