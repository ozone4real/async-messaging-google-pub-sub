# topic_name = "kisi-notifications"
require: "google/cloud/pubsub"

pubsub = Google::Cloud::Pubsub.new

topic = pubsub.topic "kisi-notifications"

topic.publish_async "user_signed_up", email: "ezenwaogbonna1@gmail.com", user_name: "ozone" do |result|
  raise "Failed to publish the message." unless result.succeeded?
  puts "Message with custom attributes published asynchronously."
end

topic.async_publisher.stop.wait!
