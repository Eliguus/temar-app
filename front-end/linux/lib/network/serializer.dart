abstract class Serializer<T> {
  dynamic serialize(T instance);

  T deSerialize(json);
}
