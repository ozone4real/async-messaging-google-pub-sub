require: "google/cloud/pubsub"

pubsub = Google::Cloud::Pubsub.new

subscription = pubsub.subscription "sign-ups"

subscriber = subscription.listen do |message|
  puts message.delivery_attempt, message.data, message.attributes
  message.acknowledge!
end

at_exit do
  subscriber.stop!(10)
end

subscriber.start
sleep

