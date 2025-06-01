import 'package:dio/dio.dart';

class ApiErrorHandler {
  static String getErrorMessage(DioException error) {
    switch (error.response?.statusCode) {
      case 400:
        return "Неверный запрос. Проверь введённые данные.";
      case 401:
        return "Вы не авторизованы. Пожалуйста, войдите в аккаунт.";
      case 403:
        return "У вас нет доступа к этому ресурсу.";
      case 404:
        return "Страница не найдена. Возможно, новость удалена.";
      case 408:
        return "Истекло время ожидания. Попробуйте снова.";
      case 500:
        return "Ошибка на сервере. Мы уже всё чиним!";
      case 502:
        return "Плохой шлюз. Сервер недоступен.";
      case 503:
        return "Сервис временно недоступен. Зайдите позже.";
      case 504:
        return "Сервер не отвечает. Проверь подключение.";
      default:
        return "Произошла неизвестная ошибка. Попробуйте снова.";
    }
  }
}
