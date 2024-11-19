abstract class MqttClient {
  void connect(String brokerUrl);
  void disconnect();
  void publish(String topic, String message);
  void subscribe(String topic);
  void unsubscribe(String topic);
}