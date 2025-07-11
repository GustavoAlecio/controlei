abstract interface class ILocalStorage<T> {
  Future<void> save(T data);
  Future<void> delete(String id);
  Future<void> update(T data);
  Future<List<T>> getAll();
  Future<T?> getById(dynamic id);
}