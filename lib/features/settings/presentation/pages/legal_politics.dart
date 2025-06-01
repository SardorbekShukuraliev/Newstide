import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/colors/color.dart';

class LegalPoliciesPage extends StatelessWidget {
  const LegalPoliciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontSize: 16, height: 1.5),
        ),
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(AppColor.Primary),
          thickness: MaterialStateProperty.all(6.0),
          radius: const Radius.circular(4.0),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Legal & Policies"),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/settings'),
          ),
        ),
        body: Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: const Text(
              """
1. Общие положения
Настоящие Условия использования определяют правила и положения, регулирующие доступ и использование приложения Updatss. Используя наше приложение, вы соглашаетесь соблюдать эти условия.

2. Права и обязанности пользователей
- Пользователь обязуется использовать приложение только в законных целях.
- Запрещено распространять вредоносные файлы, спам или любые формы мошенничества.
- Регистрация в сервисе предполагает предоставление корректной информации.

3. Конфиденциальность данных
Мы соблюдаем международные стандарты защиты данных. Подробнее о том, как мы обрабатываем ваши данные, смотрите в [Политике конфиденциальности](#).

4. Ограничение ответственности
- Мы не гарантируем бесперебойную работу сервиса, но приложим все усилия для устранения технических неполадок.
- Пользователь понимает и соглашается, что использование приложения осуществляется на его собственный риск.

5. Авторские права и интеллектуальная собственность
Все материалы, представленные в приложении, являются собственностью Updatss или используются с разрешения правообладателей. Любое копирование, распространение или модификация без согласия запрещены.

6. Права пользователя на удаление данных
Мы уважаем вашу конфиденциальность. Вы имеете право запросить удаление ваших персональных данных из системы. Для этого отправьте запрос в службу поддержки: support@updatss.com.

7. Изменения условий
Мы оставляем за собой право вносить изменения в настоящие Условия использования. Продолжение использования приложения после обновления означает согласие с новыми положениями.

8. Связь с нами
Если у вас есть вопросы, свяжитесь с нами по адресу: support@updatss.com
              """,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
